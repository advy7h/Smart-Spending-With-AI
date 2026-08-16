<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="UserViewMessage.aspx.cs" Inherits="UserViewMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>View Messages</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body { background-color: #f4f6f9; }
        .card { border-radius: 15px; }
        .unread { font-weight: bold; color: #dc3545; }
        .read { color: #198754; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
<div class="container mt-5">
    <div class="card shadow">

        <div class="card-header bg-dark text-white text-center">
            <h4>User Messages</h4>
        </div>

        <div class="card-body">

            <asp:GridView ID="gvMessages" runat="server"
                CssClass="table table-bordered table-hover text-center"
                AutoGenerateColumns="False"
                DataKeyNames="Id"
                OnRowCommand="gvMessages_RowCommand">

                <Columns>

                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Subject" HeaderText="Subject" />
                    <asp:BoundField DataField="CreatedDate" HeaderText="Date"
                        DataFormatString="{0:dd-MMM-yyyy}" />

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server"
                                Text='<%# Convert.ToBoolean(Eval("IsRead")) ? "Read" : "Unread" %>'
                                CssClass='<%# Convert.ToBoolean(Eval("IsRead")) ? "read" : "unread" %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="btnView" runat="server"
                                Text="View"
                                CommandName="ViewMsg"
                                CommandArgument='<%# Eval("Id") %>'
                                CssClass="btn btn-primary btn-sm" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>

        </div>
    </div>
</div>

</asp:Content>

