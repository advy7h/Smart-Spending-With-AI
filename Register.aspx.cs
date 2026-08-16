using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void txtConfirm_TextChanged(object sender, EventArgs e)
    {

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        //if (!System.Text.RegularExpressions.Regex.IsMatch(txtEmail.Text, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
        //{
        //    lblMessage.Text = "Invalid email format";
        //    return;
        //}

        //if (!System.Text.RegularExpressions.Regex.IsMatch(txtPhone.Text, @"^[6-9]\d{9}$"))
        //{
        //    lblMessage.Text = "Invalid phone number";
        //    return;
        //}
        // Basic validations
        if (txtPassword.Text != txtConfirmPassword.Text)
        {
            lblMessage.Text = "Passwords do not match!";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        if (txtPhone.Text.Length < 10)
        {
            lblMessage.Text = "Please enter a valid phone number!";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        SqlConnection conn = null;

        try
        {
            // ✅ Use your DbConnection class
            conn = DbConnection.GetConnection();

            string query = @"INSERT INTO Users (FullName, Email, Phone, Password)
                                 VALUES (@FullName, @Email, @Phone, @Password)";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@FullName", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

            cmd.ExecuteNonQuery();

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Registration successful!";

            // Optional: Clear fields
            txtName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error: " + ex.Message;
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
        finally
        {
            // ✅ Close connection safely
            DbConnection.CloseConnection(conn);
        }
    }
}