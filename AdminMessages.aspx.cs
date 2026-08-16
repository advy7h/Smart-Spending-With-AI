using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMessages : System.Web.UI.Page
{
    string conStr = "Data Source=.;Initial Catalog=SmartFinance;Integrated Security=True;";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMessages();
        }
    }
    void LoadMessages(string search = "")
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            string query = @"SELECT Id, Name, Email, Subject, Message, CreatedDate, IsRead
FROM Messages
WHERE (Name LIKE @search OR Email LIKE @search)
  AND Email = 'admin@gmail.com'
ORDER BY CreatedDate DESC;";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@search", "%" + search + "%");

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvMessages.DataSource = dt;
            gvMessages.DataBind();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadMessages(txtSearch.Text.Trim());
    }

    protected void gvMessages_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);

        if (e.CommandName == "View")
        {
            MarkAsRead(id);
            Response.Redirect("AdminViewMessage.aspx?id=" + id);
        }
        else if (e.CommandName == "DeleteMsg")
        {
            DeleteMessage(id);
            LoadMessages();
        }
    }

    void MarkAsRead(int id)
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(
                "UPDATE Messages SET IsRead = 1 WHERE Id=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    void DeleteMessage(int id)
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            SqlCommand cmd = new SqlCommand(
                "DELETE FROM Messages WHERE Id=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

}