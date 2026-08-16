using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // Session["UserEmail"] = "anoop@gmail.com";
        if (!IsPostBack)
        {
            LoadProfile();
        }
    }
    private void LoadProfile()
    {
        // Assume user email stored in session after login
        string email = Session["UserEmail"].ToString();

        if (string.IsNullOrEmpty(email))
        {
            Response.Redirect("Login.aspx");
            return;
        }

        using (SqlConnection conn = DbConnection.GetConnection())
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT FullName, Email, Phone, MonthlyIncome FROM Users WHERE Email=@Email", conn
            );

            cmd.Parameters.AddWithValue("@Email", email);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                txtName.Text = dr["FullName"].ToString();
                txtEmail.Text = dr["Email"].ToString();
                txtPhone.Text = dr["Phone"].ToString();
                txtIncome.Text = dr["MonthlyIncome"].ToString();
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string email = Session["UserEmail"].ToString();

        if (string.IsNullOrEmpty(email))
        {
            Response.Redirect("Login.aspx");
            return;
        }

        using (SqlConnection conn = DbConnection.GetConnection())
        {
            SqlCommand cmd = new SqlCommand(
                "UPDATE Users SET FullName=@Name, Phone=@Phone, MonthlyIncome=@Income WHERE Email=@Email", conn
            );

            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
            cmd.Parameters.AddWithValue("@Income", txtIncome.Text);
            cmd.Parameters.AddWithValue("@Email", email);

            int result = cmd.ExecuteNonQuery();
            lblMessage.Text = result > 0 ? "✅ Profile updated successfully!" : "❌ Update failed.";
        }
    }
}
