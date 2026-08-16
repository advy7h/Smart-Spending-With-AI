<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="UserSendMessge.aspx.cs" Inherits="UserSendMessge" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Admin | Send Message</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background-color: #f4f6f9;
        }
        .card {
            border-radius: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-7">

            <div class="card shadow">
                <div class="card-header bg-dark text-white text-center">
                    <h4>Send Message to Admin</h4>
                </div>

                <div class="card-body">

                    <asp:Label ID="lblMsg" runat="server" CssClass="fw-bold"></asp:Label>

                    <div class="mb-3">
                        <label class="form-label">User Name</label>
                        <asp:TextBox ID="txtName" runat="server"
                            CssClass="form-control"
                            placeholder="Enter user name" Enabled="False" >Admin</asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">User Email</label>
                        <asp:TextBox ID="txtEmail" runat="server"
                            CssClass="form-control"
                            TextMode="Email"
                            placeholder="Enter user email" Enabled="False" >admin@gmail.com</asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Subject</label>
                        <asp:TextBox ID="txtSubject" runat="server"
                            CssClass="form-control"
                            placeholder="Enter subject" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Message</label>
                        <asp:TextBox ID="txtMessage" runat="server"
                            CssClass="form-control"
                            TextMode="MultiLine"
                            Rows="4"
                            placeholder="Type message here..." />
                    </div>

                    <asp:Button ID="btnSend" runat="server"
                        Text="Send Message"
                        CssClass="btn btn-success w-100"
                        OnClick="btnSend_Click" />

                </div>
            </div>

        </div>
    </div>
</div>
</asp:Content>

