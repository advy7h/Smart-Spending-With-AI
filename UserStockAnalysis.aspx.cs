using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class UserStockAnalysis : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

        if (!IsPostBack)
        {
            RegisterAsyncTask(new PageAsyncTask(LoadStockData));
        }
    }

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        RegisterAsyncTask(new PageAsyncTask(LoadStockData));
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        RegisterAsyncTask(new PageAsyncTask(LoadStockData));
    }

    private async Task LoadStockData()
    {
        string url = "https://query1.finance.yahoo.com/v8/finance/chart/RELIANCE.NS?interval=1m&range=1d";

        try
        {
            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Add("User-Agent", "Mozilla/5.0");

                string json = await client.GetStringAsync(url);
                JObject obj = JObject.Parse(json);

                var result = obj["chart"]["result"];
                if (result == null || !result.HasValues)
                    throw new Exception("No data received");

                var data = result[0];
                var meta = data["meta"];

                // ===== SAFE VALUE EXTRACTION =====
                double price = 0;
                double prevClose = 0;

                if (meta["regularMarketPrice"] != null)
                    price = meta["regularMarketPrice"].Value<double>();

                if (meta["previousClose"] != null)
                    prevClose = meta["previousClose"].Value<double>();

                double change = price - prevClose;
                double percent = prevClose != 0 ? (change / prevClose) * 100 : 0;

                lblPrice.Text = "₹ " + price.ToString("0.00");
                lblChange.Text = change.ToString("0.00");
                lblPercent.Text = percent.ToString("0.00") + " %";

                // ===== SAFE ARRAY EXTRACTION =====
                JArray timestampArray = data["timestamp"] as JArray;

                JArray closeArray = null;

                if (data["indicators"] != null &&
                    data["indicators"]["quote"] != null &&
                    data["indicators"]["quote"][0] != null &&
                    data["indicators"]["quote"][0]["close"] != null)
                {
                    closeArray = data["indicators"]["quote"][0]["close"] as JArray;
                }

                if (timestampArray == null || closeArray == null)
                    throw new Exception("Chart data missing");

                int count = Math.Min(20, closeArray.Count);

                List<string> times = new List<string>();
                List<string> prices = new List<string>();

                for (int i = closeArray.Count - count; i < closeArray.Count; i++)
                {
                    if (closeArray[i] == null || closeArray[i].Type == JTokenType.Null)
                        continue;

                    long ts = timestampArray[i].Value<long>();
                    DateTime time = DateTimeOffset.FromUnixTimeSeconds(ts).LocalDateTime;

                    times.Add(time.ToString("HH:mm"));
                    prices.Add(closeArray[i].Value<double>().ToString("0.00"));
                }

                hfTimes.Value = string.Join(",", times);
                hfPrices.Value = string.Join(",", prices);

                lblStatus.Text = "🟢 Live Updated at " + DateTime.Now.ToLongTimeString();
            }
        }
        catch (Exception ex)
        {
            lblStatus.Text = "❌ " + ex.Message;
        }
    }
}