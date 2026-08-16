<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="MonthlyExpenseAnalysis.aspx.cs" Inherits="MonthlyExpenseAnalysis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container mt-4">

    <h2 class="text-center mb-4">📊 Monthly Expense vs Budget Analysis</h2>

    <div class="card p-4 shadow">

        <table class="table table-bordered text-center">
            <thead class="table-dark">
                <tr>
                    <th>Category</th>
                    <th>Budget (₹)</th>
                    <th>Spent (₹)</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>

                <tr>
                    <td>Food</td>
                    <td><asp:Label ID="lblFoodBudget" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblFoodSpent" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblFoodStatus" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td>Rent</td>
                    <td><asp:Label ID="lblRentBudget" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblRentSpent" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblRentStatus" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td>Transport</td>
                    <td><asp:Label ID="lblTransportBudget" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblTransportSpent" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblTransportStatus" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td>Shopping</td>
                    <td><asp:Label ID="lblShoppingBudget" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblShoppingSpent" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblShoppingStatus" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td>Emergency</td>
                    <td><asp:Label ID="lblEmergencyBudget" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblEmergencySpent" runat="server"></asp:Label></td>
                    <td><asp:Label ID="lblEmergencyStatus" runat="server"></asp:Label></td>
                </tr>

            </tbody>
        </table>

        <asp:Label ID="lblWarning" runat="server" CssClass="alert alert-danger mt-3 d-block text-center"></asp:Label>

    </div>
</div>
</asp:Content>

