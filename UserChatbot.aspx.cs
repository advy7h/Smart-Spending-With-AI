using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserChatbot : System.Web.UI.Page
{
    string connStr = @"Data Source=.;Initial Catalog=SmartFinance;Integrated Security=True";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["Chat"] = "";
        }
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        string userMsg = txtMessage.Text.Trim();
        string botReply = GetAnswer(userMsg);

        StringBuilder chat = new StringBuilder(ViewState["Chat"].ToString());

        // User Message
        chat.Append("<div class='user-msg'><div class='bubble user'>" + userMsg + "</div></div>");

        // Bot Message
        chat.Append("<div class='bot-msg'><div class='bubble bot'>" + botReply + "</div></div>");

        ViewState["Chat"] = chat.ToString();
        litChat.Text = chat.ToString();

        txtMessage.Text = "";
        string safeText = botReply
    .Replace("'", "\\'")
    .Replace("\r", "")
    .Replace("\n", " ");

        ScriptManager.RegisterStartupScript(
            this,
            GetType(),
            "voice",
            "speak('" + safeText + "')",
            true
        );
    }

    private string GetAnswer(string question)
    {
        string answer = "Sorry, I didn't understand. Try another question.";

        using (SqlConnection con = new SqlConnection(connStr))
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT Question, Answer FROM QA_Bot", con);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                string dbQuestion = dr["Question"].ToString().ToLower();

                // Split into keywords
                var words = dbQuestion.Split(' ');

                foreach (var word in words)
                {
                    if (question.ToLower().Contains(word))
                    {
                        return dr["Answer"].ToString();
                    }
                }
            }
        }

        return answer;
    }
}
