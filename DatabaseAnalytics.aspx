<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="DatabaseAnalytics.aspx.cs" Inherits="DatabaseAnalytics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>📊 Database Analytics</h2>

<div class="row">
    <div class="col-md-4">
        <div class="card p-3 bg-info text-white">Total Income: ₹<asp:Label ID="lblTotalIncome" runat="server"></asp:Label></div>
    </div>
    <div class="col-md-4">
        <div class="card p-3 bg-danger text-white">Total Expenses: ₹<asp:Label ID="lblTotalExpenses" runat="server"></asp:Label></div>
    </div>
    <div class="col-md-4">
        <div class="card p-3 bg-success text-white">Total Savings: ₹<asp:Label ID="lblTotalSavings" runat="server"></asp:Label></div>
    </div>
</div>

<h4 class="mt-4">Category-wise Spending</h4>

<asp:GridView ID="gvCategories" runat="server" CssClass="table table-bordered"></asp:GridView>
</asp:Content>

