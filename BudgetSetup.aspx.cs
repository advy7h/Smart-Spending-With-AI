using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BudgetSetup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["UserId"] = "1";
        //Session["UserEmail"] = "anoop@gmail.com";
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string email = Session["UserEmail"].ToString();
        string userid = Session["UserId"].ToString();

        if (string.IsNullOrEmpty(email))
        {
            Response.Redirect("Login.aspx");
            return;
        }

        using (SqlConnection conn = DbConnection.GetConnection())
        {
            string query = @"
                    IF EXISTS (SELECT 1 FROM Budgets WHERE UserEmail=@Email)
                    UPDATE Budgets SET
                        Food=@Food, Rent=@Rent, Transport=@Transport,
                        Shopping=@Shopping, Emergency=@Emergency, Userid = @Userid
                    WHERE UserEmail=@Email
                    ELSE
                    INSERT INTO Budgets
                        (UserEmail, Food, Rent, Transport, Shopping, Emergency, Userid)
                    VALUES
                        (@Email, @Food, @Rent, @Transport, @Shopping, @Emergency, @Userid)";

            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Food", txtFood.Text);
            cmd.Parameters.AddWithValue("@Rent", txtRent.Text);
            cmd.Parameters.AddWithValue("@Transport", txtTransport.Text);
            cmd.Parameters.AddWithValue("@Shopping", txtShopping.Text);
            cmd.Parameters.AddWithValue("@Emergency", txtEmergency.Text);
            cmd.Parameters.AddWithValue("@Userid", userid);

            cmd.ExecuteNonQuery();

            lblMsg.Text = "✅ Budget saved successfully!";
        }
    }
}