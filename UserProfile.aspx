<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(to right, #4e73df, #1cc88a);
            font-family: 'Segoe UI', sans-serif;
        }

        .profile-card {
            max-width: 600px;
            margin: 80px auto;
            background: #fff;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        .profile-title {
            text-align: center;
            font-size: 28px;
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
    <div class="profile-card">
            <div class="profile-title">👤 My Profile</div>

            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <label class="form-label">Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true" />
            </div>

            <div class="mb-3">
                <label class="form-label">Phone Number</label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" MaxLength="10" />
            </div>

            <div class="mb-3">
                <label class="form-label">Monthly Income (₹)</label>
                <asp:TextBox ID="txtIncome" runat="server" CssClass="form-control" />
            </div>

            <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" CssClass="btn btn-custom w-100" OnClick="btnUpdate_Click" />

            <div class="text-center mt-3">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
            </div>
        </div>
</asp:Content>

