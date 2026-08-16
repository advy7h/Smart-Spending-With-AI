<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="SavingsPlanner.aspx.cs" Inherits="SavingsPlanner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
<div class="container mt-4">
    <div class="card shadow-lg rounded-4 p-4">

        <h3 class="text-center fw-bold text-success mb-4">
            <i class="fa fa-piggy-bank"></i> Savings Planner
        </h3>

        <asp:Label ID="lblMessage" runat="server"></asp:Label>

        <div class="row">

            <div class="col-md-6 mb-3">
                <label class="form-label fw-semibold">Monthly Income (₹)</label>
                <asp:TextBox ID="txtIncome" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>

            <div class="col-md-6 mb-3">
                <label class="form-label fw-semibold">Savings Goal (₹)</label>
                <asp:TextBox ID="txtGoal" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>

        </div>

        <div class="text-center">
            <asp:Button ID="btnCalculate" runat="server"
                CssClass="btn btn-success px-5 py-2"
                Text="Generate Savings Plan"
                OnClick="btnCalculate_Click" />
        </div>

        <hr />

        <!-- Output Section -->
        <div class="row text-center mt-4">
            <div class="col-md-4">
                <div class="p-3 bg-light border rounded shadow-sm">
                    <h6>Daily Savings</h6>
                    <asp:Label ID="lblDaily" runat="server" CssClass="fw-bold text-success"></asp:Label>
                </div>
            </div>
            <div class="col-md-4">
                <div class="p-3 bg-light border rounded shadow-sm">
                    <h6>Monthly Savings</h6>
                    <asp:Label ID="lblMonthly" runat="server" CssClass="fw-bold text-primary"></asp:Label>
                </div>
            </div>
            <div class="col-md-4">
                <div class="p-3 bg-light border rounded shadow-sm">
                    <h6>AI Advice</h6>
                    <asp:Label ID="lblAdvice" runat="server" CssClass="text-danger"></asp:Label>
                </div>
            </div>
        </div>

    </div>
</div>
</asp:Content>

