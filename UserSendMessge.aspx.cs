using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserSendMessge : System.Web.UI.Page
{
    string conStr = "Data Source=.;Initial Catalog=SmartFinance;Integrated Security=True;";
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (txtName.Text.Trim() == "" ||
            txtEmail.Text.Trim() == "" ||
            txtSubject.Text.Trim() == "" ||
            txtMessage.Text.Trim() == "")
        {
            lblMsg.Text = "⚠️ All fields are required";
            lblMsg.CssClass = "text-danger";
            return;
        }

        using (SqlConnection con = new SqlConnection(conStr))
        {
            string query = @"INSERT INTO Messages
                            (Name, Email, Subject, Message)
                            VALUES
                            (@Name, @Email, @Subject, @Message)";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Subject", txtSubject.Text.Trim());
            cmd.Parameters.AddWithValue("@Message", txtMessage.Text.Trim());

            con.Open();
            cmd.ExecuteNonQuery();
        }

        lblMsg.Text = "✅ Message sent successfully!";
        lblMsg.CssClass = "text-success";

        txtName.Text = "";
        txtEmail.Text = "";
        txtSubject.Text = "";
        txtMessage.Text = "";
    }
}
    
