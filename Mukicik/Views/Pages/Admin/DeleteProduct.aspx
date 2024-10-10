<%@ Page Title="Delete - Mukicik" Language="C#" MasterPageFile="~/Views/Layouts/App.Master" AutoEventWireup="true" CodeBehind="DeleteProduct.aspx.cs" Inherits="Mukicik.Views.Pages.Admin.DeleteProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .vertical-seperator {
            width: 1.5px;
            height: 100%;
            background-color: #000;
            margin-left: 10px;
            margin-right: 10px;
        }

        .back-link {
            color: deepskyblue;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="text-primary">Delete</h1>
        <hr />
        <div class="container mt-5">
            <div class="d-flex flex-row justify-content-start">
                <div class="d-grid gap-3 w-50">
                    <div class="row">
                        <asp:Label ID="ProductIdLabel" CssClass="control-label col-3 text-end" runat="server" Text="Product Id"></asp:Label>
                        <asp:Label ID="ProductIdValue" CssClass="col-5 fw-bold" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="row">
                        <asp:Label ID="ProductNameLabel" CssClass="control-label col-3 text-end" runat="server" Text="Product Name"></asp:Label>
                        <asp:Label ID="ProductNameValue" CssClass="col-5 fw-bold" runat="server" Text="-"></asp:Label>
                    </div>
                    <div class="row">
                        <asp:Label ID="ProductPriceLabel" CssClass="control-label col-3 text-end" runat="server" Text="Product Price"></asp:Label>
                        <asp:Label ID="ProductPriceValue" CssClass="col-5 fw-bold" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="row">
                        <asp:Label ID="ProductImageLabel" CssClass="control-label col-3 text-end" runat="server" Text="Product Image"></asp:Label>
                        <asp:Label ID="ProductImageValue" CssClass="col-5 fw-bold" runat="server" Text="-"></asp:Label>
                    </div>
                    <div class="row">
                        <asp:Label ID="ProductRatingLabel" CssClass="control-label col-3 text-end" runat="server" Text="Product Rating"></asp:Label>
                        <asp:Label ID="ProductRatingValue" CssClass="col-5 fw-bold" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="row">
                        <asp:Label ID="Label1" runat="server" Text="" CssClass="col-3"></asp:Label>
                        <div class="col p-0 d-flex align-items-center">
                            <asp:Button ID="DeleteButton" runat="server" Text="Delete" CssClass="btn btn-primary" OnClick="DeleteButton_Click" />
                            <div class="vertical-seperator"></div>
                            <asp:HyperLink ID="BackLink" runat="server" CssClass="back-link" NavigateUrl="/admin/modify">Back to list</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
