using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminExpenseRecords : System.Web.UI.Page
{
    string conStr = "Data Source=.;Initial Catalog=SmartFinance;Integrated Security=True;";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadExpenses();
        }
    }
    void LoadExpenses(string search = "", DateTime? from = null, DateTime? to = null)
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            string query = @"
                SELECT E.ExpenseId, U.FullName, E.Title, E.Category,
                       E.Amount, E.ExpenseDate, E.Notes
                FROM Expenses E
                INNER JOIN Users U ON E.UserId = U.Id
                WHERE (@search = '' OR E.Title LIKE @search OR E.Category LIKE @search)
                  AND (@from IS NULL OR E.ExpenseDate >= @from)
                  AND (@to IS NULL OR E.ExpenseDate <= @to)
                ORDER BY E.ExpenseId DESC";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@search", "%" + search + "%");
            cmd.Parameters.AddWithValue("@from", (object)from ?? DBNull.Value);
            cmd.Parameters.AddWithValue("@to", (object)to ?? DBNull.Value);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvExpense.DataSource = dt;
            gvExpense.DataBind();

            // Calculate total expense
            decimal total = 0;
            foreach (DataRow row in dt.Rows)
            {
                total += Convert.ToDecimal(row["Amount"]);
            }
            lblTotal.Text = total.ToString("N2");
        }
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        DateTime? from = null;
        DateTime? to = null;

        if (!string.IsNullOrEmpty(txtFrom.Text))
        {
            from = Convert.ToDateTime(txtFrom.Text);
        }

        if (!string.IsNullOrEmpty(txtTo.Text))
        {
            to = Convert.ToDateTime(txtTo.Text);
        }

        LoadExpenses(txtSearch.Text.Trim(), from, to);
    }

    protected void gvExpense_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteExpense")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            DeleteExpense(id);
            LoadExpenses();
        }
    }

    void DeleteExpense(int id)
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Expenses WHERE ExpenseId=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }
}