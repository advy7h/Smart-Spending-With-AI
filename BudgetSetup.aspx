<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="BudgetSetup.aspx.cs" Inherits="BudgetSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Budget Setup</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(to right, #4e73df, #1cc88a);
            font-family: 'Segoe UI', sans-serif;
        }

        .budget-card {
            max-width: 600px;
            margin: 80px auto;
            background: #fff;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        .budget-title {
            text-align: center;
            font-size: 26px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #4e73df;
        }

        .btn-custom {
            background: #4e73df;
            color: white;
            border-radius: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
      <div class="budget-card">
            <div class="budget-title">💰 Set Your Monthly Budget</div>

            <div class="mb-3">
                <label>Food (₹)</label>
                <asp:TextBox ID="txtFood" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label>Rent (₹)</label>
                <asp:TextBox ID="txtRent" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label>Transport (₹)</label>
                <asp:TextBox ID="txtTransport" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label>Shopping (₹)</label>
                <asp:TextBox ID="txtShopping" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label>Emergency Fund (₹)</label>
                <asp:TextBox ID="txtEmergency" runat="server" CssClass="form-control" />
            </div>

            <asp:Button ID="btnSave" runat="server" Text="Save Budget" CssClass="btn btn-custom w-100" OnClick="btnSave_Click" />

            <div class="text-center mt-3">
                <asp:Label ID="lblMsg" runat="server" ForeColor="Green"></asp:Label>
            </div>

        </div>
</asp:Content>

