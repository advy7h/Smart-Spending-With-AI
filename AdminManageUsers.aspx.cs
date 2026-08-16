using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminManageUsers : System.Web.UI.Page
{
    string conStr = "Data Source=.;Initial Catalog=SmartFinance;Integrated Security=True;";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadUsers();
        }
    }
    void LoadUsers(string search = "")
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            string query = @"SELECT Id, FullName, Email, Phone, MonthlyIncome
                             FROM Users
                             WHERE FullName LIKE @search OR Email LIKE @search
                             ORDER BY Id DESC";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@search", "%" + search + "%");

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvUsers.DataSource = dt;
            gvUsers.DataBind();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadUsers(txtSearch.Text.Trim());
    }

    protected void gvUsers_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        int userId = Convert.ToInt32(e.CommandArgument);

        if (e.CommandName == "DeleteUser")
        {
            DeleteUser(userId);
        }
        

        LoadUsers();
    }

    void DeleteUser(int id)
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Users WHERE Id=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

   
}