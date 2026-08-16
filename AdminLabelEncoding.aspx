<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminLabelEncoding.aspx.cs" Inherits="AdminLabelEncoding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <h4 class="fw-bold mb-4">
        <i class="bi bi-tags"></i> Label Encoding
    </h4>

    <!-- Message -->
    <asp:Label ID="lblMsg" runat="server" CssClass="fw-semibold mb-3 d-block"></asp:Label>

    <!-- Action Buttons -->
    <div class="mb-4">
        <asp:Button ID="btnEncode" runat="server"
            Text="Apply Label Encoding"
            CssClass="btn btn-primary me-2"
            OnClick="btnEncode_Click" />

        <asp:Button ID="btnNext" runat="server"
            Text="Next: Feature Selection"
            CssClass="btn btn-success me-2"
            PostBackUrl="~/AdminFeatureSelection.aspx" OnClick="btnNext_Click" />

        <asp:Button ID="btnBack" runat="server"
            Text="Next"
            CssClass="btn btn-secondary"
            PostBackUrl="~/AdminDataPreprocessing.aspx" OnClick="btnBack_Click" />
    </div>

    <!-- Dataset Grid -->
    <div class="table-responsive">
        <asp:GridView ID="gvEncoded" runat="server"
            CssClass="table table-bordered table-striped table-hover"
            AutoGenerateColumns="true"
            AllowPaging="true"
            PageSize="10">
        </asp:GridView>
    </div>

</asp:Content>

