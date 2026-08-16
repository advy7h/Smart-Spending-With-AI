using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminViewMessage : System.Web.UI.Page
{
    string conStr = "Data Source=.;Initial Catalog=SmartFinance;Integrated Security=True;";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && Request.QueryString["Id"] != null)
        {
            LoadMessage();
        }
    }
    void LoadMessage()
    {
        int id = Convert.ToInt32(Request.QueryString["Id"]);

        using (SqlConnection con = new SqlConnection(conStr))
        {
            string query = "SELECT * FROM Messages WHERE Id=@Id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Id", id);
            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblName.Text = dr["Name"].ToString();
                lblEmail.Text = dr["Email"].ToString();
                lblSubject.Text = dr["Subject"].ToString();
                lblMessage.Text = dr["Message"].ToString();
            }
        }
    }
}