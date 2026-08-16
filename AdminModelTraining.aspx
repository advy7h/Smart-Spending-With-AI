<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminModelTraining.aspx.cs" Inherits="AdminModelTraining" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      <h2>Model Training </h2>
        <asp:Label ID="lblMsg" runat="server" CssClass="text-danger"></asp:Label>
        <div class="mt-3">
            <asp:Button ID="btnTrain" runat="server" Text="Train Model" CssClass="btn btn-primary" OnClick="btnTrain_Click" />
        </div>
        <div class="mt-4">
            <asp:GridView ID="gvResults" runat="server" AutoGenerateColumns="False"
    CssClass="table table-bordered table-striped">
    <Columns>
        <asp:BoundField DataField="Probability" HeaderText="Probability"
            DataFormatString="{0:F4}" />
    </Columns>
</asp:GridView>
        </div>
</asp:Content>

