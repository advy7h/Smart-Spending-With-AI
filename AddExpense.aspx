<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="AddExpense.aspx.cs" Inherits="AddExpense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container mt-4">
    <div class="card shadow-lg p-4 rounded-4">
        <h3 class="text-center fw-bold text-primary mb-4">
            <i class="fa fa-plus-circle"></i> Add New Expense
        </h3>

        <asp:Label ID="lblMessage" runat="server"></asp:Label>

        <!-- Title -->
        <div class="mb-3">
            <label class="form-label fw-semibold">Expense Title</label>
            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Eg: Grocery, Fuel"></asp:TextBox>
        </div>

        <!-- Category -->
        <div class="mb-3">
            <label class="form-label fw-semibold">Category</label>
            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                <asp:ListItem>Food</asp:ListItem>
                <asp:ListItem>Grocery</asp:ListItem>
                <asp:ListItem>Transport</asp:ListItem>
                <asp:ListItem>Rent</asp:ListItem>
                <asp:ListItem>Shopping</asp:ListItem>
                <asp:ListItem>Bills</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:DropDownList>
        </div>

        <!-- Amount -->
        <div class="mb-3">
            <label class="form-label fw-semibold">Amount (₹)</label>
            <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
        </div>

        <!-- Date -->
        <div class="mb-3">
            <label class="form-label fw-semibold">Expense Date</label>
            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
        </div>

        <!-- Notes -->
        <div class="mb-3">
            <label class="form-label fw-semibold">Notes</label>
            <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
        </div>

        <!-- Button -->
        <div class="text-center">
            <asp:Button ID="btnAddExpense" runat="server" CssClass="btn btn-primary px-5 py-2" Text="Save Expense" OnClick="btnAddExpense_Click" />
        </div>
    </div>
</div>

</asp:Content>

