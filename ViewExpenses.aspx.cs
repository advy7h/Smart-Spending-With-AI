using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewExpenses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["UserId"] = "1";
        if (!IsPostBack)
        {
            LoadExpenses();
            LoadMonthlyCategoryExpenses();
            LoadMonthlyTotal();
        }
    }
    private void LoadExpenses()
    {
        SqlConnection conn = null;

        try
        {
            int userId = Convert.ToInt32(Session["UserId"]);

            conn = DbConnection.GetConnection();

            string query = "SELECT ExpenseId, Title, Category, Amount, ExpenseDate, Notes FROM Expenses WHERE UserId=@UserId ORDER BY ExpenseDate DESC";

            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.SelectCommand.Parameters.AddWithValue("@UserId", userId);

            DataTable dt = new DataTable();
            da.Fill(dt);

            gvExpenses.DataSource = dt;
            gvExpenses.DataBind();
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

    protected void gvExpenses_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection conn = null;

        try
        {
            int expenseId = Convert.ToInt32(gvExpenses.DataKeys[e.RowIndex].Value);

            conn = DbConnection.GetConnection();

            string query = "DELETE FROM Expenses WHERE ExpenseId=@ExpenseId";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@ExpenseId", expenseId);

            cmd.ExecuteNonQuery();

            lblMessage.Text = "Expense deleted successfully.";
            lblMessage.ForeColor = System.Drawing.Color.Green;

            LoadExpenses();
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

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        
    }
    private void LoadMonthlyCategoryExpenses()
    {
        SqlConnection conn = null;
        try
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            conn = DbConnection.GetConnection();

            string query = @"
        SELECT 
            DATENAME(MONTH, ExpenseDate) AS MonthName,
            YEAR(ExpenseDate) AS Year,
            Category,
            SUM(Amount) AS TotalAmount
        FROM Expenses
        WHERE UserId = @UserId
        GROUP BY YEAR(ExpenseDate), DATENAME(MONTH, ExpenseDate), Category
        ORDER BY Year DESC, MonthName";

            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.SelectCommand.Parameters.AddWithValue("@UserId", userId);

            DataTable dt = new DataTable();
            da.Fill(dt);

            gvMonthlyCategory.DataSource = dt;
            gvMonthlyCategory.DataBind();
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error: " + ex.Message;
        }
        finally
        {
            DbConnection.CloseConnection(conn);
        }
    }
    private void LoadMonthlyTotal()
    {
        SqlConnection conn = null;
        try
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            conn = DbConnection.GetConnection();

            string query = @"
        SELECT 
            DATENAME(MONTH, ExpenseDate) AS MonthName,
            YEAR(ExpenseDate) AS Year,
            SUM(Amount) AS MonthlyTotal
        FROM Expenses
        WHERE UserId = @UserId
        GROUP BY YEAR(ExpenseDate), DATENAME(MONTH, ExpenseDate)
        ORDER BY Year DESC, MonthName";

            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.SelectCommand.Parameters.AddWithValue("@UserId", userId);

            DataTable dt = new DataTable();
            da.Fill(dt);

            gvMonthlyTotal.DataSource = dt;
            gvMonthlyTotal.DataBind();
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error: " + ex.Message;
        }
        finally
        {
            DbConnection.CloseConnection(conn);
        }
    }
    

}
