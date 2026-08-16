<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminModelTraining1.aspx.cs" Inherits="AdminModelTraining1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="lblMsg" runat="server"></asp:Label>

<asp:Button ID="btnTrain" runat="server"
    Text="Train Model"
    CssClass="btn btn-success"
    OnClick="btnTrain_Click" />

<hr />

<asp:GridView ID="gvResults" runat="server"
    AutoGenerateColumns="False"
    CssClass="table table-bordered table-striped">
    <Columns>
        <asp:BoundField DataField="Probability"
            HeaderText="Predicted Probability"
            DataFormatString="{0:F4}" />
    </Columns>
</asp:GridView>
</asp:Content>

