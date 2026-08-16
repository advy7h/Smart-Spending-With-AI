using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection conn = null;

        try
        {
            conn = DbConnection.GetConnection();

            string query = "SELECT * FROM Users WHERE Email=@Email AND Password=@Password";
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

            SqlDataReader reader = cmd.ExecuteReader();      

            if (reader.Read())
            {
                // Store user info in Session
                Session["UserId"] = reader["Id"].ToString();
                Session["UserName"] = reader["FullName"].ToString();
                Session["UserEmail"] = reader["Email"].ToString();
                // Redirect to Dashboard
                if (txtEmail.Text == "admin@gmail.com")
                {
                    Response.Redirect("AdminDashboard.aspx");

                }
                else
                {

                    Response.Redirect("UserDashboard.aspx");
                }
            }
            else
            {
                lblMessage.Text = "Invalid email or password!";
            }
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
