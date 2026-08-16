<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminExpenseRecords.aspx.cs" Inherits="AdminExpenseRecords" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h3 class="fw-bold mb-4">Expense Records</h3>

    <!-- Filters -->
    <div class="row mb-3">
        <div class="col-md-3">
            <asp:TextBox ID="txtSearch" runat="server"
                CssClass="form-control"
                placeholder="Search title or category" />
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
            <h5 class="fw-bold text-danger">
                Total Expense: ₹ <asp:Label ID="lblTotal" runat="server" />
            </h5>
        </div>
    </div>

    <!-- Expense Grid -->
    <div class="dashboard-card">
        <asp:GridView ID="gvExpense" runat="server"
            CssClass="table table-bordered"
            AutoGenerateColumns="False"
            DataKeyNames="ExpenseId"
            OnRowCommand="gvExpense_RowCommand">

            <Columns>
                <asp:BoundField DataField="ExpenseId" HeaderText="ID" />
                <asp:BoundField DataField="FullName" HeaderText="User" />
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="Category" HeaderText="Category" />

                <asp:TemplateField HeaderText="Amount">
                    <ItemTemplate>
                        ₹ <%# Convert.ToDecimal(Eval("Amount")).ToString("N2") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="ExpenseDate"
                    HeaderText="Date"
                    DataFormatString="{0:dd-MMM-yyyy}" />

                <asp:BoundField DataField="Notes" HeaderText="Notes" />

                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton runat="server"
                            CssClass="btn btn-sm btn-danger"
                            CommandName="DeleteExpense"
                            CommandArgument='<%# Eval("ExpenseId") %>'
                            OnClientClick="return confirm('Delete this expense record?');"
                            Text="Delete" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

