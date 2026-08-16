using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserViewMessage : System.Web.UI.Page
{
    string conStr = "Data Source=.;Initial Catalog=SmartFinance;Integrated Security=True;";
    public string email = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        
        email = Session["UserEmail"].ToString();
        //email = "anoop@gmail.com";
        if (!IsPostBack)
        {
            LoadMessages();
        }

    }
    void LoadMessages()
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            string query = "SELECT * FROM Messages where Email='"+email+"' ORDER BY CreatedDate DESC";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvMessages.DataSource = dt;
            gvMessages.DataBind();
        }
    }

    protected void gvMessages_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ViewMsg")
        {
            int id = Convert.ToInt32(e.CommandArgument);

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "UPDATE Messages SET IsRead = 1 WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("ViewMessageDetails.aspx?Id=" + id);
        }
    }
}