using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminIncomeRecords : System.Web.UI.Page
{
    string conStr = "Data Source=.;Initial Catalog=SmartFinance;Integrated Security=True;";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadIncome();
        }
    }
    void LoadIncome(string search = "", DateTime? from = null, DateTime? to = null)
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            string query = @"
                SELECT I.Id, U.FullName, I.Source, I.Amount, I.IncomeDate, I.Notes
                FROM Income I
                INNER JOIN Users U ON I.UserId = U.Id
                WHERE (@search = '' OR U.FullName LIKE @search OR I.Source LIKE @search)
                  AND (@from IS NULL OR I.IncomeDate >= @from)
                  AND (@to IS NULL OR I.IncomeDate <= @to)
                ORDER BY I.Id DESC";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@search", "%" + search + "%");
            cmd.Parameters.AddWithValue("@from", (object)from ?? DBNull.Value);
            cmd.Parameters.AddWithValue("@to", (object)to ?? DBNull.Value);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvIncome.DataSource = dt;
            gvIncome.DataBind();

            // Total calculation
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

        LoadIncome(txtSearch.Text.Trim(), from, to);
    }

    protected void gvIncome_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteIncome")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            DeleteIncome(id);
            LoadIncome();
        }
    }

    void DeleteIncome(int id)
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Income WHERE Id=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }
}