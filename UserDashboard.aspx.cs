using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["UserId"] = "1";
        //Session["UserName"] = "Anoop";
        if (Session["UserId"] == null)
        {
            Response.Redirect("LoginPage.aspx");
        }

        if (!IsPostBack)
        {
            lblUserName.Text = Session["UserName"].ToString();
            LoadStats();
            LoadRecentTransactions();
        }
    }
    private void LoadStats()
    {
        SqlConnection conn = null;

        try
        {
            conn = DbConnection.GetConnection();
            string userId = Session["UserId"].ToString();

            SqlCommand cmdIncome = new SqlCommand(
                "SELECT ISNULL(SUM(Amount),0) FROM Income WHERE UserId=@UserId", conn);
            cmdIncome.Parameters.AddWithValue("@UserId", userId);
            lblIncome.Text = cmdIncome.ExecuteScalar().ToString();

            SqlCommand cmdExpense = new SqlCommand(
                "SELECT ISNULL(SUM(Amount),0) FROM Expenses WHERE UserId=@UserId", conn);
            cmdExpense.Parameters.AddWithValue("@UserId", userId);
            lblExpenses.Text = cmdExpense.ExecuteScalar().ToString();

            decimal income = Convert.ToDecimal(lblIncome.Text);
            decimal expenses = Convert.ToDecimal(lblExpenses.Text);
            lblSavings.Text = (income - expenses).ToString();
        }
        finally
        {
            DbConnection.CloseConnection(conn);
        }
    }

    private void LoadRecentTransactions()
    {
        SqlConnection conn = null;

        try
        {
            conn = DbConnection.GetConnection();
            string userId = Session["UserId"].ToString();

            string query = @"SELECT TOP 5 Title, Amount, ExpenseDate 
                                 FROM Expenses 
                                 WHERE UserId=@UserId
                                 ORDER BY ExpenseDate DESC";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@UserId", userId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvRecent.DataSource = dt;
            gvRecent.DataBind();
        }
        finally
        {
            DbConnection.CloseConnection(conn);
        }
    }
}
