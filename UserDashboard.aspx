<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="UserDashboard.aspx.cs" Inherits="UserDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <style>
        .welcome {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.08);
            position: relative;
            overflow: hidden;
        }

        .card i {
            font-size: 30px;
            position: absolute;
            right: 20px;
            top: 20px;
            opacity: 0.3;
        }

        .card h3 {
            margin: 0;
            font-size: 16px;
            color: #777;
        }

        .card p {
            margin-top: 10px;
            font-size: 26px;
            font-weight: bold;
            color: #2d3436;
        }

        .recent-box {
            margin-top: 30px;
            background: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 5px 10px rgba(0,0,0,0.05);
        }
    </style>

    <div class="welcome">
        Welcome, <asp:Label ID="lblUserName" runat="server"></asp:Label> 👋
    </div>

    <div class="cards">
        <div class="card">
            <h3>Total Income</h3>
            <p>₹ <asp:Label ID="lblIncome" runat="server" Text="0"></asp:Label></p>
            <i class="fa fa-money-bill-wave"></i>
        </div>

        <div class="card">
            <h3>Total Expenses</h3>
            <p>₹ <asp:Label ID="lblExpenses" runat="server" Text="0"></asp:Label></p>
            <i class="fa fa-credit-card"></i>
        </div>

        <div class="card">
            <h3>Net Savings</h3>
            <p>₹ <asp:Label ID="lblSavings" runat="server" Text="0"></asp:Label></p>
            <i class="fa fa-piggy-bank"></i>
        </div>
    </div>

    <div class="recent-box">
        <h3><i class="fa fa-clock"></i> Recent Transactions</h3>
        <asp:GridView ID="gvRecent" runat="server" CssClass="table" AutoGenerateColumns="true"></asp:GridView>
    </div>
</asp:Content>

