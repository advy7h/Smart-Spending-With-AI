<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminSendMessage.aspx.cs" Inherits="AdminSendMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-7">

            <div class="card shadow">
                <div class="card-header bg-dark text-white text-center">
                    <h4>Admin – Send Message</h4>
                </div>

                <div class="card-body">

                    <asp:Label ID="lblMsg" runat="server" CssClass="fw-bold"></asp:Label>

                    <div class="mb-3">
                        <label class="form-label">User Name</label>
                        <asp:TextBox ID="txtName" runat="server"
                            CssClass="form-control"
                            placeholder="Enter user name" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">User Email</label>
                        <asp:TextBox ID="txtEmail" runat="server"
                            CssClass="form-control"
                            TextMode="Email"
                            placeholder="Enter user email" />
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

