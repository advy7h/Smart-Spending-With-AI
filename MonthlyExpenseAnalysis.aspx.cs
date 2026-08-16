using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MonthlyExpenseAnalysis : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["UserId"] = "1";
        if (!IsPostBack)
        {
            LoadAnalysis();
        }
    }
    private void LoadAnalysis()
    {
        string userid = Session["UserId"].ToString();   // Replace with Session email
        int userId = 1;                        // Replace with Session UserId

        decimal foodBudget = 0, rentBudget = 0, transportBudget = 0, shoppingBudget = 0, emergencyBudget = 0;
        decimal foodSpent = 0, rentSpent = 0, transportSpent = 0, shoppingSpent = 0, emergencySpent = 0;

        SqlConnection con = DbConnection.GetConnection();

        // 1. Get Budget
        SqlCommand cmdBudget = new SqlCommand("SELECT * FROM Budgets WHERE Userid=@UserId", con);
        cmdBudget.Parameters.AddWithValue("@UserId", userid);

        SqlDataReader br = cmdBudget.ExecuteReader();
        if (br.Read())
        {
            foodBudget = br["Food"] != DBNull.Value ? Convert.ToDecimal(br["Food"]) : 0;
            rentBudget = br["Rent"] != DBNull.Value ? Convert.ToDecimal(br["Rent"]) : 0;
            transportBudget = br["Transport"] != DBNull.Value ? Convert.ToDecimal(br["Transport"]) : 0;
            shoppingBudget = br["Shopping"] != DBNull.Value ? Convert.ToDecimal(br["Shopping"]) : 0;
            emergencyBudget = br["Emergency"] != DBNull.Value ? Convert.ToDecimal(br["Emergency"]) : 0;
        }
        br.Close();

        // 2. Get Monthly Expense Sum
        foodSpent = GetCategoryTotal(con, userId, "Food");
        rentSpent = GetCategoryTotal(con, userId, "Rent");
        transportSpent = GetCategoryTotal(con, userId, "Transport");
        shoppingSpent = GetCategoryTotal(con, userId, "Shopping");
        emergencySpent = GetCategoryTotal(con, userId, "Emergency");

        DbConnection.CloseConnection(con);

        // 3. Display data
        lblFoodBudget.Text = "₹" + foodBudget;
        lblFoodSpent.Text = "₹" + foodSpent;
        lblFoodStatus.Text = GetStatus(foodSpent, foodBudget);

        lblRentBudget.Text = "₹" + rentBudget;
        lblRentSpent.Text = "₹" + rentSpent;
        lblRentStatus.Text = GetStatus(rentSpent, rentBudget);

        lblTransportBudget.Text = "₹" + transportBudget;
        lblTransportSpent.Text = "₹" + transportSpent;
        lblTransportStatus.Text = GetStatus(transportSpent, transportBudget);

        lblShoppingBudget.Text = "₹" + shoppingBudget;
        lblShoppingSpent.Text = "₹" + shoppingSpent;
        lblShoppingStatus.Text = GetStatus(shoppingSpent, shoppingBudget);

        lblEmergencyBudget.Text = "₹" + emergencyBudget;
        lblEmergencySpent.Text = "₹" + emergencySpent;
        lblEmergencyStatus.Text = GetStatus(emergencySpent, emergencyBudget);

        // 4. Overall warning
        if (foodSpent > foodBudget || rentSpent > rentBudget || transportSpent > transportBudget ||
            shoppingSpent > shoppingBudget || emergencySpent > emergencyBudget)
        {
            lblWarning.Text = "⚠ Warning: You have exceeded your monthly budget in one or more categories!";
        }
    }
    private decimal GetCategoryTotal(SqlConnection con, int userId, string category)
    {
        SqlCommand cmd = new SqlCommand(
            @"SELECT ISNULL(SUM(Amount),0) 
                  FROM Expenses 
                  WHERE UserId=@UserId AND Category=@Category 
                  AND MONTH(ExpenseDate)=MONTH(GETDATE()) 
                  AND YEAR(ExpenseDate)=YEAR(GETDATE())", con);

        cmd.Parameters.AddWithValue("@UserId", userId);
        cmd.Parameters.AddWithValue("@Category", category);

        return Convert.ToDecimal(cmd.ExecuteScalar());
    }
    private string GetStatus(decimal spent, decimal budget)
    {
        if (spent > budget)
            return "<span style='color:red;font-weight:bold'>❌ Exceeded</span>";
        else
            return "<span style='color:green;font-weight:bold'>✅ Within Limit</span>";
    }
}