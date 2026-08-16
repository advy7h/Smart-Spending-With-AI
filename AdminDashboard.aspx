<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminDashboard.aspx.cs" Inherits="AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h3 class="fw-bold mb-4">Admin Dashboard</h3>

    <!-- Stat Cards -->
    <div class="row g-4 mb-4">

        <div class="col-md-3">
            <div class="dashboard-card text-center">
                <i class="bi bi-people fs-1 text-primary"></i>
                <h6>Total Users</h6>
                <h3><asp:Label ID="lblUsers" runat="server" /></h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="dashboard-card text-center">
                <i class="bi bi-cash-stack fs-1 text-success"></i>
                <h6>Total Income</h6>
                <h3>₹ <asp:Label ID="lblIncome" runat="server" /></h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="dashboard-card text-center">
                <i class="bi bi-receipt fs-1 text-danger"></i>
                <h6>Total Expenses</h6>
                <h3>₹ <asp:Label ID="lblExpense" runat="server" /></h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="dashboard-card text-center">
                <i class="bi bi-pie-chart fs-1 text-info"></i>
                <h6>Total Budget</h6>
                <h3>₹ <asp:Label ID="lblBudget" runat="server" /></h3>
            </div>
        </div>

    </div>

    <!-- Tables -->
    <div class="row g-4">

        <!-- Recent Users -->
        <div class="col-md-6">
            <div class="dashboard-card">
                <h5 class="fw-bold mb-3">Recent Users</h5>
                <asp:GridView ID="gvUsers" runat="server"
                    CssClass="table table-striped"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" />
                        <asp:BoundField DataField="FullName" HeaderText="Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="MonthlyIncome" HeaderText="Income" DataFormatString="₹ {0:N2}" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <!-- Recent Expenses -->
        <div class="col-md-6">
            <div class="dashboard-card">
                <h5 class="fw-bold mb-3">Recent Expenses</h5>
                <asp:GridView ID="gvExpenses" runat="server"
                    CssClass="table table-bordered"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="ExpenseId" HeaderText="ID" />
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Category" HeaderText="Category" />
                        <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="₹ {0:N2}" />
                        <asp:BoundField DataField="ExpenseDate" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </div>
</asp:Content>

