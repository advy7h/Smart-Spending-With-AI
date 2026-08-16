using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminDashboard : System.Web.UI.Page
{
    string conStr = "Data Source=.;Initial Catalog=SmartFinance;Integrated Security=True;";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadStats();
            LoadUsers();
            LoadExpenses();
        }
    }
    void LoadStats()
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT
                (SELECT COUNT(*) FROM Users) AS TotalUsers,
                (SELECT ISNULL(SUM(Amount),0) FROM Income) AS TotalIncome,
                (SELECT ISNULL(SUM(Amount),0) FROM Expenses) AS TotalExpense,
                (SELECT ISNULL(SUM(Food + Rent + Transport + Shopping + Emergency),0) FROM Budgets) AS TotalBudget
            ", con);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblUsers.Text = dr["TotalUsers"].ToString();
                lblIncome.Text = Convert.ToDecimal(dr["TotalIncome"]).ToString("N2");
                lblExpense.Text = Convert.ToDecimal(dr["TotalExpense"]).ToString("N2");
                lblBudget.Text = Convert.ToDecimal(dr["TotalBudget"]).ToString("N2");
            }
        }
    }

    void LoadUsers()
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT TOP 5 Id, FullName, Email, MonthlyIncome FROM Users ORDER BY Id DESC", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvUsers.DataSource = dt;
            gvUsers.DataBind();
        }
    }

    void LoadExpenses()
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT TOP 5 ExpenseId, Title, Category, Amount, ExpenseDate FROM Expenses ORDER BY ExpenseId DESC", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvExpenses.DataSource = dt;
            gvExpenses.DataBind();
        }
    }
}