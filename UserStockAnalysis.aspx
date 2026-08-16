<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master"   Async="true"
    EnableEventValidation="false"
    AutoEventWireup="true" CodeFile="UserStockAnalysis.aspx.cs" Inherits="UserStockAnalysis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

   <title>Reliance Live Stock</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        .box {
            width: 95%;
            margin: 30px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px #ccc;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <div class="box">

        <h3>📈 Reliance Industries (Live)</h3>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <p>Price: <b><asp:Label ID="lblPrice" runat="server" /></b></p>
                <p>Change: <asp:Label ID="lblChange" runat="server" /></p>
                <p>Percent: <asp:Label ID="lblPercent" runat="server" /></p>

                <asp:Button ID="btnRefresh" runat="server"
                    Text="Refresh Now"
                    CssClass="btn btn-primary"
                    OnClick="btnRefresh_Click" />

                <br /><br />
                <asp:Label ID="lblStatus" runat="server" />

                <!-- Hidden fields -->
                <asp:HiddenField ID="hfTimes" runat="server" />
                <asp:HiddenField ID="hfPrices" runat="server" />

                <!-- Chart -->
                <canvas id="stockChart" height="120"></canvas>

                <!-- Timer -->
                <asp:Timer ID="Timer1"
                    runat="server"
                    Interval="10000"
                    OnTick="Timer1_Tick" />

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

<script>
    var chart;

    function drawChart() {

        var times = document.getElementById('<%= hfTimes.ClientID %>').value;
        var prices = document.getElementById('<%= hfPrices.ClientID %>').value;

        if (!times || !prices) return;

        var labels = times.split(',');
        var data = prices.split(',').map(Number);

        var ctx = document.getElementById('stockChart').getContext('2d');

        if (chart) chart.destroy();

        chart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Reliance Price ₹',
                    data: data,
                    borderWidth: 2,
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: { beginAtZero: false }
                }
            }
        });
    }

    window.onload = drawChart;
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(drawChart);
</script>


</asp:Content>

