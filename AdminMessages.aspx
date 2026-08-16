<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminMessages.aspx.cs" Inherits="AdminMessages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <h3 class="fw-bold mb-4">User Messages</h3>

    <!-- Filters -->
    <div class="row mb-3">
        <div class="col-md-4">
            <asp:TextBox ID="txtSearch" runat="server"
                CssClass="form-control"
                placeholder="Search name or email" />
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnSearch" runat="server"
                CssClass="btn btn-primary w-100"
                Text="Search"
                OnClick="btnSearch_Click" />
        </div>
    </div>

    <!-- Messages Grid -->
    <div class="dashboard-card">
        <asp:GridView ID="gvMessages" runat="server"
            CssClass="table table-hover"
            AutoGenerateColumns="False"
            DataKeyNames="Id"
            OnRowCommand="gvMessages_RowCommand">

            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Subject" HeaderText="Subject" />

                <asp:TemplateField HeaderText="Date">
                    <ItemTemplate>
                        <%# Convert.ToDateTime(Eval("CreatedDate")).ToString("dd-MMM-yyyy") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <span class='<%# Convert.ToBoolean(Eval("IsRead")) 
                            ? "badge bg-success" 
                            : "badge bg-warning text-dark" %>'>
                            <%# Convert.ToBoolean(Eval("IsRead")) ? "Read" : "Unread" %>
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton runat="server"
                            CssClass="btn btn-sm btn-info"
                            CommandName="View"
                            CommandArgument='<%# Eval("Id") %>'
                            Text="View" />
                        &nbsp;
                        <asp:LinkButton runat="server"
                            CssClass="btn btn-sm btn-danger"
                            CommandName="DeleteMsg"
                            CommandArgument='<%# Eval("Id") %>'
                            OnClientClick="return confirm('Delete this message?');"
                            Text="Delete" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>

</asp:Content>

