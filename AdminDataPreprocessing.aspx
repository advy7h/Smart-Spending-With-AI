<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminDataPreprocessing.aspx.cs" Inherits="AdminDataPreprocessing_aspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <h4 class="fw-bold mb-4">
        <i class="bi bi-sliders"></i> Data Preprocessing
    </h4>

    <!-- Message -->
    <asp:Label ID="lblMsg" runat="server" CssClass="fw-semibold mb-3 d-block"></asp:Label>

    <!-- Action Buttons -->
    <div class="mb-4">
        <asp:Button ID="btnClean" runat="server"
            Text="Remove Empty Rows"
            CssClass="btn btn-warning me-2"
            OnClick="btnClean_Click" />

        <asp:Button ID="btnNormalize" runat="server"
            Text="Normalize Numeric Data"
            CssClass="btn btn-info text-white me-2"
            OnClick="btnNormalize_Click" />

        <asp:Button ID="btnBack" runat="server"
            Text="Next"
            CssClass="btn btn-secondary"
            PostBackUrl="~/AdminLabelEncoding.aspx" OnClick="btnBack_Click" />
    </div>

    <!-- Dataset Display -->
    <div class="table-responsive">
        <asp:GridView ID="gvData" runat="server"
            CssClass="table table-bordered table-hover table-striped"
            AutoGenerateColumns="true"
            AllowPaging="true"
            PageSize="10"
            EmptyDataText="No data available">
        </asp:GridView>
    </div>

</asp:Content>

