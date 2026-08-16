<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminUploadDataset.aspx.cs" Inherits="AdminUploadDataset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h4 class="mb-4 fw-bold">Upload Dataset</h4>

<div class="card shadow-sm">
    <div class="card-body">

        <asp:Label ID="lblMsg" runat="server" CssClass="fw-bold"></asp:Label>

        <div class="row mb-3">
            <div class="col-md-8">
                <asp:FileUpload ID="FileUpload1" runat="server"
                    CssClass="form-control" />
            </div>

            <div class="col-md-4">
                <asp:Button ID="btnUpload" runat="server"
                    Text="Upload & View"
                    CssClass="btn btn-success w-100"
                    OnClick="btnUpload_Click" />
            </div>
            <div class="col-md-4">
                <asp:Button ID="Button1" runat="server"
                    Text="Next"
                    CssClass="btn btn-success w-100" OnClick="Button1_Click" />
            </div>
        </div>

        <hr />

        <asp:GridView ID="gvDataset" runat="server"
            CssClass="table table-bordered table-striped table-hover"
            AutoGenerateColumns="true"
            EmptyDataText="No data to display">
        </asp:GridView>

    </div>
</div>

</asp:Content>

