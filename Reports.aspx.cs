using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reports : System.Web.UI.Page
{
    protected decimal totalIncome = 0;
    protected decimal totalExpense = 0;
    public static string userid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        userid = Session["UserId"].ToString();
        if (!IsPostBack)
        {
            LoadSummary();
            LoadExpenses();
        }
    }
    private void LoadSummary()
    {
        SqlConnection con = DbConnection.GetConnection();

        try
        {
            int userid = Convert.ToInt32(Session["UserId"]);

            // -----------------------------
            // TOTAL EXPENSE
            // -----------------------------
            SqlCommand cmdExpense = new SqlCommand(
                "SELECT ISNULL(SUM(Amount),0) FROM Expenses WHERE UserId = @UserId", con);

            cmdExpense.Parameters.AddWithValue("@UserId", userid);
            totalExpense = Convert.ToDecimal(cmdExpense.ExecuteScalar());

            // -----------------------------
            // TOTAL INCOME (DYNAMIC)
            // -----------------------------
            SqlCommand cmdIncome = new SqlCommand(
                "SELECT ISNULL(SUM(Amount),0) FROM Income WHERE UserId = @UserId", con);

            cmdIncome.Parameters.AddWithValue("@UserId", userid);
            totalIncome = Convert.ToDecimal(cmdIncome.ExecuteScalar());

            // -----------------------------
            // CALCULATE SAVINGS
            // -----------------------------
            decimal savings = totalIncome - totalExpense;

            // DISPLAY
            lblIncome.Text = "₹" + totalIncome.ToString("0.00");
            lblExpense.Text = "₹" + totalExpense.ToString("0.00");
            lblSavings.Text = "₹" + savings.ToString("0.00");

            // Inject JS
            ClientScript.RegisterStartupScript(this.GetType(), "chart",
                "loadChart({totalExpense}, {totalIncome});", true);
        }
        catch { }
        finally
        {
            DbConnection.CloseConnection(con);
        }
    }

    private void LoadExpenses()
    {
        SqlConnection con = DbConnection.GetConnection();

        try
        {
            SqlCommand cmd = new SqlCommand("SELECT ExpenseDate, Category, Amount FROM Expenses where userid="+userid+"", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvReport.DataSource = dt;
            gvReport.DataBind();
        }
        catch { }
        finally
        {
            DbConnection.CloseConnection(con);
        }
    }
}
