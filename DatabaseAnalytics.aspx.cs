using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PdfSharp.Pdf;
using PdfSharp.Drawing;

public partial class DatabaseAnalytics : System.Web.UI.Page
{
    public static string userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAnalytics();
        }
      
        
    }

    private void LoadAnalytics()
    {
        // userid = "1";
        userid = Session["UserId"].ToString();
        using (SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=SmartFinance;Integrated Security=True;"))
        {
            conn.Open();

            // Total Income
            SqlCommand cmdIncome = new SqlCommand(
                "SELECT ISNULL(SUM(MonthlyIncome),0) FROM SavingsPlan WHERE userId = @userid", conn);
            cmdIncome.Parameters.AddWithValue("@userid", userid);
            lblTotalIncome.Text = cmdIncome.ExecuteScalar().ToString();

            // Total Expenses
            SqlCommand cmdExpense = new SqlCommand(
                "SELECT ISNULL(SUM(Amount),0) FROM Expenses WHERE userid = @userid", conn);
            cmdExpense.Parameters.AddWithValue("@userid", userid);
            lblTotalExpenses.Text = cmdExpense.ExecuteScalar().ToString();

            // Total Savings
            decimal income = Convert.ToDecimal(lblTotalIncome.Text);
            decimal expenses = Convert.ToDecimal(lblTotalExpenses.Text);
            lblTotalSavings.Text = (income - expenses).ToString();

            // Category-wise Expenses
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT Category, SUM(Amount) AS Total FROM Expenses WHERE userid = @userid GROUP BY Category", conn);
            da.SelectCommand.Parameters.AddWithValue("@userid", userid);

            DataTable dt = new DataTable();
            da.Fill(dt);
            gvCategories.DataSource = dt;
            gvCategories.DataBind();
        }
    }
   
}
