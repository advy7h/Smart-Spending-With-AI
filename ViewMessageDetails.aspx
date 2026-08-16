<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="ViewMessageDetails.aspx.cs" Inherits="ViewMessageDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Message Details</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container mt-5">
    <div class="card shadow">

        <div class="card-header bg-secondary text-white">
            <h5>Message Details</h5>
        </div>

        <div class="card-body">
            <p><b>Name:</b> <asp:Label ID="lblName" runat="server" /></p>
            <p><b>Email:</b> <asp:Label ID="lblEmail" runat="server" /></p>
            <p><b>Subject:</b> <asp:Label ID="lblSubject" runat="server" /></p>
            <p><b>Message:</b></p>
            <p class="border p-3 bg-light">
                <asp:Label ID="lblMessage" runat="server" />
            </p>

            <a href="UserViewMessage.aspx" class="btn btn-dark">Back</a>
        </div>

    </div>
</div>
</asp:Content>

