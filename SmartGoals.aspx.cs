using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SmartGoals : System.Web.UI.Page
{
    public static string userid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        userid = Session["UserId"].ToString();
        if (!IsPostBack)
        {
            LoadGoals();
        }
    }

    protected void btnAddGoal_Click(object sender, EventArgs e)
    {
        SqlConnection con = DbConnection.GetConnection();

        try
        {
            string query = @"INSERT INTO SmartGoals 
                    (GoalName, TargetAmount, SavedAmount, TargetDate, userid) 
                    VALUES (@GoalName, @TargetAmount, @SavedAmount, @TargetDate, @userid)";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@GoalName", txtGoalName.Text);
            cmd.Parameters.AddWithValue("@TargetAmount", txtTargetAmount.Text);
            cmd.Parameters.AddWithValue("@SavedAmount", txtSavedAmount.Text);
            cmd.Parameters.AddWithValue("@TargetDate", txtTargetDate.Text);
            cmd.Parameters.AddWithValue("@userid", userid);

            cmd.ExecuteNonQuery();

            lblMsg.Text = "✅ Goal added successfully!";
            txtGoalName.Text = "";
            txtTargetAmount.Text = "";
            txtSavedAmount.Text = "";
            txtTargetDate.Text = "";

            LoadGoals();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "❌ Error: " + ex.Message;
        }
        finally
        {
            DbConnection.CloseConnection(con);
        }
    }
    private void LoadGoals()
    {
        SqlConnection con = DbConnection.GetConnection();

        try
        {
            string query = @"
                SELECT GoalName, TargetAmount, SavedAmount, TargetDate,
                CASE 
                    WHEN TargetAmount = 0 THEN 0
                    ELSE CAST((SavedAmount * 100.0 / TargetAmount) AS INT)
                END AS Progress
                FROM SmartGoals WHERE UserId = @UserId";

            SqlCommand cmd = new SqlCommand(query, con);

            // Pass UserId (example from session)
            cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvGoals.DataSource = dt;
            gvGoals.DataBind();
        }
        catch { }
        finally
        {
            DbConnection.CloseConnection(con);
        }
    }
}