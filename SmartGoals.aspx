<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="SmartGoals.aspx.cs" Inherits="SmartGoals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <title>Smart Goals - Finance Assistant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container mt-5">
    <div class="card p-4 shadow">
        <h3 class="text-center mb-4">🎯 Smart Financial Goals</h3>

        <!-- Add Goal Section -->
        <div class="row mb-3">
            <div class="col-md-3">
                <asp:TextBox ID="txtGoalName" runat="server" CssClass="form-control" Placeholder="Goal Name"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="txtTargetAmount" runat="server" CssClass="form-control" Placeholder="Target Amount (₹)"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="txtSavedAmount" runat="server" CssClass="form-control" Placeholder="Saved Amount (₹)"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="txtTargetDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
        </div>

        <asp:Button ID="btnAddGoal" runat="server" Text="Add Goal" CssClass="btn btn-primary w-100 mb-3"
            OnClick="btnAddGoal_Click" />

        <!-- Goals Table -->
        <asp:GridView ID="gvGoals" runat="server" CssClass="table table-bordered text-center"
            AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="GoalName" HeaderText="Goal" />
                <asp:BoundField DataField="TargetAmount" HeaderText="Target (₹)" DataFormatString="₹{0:N2}" />
                <asp:BoundField DataField="SavedAmount" HeaderText="Saved (₹)" DataFormatString="₹{0:N2}" />
                <asp:BoundField DataField="TargetDate" HeaderText="Target Date" DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:TemplateField HeaderText="Progress">
                    <ItemTemplate>
                        <%# Eval("Progress") + "%" %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:Label ID="lblMsg" runat="server" CssClass="text-success text-center d-block"></asp:Label>
    </div>
</div>

</asp:Content>

