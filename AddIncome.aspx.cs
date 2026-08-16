using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddIncome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["UserId"] = "1";
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = DbConnection.GetConnection();

            string query = "INSERT INTO Income (UserId, Source, Amount, Notes) VALUES (@UserId, @Source, @Amount, @Notes)";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@UserId", Session["UserId"]); // Replace with Session UserId
            cmd.Parameters.AddWithValue("@Source", txtSource.Text);
            cmd.Parameters.AddWithValue("@Amount", txtAmount.Text);
            cmd.Parameters.AddWithValue("@Notes", txtNotes.Text);

            cmd.ExecuteNonQuery();
            DbConnection.CloseConnection(con);

            lblMsg.Text = "Income added successfully!";
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Error: " + ex.Message;
        }
    }
}
