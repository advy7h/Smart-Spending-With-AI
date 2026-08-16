<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="MonthlyReport.aspx.cs" Inherits="MonthlyReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    

<div class="container mt-4">
    <div class="card shadow-lg rounded-4 p-4">

        <h3 class="text-center fw-bold text-primary mb-4">
            <i class="fa fa-chart-line"></i> Monthly Expense Report
        </h3>

        <asp:Label ID="lblMessage" runat="server"></asp:Label>

        <!-- Summary cards -->
        <div class="row text-center mb-4">
            <div class="col-md-4">
                <div class="p-3 bg-primary text-white rounded shadow">
                    <h5>Total Expenses</h5>
                    <asp:Label ID="lblTotal" runat="server" Font-Size="20px"></asp:Label>
                </div>
            </div>

            <div class="col-md-4">
                <div class="p-3 bg-success text-white rounded shadow">
                    <h5>Highest Category</h5>
                    <asp:Label ID="lblTopCategory" runat="server" Font-Size="20px"></asp:Label>
                </div>
            </div>

            <div class="col-md-4">
                <div class="p-3 bg-warning text-dark rounded shadow">
                    <h5>AI Advice</h5>
                    <asp:Label ID="lblAdvice" runat="server" Font-Size="14px"></asp:Label>
                </div>
            </div>
        </div>

        <!-- Table -->
        <div class="table-responsive">
            <asp:GridView ID="gvMonthly" runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-striped table-bordered text-center">
                <Columns>
                    <asp:BoundField DataField="Category" HeaderText="Category" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="Total (₹)"
                        DataFormatString="₹ {0:N2}" HtmlEncode="false" />
                </Columns>
            </asp:GridView>
        </div>

    </div>
</div>
</asp:Content>

