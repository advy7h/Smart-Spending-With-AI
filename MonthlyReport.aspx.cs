using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MonthlyReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMonthlyReport();
        }
    }
    private void LoadMonthlyReport()
    {
        SqlConnection conn = null;

        try
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            conn = DbConnection.GetConnection();

            // Total Expenses
            string totalQuery = @"SELECT ISNULL(SUM(Amount),0) 
                                      FROM Expenses 
                                      WHERE UserId=@UserId 
                                      AND MONTH(ExpenseDate)=MONTH(GETDATE())";

            SqlCommand totalCmd = new SqlCommand(totalQuery, conn);
            totalCmd.Parameters.AddWithValue("@UserId", userId);

            decimal total = Convert.ToDecimal(totalCmd.ExecuteScalar());
            lblTotal.Text = "₹ " + total.ToString("N2");

            // Category-wise report
            string catQuery = @"SELECT Category, SUM(Amount) AS TotalAmount
                                    FROM Expenses 
                                    WHERE UserId=@UserId 
                                    AND MONTH(ExpenseDate)=MONTH(GETDATE())
                                    GROUP BY Category";

            SqlDataAdapter da = new SqlDataAdapter(catQuery, conn);
            da.SelectCommand.Parameters.AddWithValue("@UserId", userId);

            DataTable dt = new DataTable();
            da.Fill(dt);

            gvMonthly.DataSource = dt;
            gvMonthly.DataBind();

            // Highest category
            if (dt.Rows.Count > 0)
            {
                lblTopCategory.Text = dt.Rows[0]["Category"].ToString();
            }

            // Simple AI advice
            if (total > 10000)
                lblAdvice.Text = "You are spending too much. Try to reduce unnecessary expenses.";
            else
                lblAdvice.Text = "Your spending looks balanced. Keep saving regularly!";
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error: " + ex.Message;
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
        finally
        {
            DbConnection.CloseConnection(conn);
        }
    }
}
