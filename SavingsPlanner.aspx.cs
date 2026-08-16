using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SavingsPlanner : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        SqlConnection conn = null;

        try
        {
            int userId = Convert.ToInt32(Session["UserId"]);

            decimal income = Convert.ToDecimal(txtIncome.Text);
            decimal goal = Convert.ToDecimal(txtGoal.Text);

            decimal recommendedMonthly = goal / 12;
            decimal recommendedDaily = recommendedMonthly / 30;

            // Display results
            lblDaily.Text = "₹ " + recommendedDaily.ToString("N2");
            lblMonthly.Text = "₹ " + recommendedMonthly.ToString("N2");

            // AI Advice (simple logic)
            if (goal > income * 0.5m)
                lblAdvice.Text = "Your savings goal is too high compared to income. Try a realistic goal.";
            else
                lblAdvice.Text = "Great goal! You can achieve it with consistent savings.";

            // Save to database
            conn = DbConnection.GetConnection();

            string query = @"INSERT INTO SavingsPlan 
                                 (UserId, MonthlyIncome, SavingsGoal, RecommendedDailySavings)
                                 VALUES (@UserId, @Income, @Goal, @Daily)";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@Income", income);
            cmd.Parameters.AddWithValue("@Goal", goal);
            cmd.Parameters.AddWithValue("@Daily", recommendedDaily);

            cmd.ExecuteNonQuery();

            lblMessage.Text = "Savings Plan Saved Successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error: " + ex.Message;
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
        finally
        {
            DbConnection.CloseConnection(conn);
        }
    }
}
