<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <title>Expense Reports - Smart Finance</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
       <div class="container mt-5">
        <div class="card p-4 shadow">
            <h3 class="text-center mb-4">📊 Financial Reports</h3>

            <!-- Summary Cards -->
            <div class="row text-center mb-4">
                <div class="col-md-4">
                    <div class="p-3 bg-success text-white rounded">
                        <h5>Total Income</h5>
                        <asp:Label ID="lblIncome" runat="server" Text="₹0"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-3 bg-danger text-white rounded">
                        <h5>Total Expense</h5>
                        <asp:Label ID="lblExpense" runat="server" Text="₹0"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-3 bg-primary text-white rounded">
                        <h5>Total Savings</h5>
                        <asp:Label ID="lblSavings" runat="server" Text="₹0"></asp:Label>
                    </div>
                </div>
            </div>

            <!-- Chart -->
            <div class="mb-4">
                <canvas id="expenseChart"></canvas>
            </div>

            <!-- Expense Table -->
            <h5 class="mt-3">Detailed Expenses</h5>
            <asp:GridView ID="gvReport" runat="server" AutoGenerateColumns="False"
                CssClass="table table-bordered">
                <Columns>
                    <asp:BoundField DataField="ExpenseDate" HeaderText="Date" 
                        DataFormatString="{0:dd-MMM-yyyy}" />
                    <asp:BoundField DataField="Category" HeaderText="Category" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount (₹)" 
                        DataFormatString="₹{0:N2}" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <!-- Chart Script -->
    <script>
        function loadChart(expense, income) {
            const ctx = document.getElementById('expenseChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['Income', 'Expense'],
                    datasets: [{
                        label: 'Comparison',
                        data: [income, expense]
                    }]
                }
            });
        }
    </script>

</asp:Content>

