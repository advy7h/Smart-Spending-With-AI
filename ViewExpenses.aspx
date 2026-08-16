<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="ViewExpenses.aspx.cs" Inherits="ViewExpenses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container mt-4">
    <div class="card shadow-lg rounded-4 p-4">

        <h3 class="text-center fw-bold text-primary mb-4">
            <i class="fa fa-list"></i> My Expenses
        </h3>
        <hr />
<h4 class="mt-3">📊 Month-wise Category Expense Summary</h4>

<h3>Month-wise Category Expenses</h3>
<asp:GridView ID="gvMonthlyCategory" runat="server" CssClass="table table-bordered" />

<br />

<h3>Total Monthly Expenses</h3>
<asp:GridView ID="gvMonthlyTotal" runat="server" CssClass="table table-bordered" />

<asp:GridView ID="gvMonthlySummary" runat="server" CssClass="table table-bordered table-striped"></asp:GridView>
<hr />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>

        <div class="table-responsive">
            <asp:GridView ID="gvExpenses" runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-striped table-hover text-center"
                DataKeyNames="ExpenseId"
                OnRowDeleting="gvExpenses_RowDeleting">

                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Category" HeaderText="Category" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount (₹)" DataFormatString="₹ {0:N2}" />
                    <asp:BoundField DataField="ExpenseDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="Notes" HeaderText="Notes" />

                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                </Columns>

            </asp:GridView>
        </div>

    </div>
</div>
</asp:Content>

