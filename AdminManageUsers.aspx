<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminManageUsers.aspx.cs" Inherits="AdminManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">\
       <h3 class="fw-bold mb-4">Manage Users</h3>

    <!-- Search -->
    <div class="row mb-3">
        <div class="col-md-4">
            <asp:TextBox ID="txtSearch" runat="server"
                CssClass="form-control"
                placeholder="Search by name or email" />
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnSearch" runat="server"
                CssClass="btn btn-primary w-100"
                Text="Search"
                OnClick="btnSearch_Click" />
        </div>
    </div>

    <!-- Users Grid -->
    <div class="dashboard-card">
        <asp:GridView ID="gvUsers" runat="server"
            CssClass="table table-hover"
            AutoGenerateColumns="False"
            DataKeyNames="Id"
            OnRowCommand="gvUsers_RowCommand">

            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:BoundField DataField="FullName" HeaderText="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" />
                <asp:BoundField DataField="MonthlyIncome" HeaderText="Income" DataFormatString="₹ {0:N2}" />
                

          
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                       
                        <asp:LinkButton ID="btnDelete" runat="server"
                            CssClass="btn btn-sm btn-danger"
                            CommandName="DeleteUser"
                            CommandArgument='<%# Eval("Id") %>'
                            OnClientClick="return confirm('Are you sure to delete this user?');"
                            Text="Delete" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>

</asp:Content>

