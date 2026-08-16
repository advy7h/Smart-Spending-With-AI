<%@ Page Title="" Language="C#" MasterPageFile="~/DashboardMasterPage.master" AutoEventWireup="true" CodeFile="DeepLearningPrediction.aspx.cs" Inherits="DeepLearningPrediction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h2><i class="fas fa-brain"></i> Deep Learning Expense Prediction</h2>

    <div class="card p-4 shadow-sm mt-3">

        <!-- INPUT -->
        <div class="row">
            <div class="col-md-3">
                <label>Month 1</label>
                <asp:TextBox ID="txtM1" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-3">
                <label>Month 2</label>
                <asp:TextBox ID="txtM2" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-3">
                <label>Month 3</label>
                <asp:TextBox ID="txtM3" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-3">
                <label>Month 4</label>
                <asp:TextBox ID="txtM4" runat="server" CssClass="form-control" />
            </div>
        </div>

        <asp:Button ID="btnPredictDL" runat="server"
            Text="Predict using Neural Network"
            CssClass="btn btn-primary mt-3"
            OnClick="btnPredictDL_Click" />

        <hr />

        <!-- RESULT -->
        <div class="alert alert-success">
            <h4>AI Predicted Expense: ₹
                <asp:Label ID="lblDLPred" runat="server"></asp:Label>
            </h4>
        </div>

        <!-- EXPLANATION -->
        <div class="alert alert-info">
            <asp:Label ID="lblExplain" runat="server"></asp:Label>
        </div>

    </div>

</asp:Content>

