<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminIncomeRecords.aspx.cs" Inherits="AdminIncomeRecords" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <h3 class="fw-bold mb-4">Income Records</h3>

    <!-- Filters -->
    <div class="row mb-3">
        <div class="col-md-3">
            <asp:TextBox ID="txtSearch" runat="server"
                CssClass="form-control"
                placeholder="Search by source or user" />
        </div>

        <div class="col-md-2">
            <asp:TextBox ID="txtFrom" runat="server"
                CssClass="form-control"
                TextMode="Date" />
        </div>

        <div class="col-md-2">
            <asp:TextBox ID="txtTo" runat="server"
                CssClass="form-control"
                TextMode="Date" />
        </div>

        <div class="col-md-2">
            <asp:Button ID="btnFilter" runat="server"
                CssClass="btn btn-primary w-100"
                Text="Filter"
                OnClick="btnFilter_Click" />
        </div>

        <div class="col-md-3 text-end">
            <h5 class="fw-bold text-success">
                Total Income: ₹ <asp:Label ID="lblTotal" runat="server" />
            </h5>
        </div>
    </div>

    <!-- Income Grid -->
    <div class="dashboard-card">
        <asp:GridView ID="gvIncome" runat="server"
            CssClass="table table-striped"
            AutoGenerateColumns="False"
            DataKeyNames="Id"
            OnRowCommand="gvIncome_RowCommand">

            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:BoundField DataField="FullName" HeaderText="User" />
                <asp:BoundField DataField="Source" HeaderText="Source" />

                <asp:TemplateField HeaderText="Amount">
                    <ItemTemplate>
                        ₹ <%# Convert.ToDecimal(Eval("Amount")).ToString("N2") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="IncomeDate" HeaderText="Date"
                    DataFormatString="{0:dd-MMM-yyyy}" />

                <asp:BoundField DataField="Notes" HeaderText="Notes" />

                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton runat="server"
                            CssClass="btn btn-sm btn-danger"
                            CommandName="DeleteIncome"
                            CommandArgument='<%# Eval("Id") %>'
                            OnClientClick="return confirm('Delete this income record?');"
                            Text="Delete" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

