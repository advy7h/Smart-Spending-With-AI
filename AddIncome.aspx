<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="AddIncome.aspx.cs" Inherits="AddIncome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container mt-4">
    <h2 class="text-center mb-4">Add Income</h2>

    <div class="card p-4 shadow">
        
        <div class="mb-3">
            <label>Income Source</label>
            <asp:TextBox ID="txtSource" runat="server" CssClass="form-control" placeholder="Salary, Freelance, Bonus"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label>Amount (₹)</label>
            <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter amount"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label>Notes</label>
            <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
        </div>

        <asp:Button ID="btnSave" runat="server" Text="Save Income" CssClass="btn btn-success w-100" OnClick="btnSave_Click" />

        <asp:Label ID="lblMsg" runat="server" CssClass="text-success mt-3 d-block"></asp:Label>

    </div>
</div>
</asp:Content>

