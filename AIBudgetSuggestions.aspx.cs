using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AIBudgetSuggestions : System.Web.UI.Page
{
    public string Food = "0", Rent = "0", Transport = "0", Entertainment = "0", Emergency = "0";
    public string RFood = "0", RRent = "0", RTransport = "0", REntertainment = "0", REmergency = "0";

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSuggest_Click(object sender, EventArgs e)
    {
        double income = Convert.ToDouble(txtIncome.Text);
        double expenses = Convert.ToDouble(txtExpenses.Text);

        List<string> selected = new List<string>();

        foreach (ListItem item in chkCategories.Items)
        {
            if (item.Selected)
                selected.Add(item.Value);
        }

        int count = selected.Count;
        if (count == 0) return;

        double per = expenses / count;

        double food = 0, rent = 0, transport = 0, entertainment = 0, emergency = 0;

        foreach (string cat in selected)
        {
            if (cat == "Food") food = per;
            if (cat == "Rent") rent = per;
            if (cat == "Transport") transport = per;
            if (cat == "Entertainment") entertainment = per;
            if (cat == "Emergency") emergency = per;
        }

        lblFood.Text = food.ToString("0.00");
        lblRent.Text = rent.ToString("0.00");
        lblTransport.Text = transport.ToString("0.00");
        lblEntertainment.Text = entertainment.ToString("0.00");
        lblEmergency.Text = emergency.ToString("0.00");

        double r_food = income * 0.25;
        double r_rent = income * 0.30;
        double r_transport = income * 0.10;
        double r_entertainment = income * 0.05;
        double r_emergency = income * 0.05;
        double r_savings = income * 0.25;

        lblRFood.Text = r_food.ToString("0.00");
        lblRRent.Text = r_rent.ToString("0.00");
        lblRTransport.Text = r_transport.ToString("0.00");
        lblREntertainment.Text = r_entertainment.ToString("0.00");
        lblREmergency.Text = r_emergency.ToString("0.00");
        lblRSavings.Text = r_savings.ToString("0.00");

        Food = food.ToString();
        Rent = rent.ToString();
        Transport = transport.ToString();
        Entertainment = entertainment.ToString();
        Emergency = emergency.ToString();

        RFood = r_food.ToString();
        RRent = r_rent.ToString();
        RTransport = r_transport.ToString();
        REntertainment = r_entertainment.ToString();
        REmergency = r_emergency.ToString();

        pnlResult.Visible = true;

        string msg = "";

        if (food > r_food) msg += "🍔 Food spending high<br/>";
        if (rent > r_rent) msg += "🏠 Rent spending high<br/>";
        if (expenses < income * 0.5) msg += "💰 Good savings habit<br/>";

        if (msg == "") msg = "✅ Balanced budget";

        lblInsights.Text = msg;
    }

    protected void btnPredict_Click(object sender, EventArgs e)
    {
        double m1 = Convert.ToDouble(txtMonth1.Text);
        double m2 = Convert.ToDouble(txtMonth2.Text);
        double m3 = Convert.ToDouble(txtMonth3.Text);

        double trend = (m3 - m1) / 2;
        double predicted = m3 + trend;

        lblPrediction.Text = predicted.ToString("0.00");
    }
}

