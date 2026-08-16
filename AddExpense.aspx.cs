using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddExpense : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["UserId"] = "1";
    }

    protected void btnAddExpense_Click(object sender, EventArgs e)
    {
        SqlConnection conn = null;

        try
        {
            int userId = Convert.ToInt32(Session["UserId"]);

            conn = DbConnection.GetConnection();

            string query = @"INSERT INTO Expenses (UserId, Title, Category, Amount, ExpenseDate, Notes)
                                 VALUES (@UserId, @Title, @Category, @Amount, @ExpenseDate, @Notes)";

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
            cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@Amount", Convert.ToDecimal(txtAmount.Text));
            cmd.Parameters.AddWithValue("@ExpenseDate", Convert.ToDateTime(txtDate.Text));
            cmd.Parameters.AddWithValue("@Notes", txtNotes.Text.Trim());

            cmd.ExecuteNonQuery();

            lblMessage.Text = "Expense added successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;

            // Clear form
            txtTitle.Text = "";
            txtAmount.Text = "";
            txtDate.Text = "";
            txtNotes.Text = "";
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