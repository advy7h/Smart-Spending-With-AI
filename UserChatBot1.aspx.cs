using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserChatBot1 : System.Web.UI.Page
{
    static readonly HttpClient client = new HttpClient(new HttpClientHandler()
    {
        ServerCertificateCustomValidationCallback = (message, cert, chain, errors) => true
    });

    protected void Page_Load(object sender, EventArgs e)
    {
        // 🔥 FIX: Enable TLS 1.2
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

        if (!IsPostBack)
        {
            Session["ChatHistory"] = new List<Tuple<string, string>>();
        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        Page.RegisterAsyncTask(new PageAsyncTask(ProcessChat));
    }

    private async Task ProcessChat()
    {
        try
        {
            string userMessage = txtMessage.Text;

            if (string.IsNullOrWhiteSpace(userMessage))
                return;

            var history = (List<Tuple<string, string>>)Session["ChatHistory"];

            history.Add(new Tuple<string, string>("user", userMessage));

            string reply = await GetChatResponse(history);

            history.Add(new Tuple<string, string>("assistant", reply));

            StringBuilder chatHtml = new StringBuilder();

            foreach (var msg in history)
            {
                if (msg.Item1 == "user")
                    chatHtml.Append("<div class='user'><b>You:</b> " + Server.HtmlEncode(msg.Item2) + "</div>");
                else
                    chatHtml.Append("<div class='bot'><b>Bot:</b> " + Server.HtmlEncode(msg.Item2) + "</div>");
            }

            litChat.Text = chatHtml.ToString();
            txtMessage.Text = "";
        }
        catch (Exception ex)
        {
            litChat.Text += "<div style='color:red;'>Error: " + Server.HtmlEncode(ex.ToString()) + "</div>";
        }
    }

    private async Task<string> GetChatResponse(List<Tuple<string, string>> history)
    {
        try
        {
            string apiKey = ConfigurationManager.AppSettings["OPENROUTER_API_KEY"];
            string url = "https://openrouter.ai/api/v1/chat/completions";

            var messages = new List<object>();

            foreach (var msg in history)
            {
                messages.Add(new
                {
                    role = msg.Item1,
                    content = msg.Item2
                });
            }

            var requestBody = new
            {
                model = "meta-llama/llama-3-8b-instruct",
                messages = messages,
                max_tokens = 200
            };

            var json = JsonConvert.SerializeObject(requestBody);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            client.DefaultRequestHeaders.Clear();
            client.DefaultRequestHeaders.Add("Authorization", "Bearer " + apiKey);
            client.DefaultRequestHeaders.Add("HTTP-Referer", "http://localhost");
            client.DefaultRequestHeaders.Add("X-Title", "ASP.NET Chatbot");
            client.DefaultRequestHeaders.Add("User-Agent", "ASP.NET Chatbot");

            var response = await client.PostAsync(url, content);
            var result = await response.Content.ReadAsStringAsync();

            if (!response.IsSuccessStatusCode)
            {
                return "API Error: " + result;
            }

            dynamic obj = JsonConvert.DeserializeObject(result);

            return obj.choices[0].message.content.ToString();
        }
        catch (Exception ex)
        {
            return "Error: " + ex.ToString();
        }
    }
}
