<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminFeatureSelection.aspx.cs" Inherits="AdminFeatureSelection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      <h2>Feature Selection</h2>
        <asp:Label ID="lblMsg" runat="server" Text="" CssClass="text-danger"></asp:Label>
        <div class="mt-3">
            <asp:CheckBoxList ID="cblFeatures" runat="server" RepeatDirection="Vertical" CssClass="form-check"></asp:CheckBoxList>
        </div>
        <div class="mt-3">
            <asp:Button ID="btnSelectFeatures" runat="server" Text="Save Selected Features" CssClass="btn btn-primary" OnClick="btnSelectFeatures_Click" />
            <asp:Button ID="btnBack" runat="server" Text="Next" CssClass="btn btn-secondary ms-2" OnClick="btnBack_Click" />
        </div>
</asp:Content>

