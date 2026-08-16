<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="AIBudgetSuggestions.aspx.cs" Inherits="AIBudgetSuggestions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
    #budgetChart {
        display: block;
        margin: 0 auto;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
<div class="container mt-4">
    <h2><i class="fas fa-robot"></i> AI Budget Suggestions</h2>

    <div class="card p-4 shadow-sm mt-3">

        <!-- INPUT -->
        <div class="mb-3">
            <label>Monthly Income (₹)</label>
            <asp:TextBox ID="txtIncome" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label>Total Monthly Expenses (₹)</label>
            <asp:TextBox ID="txtExpenses" runat="server" CssClass="form-control" />
        </div>

        <!-- CATEGORY SELECTION -->
        <div class="mb-3">
            <label>Select Expense Categories</label>
            <asp:CheckBoxList ID="chkCategories" runat="server" CssClass="form-check">
                <asp:ListItem Text="Rent" Value="Rent" Selected="True" />
                <asp:ListItem Text="Food" Value="Food" Selected="True" />
                <asp:ListItem Text="Transport" Value="Transport" Selected="True" />
                <asp:ListItem Text="Entertainment" Value="Entertainment" Selected="True" />
                <asp:ListItem Text="Emergency" Value="Emergency" Selected="True" />
            </asp:CheckBoxList>
        </div>

        <asp:Button ID="btnSuggest" runat="server" Text="Get AI Suggestions"
            CssClass="btn btn-primary" OnClick="btnSuggest_Click" />

        <hr />

        <asp:Panel ID="pnlResult" runat="server" Visible="false">

            <!-- ACTUAL -->
            <h4>📊 Actual Expense Distribution</h4>

            <ul class="list-group mt-3">
                <li class="list-group-item">Food: ₹<asp:Label ID="lblFood" runat="server" /></li>
                <li class="list-group-item">Rent: ₹<asp:Label ID="lblRent" runat="server" /></li>
                <li class="list-group-item">Transport: ₹<asp:Label ID="lblTransport" runat="server" /></li>
                <li class="list-group-item">Entertainment: ₹<asp:Label ID="lblEntertainment" runat="server" /></li>
                <li class="list-group-item">Emergency: ₹<asp:Label ID="lblEmergency" runat="server" /></li>
            </ul>

            <!-- RECOMMENDED -->
            <h4 class="mt-4">💡 Recommended Budget (Based on Income)</h4>

            <ul class="list-group mt-3">
                <li class="list-group-item">Food: ₹<asp:Label ID="lblRFood" runat="server" /></li>
                <li class="list-group-item">Rent: ₹<asp:Label ID="lblRRent" runat="server" /></li>
                <li class="list-group-item">Transport: ₹<asp:Label ID="lblRTransport" runat="server" /></li>
                <li class="list-group-item">Entertainment: ₹<asp:Label ID="lblREntertainment" runat="server" /></li>
                <li class="list-group-item">Emergency: ₹<asp:Label ID="lblREmergency" runat="server" /></li>
                <li class="list-group-item">Savings: ₹<asp:Label ID="lblRSavings" runat="server" /></li>
            </ul>

        </asp:Panel>
    </div>

    <!-- CHART -->
    <canvas id="budgetChart" style="max-width:600px;"></canvas>

<script>
    var ctx = document.getElementById('budgetChart').getContext('2d');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Food', 'Rent', 'Transport', 'Entertainment', 'Emergency'],
            datasets: [
                {
                    label: 'Actual',
                    data: [<%=Food%>, <%=Rent%>, <%=Transport%>, <%=Entertainment%>, <%=Emergency%>]
                },
                {
                    label: 'Recommended',
                    data: [<%=RFood%>, <%=RRent%>, <%=RTransport%>, <%=REntertainment%>, <%=REmergency%>]
                }
            ]
        }
    });
</script>

    <!-- INSIGHTS -->
    <div class="alert alert-info mt-3">
        <asp:Label ID="lblInsights" runat="server"></asp:Label>
    </div>

    <!-- ML -->
    <h4 class="mt-4">ML Expense Prediction</h4>

    <div class="row">
        <div class="col-md-4">
            <asp:TextBox ID="txtMonth1" runat="server" CssClass="form-control" placeholder="Last Month 1" />
        </div>
        <div class="col-md-4">
            <asp:TextBox ID="txtMonth2" runat="server" CssClass="form-control" placeholder="Last Month 2" />
        </div>
        <div class="col-md-4">
            <asp:TextBox ID="txtMonth3" runat="server" CssClass="form-control" placeholder="Last Month 3" />
        </div>
    </div>

    <asp:Button ID="btnPredict" runat="server" Text="Predict Next Month"
        CssClass="btn btn-success mt-3" OnClick="btnPredict_Click" />

    <h5 class="mt-3">
        Predicted Expense: ₹<asp:Label ID="lblPrediction" runat="server"></asp:Label>
    </h5>

</div>

</asp:Content>

