<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminViewMessage.aspx.cs" Inherits="AdminViewMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
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

            <a href="AdminMessage.aspx" class="btn btn-dark">Back</a>
        </div>

    </div>
</div>
</asp:Content>

