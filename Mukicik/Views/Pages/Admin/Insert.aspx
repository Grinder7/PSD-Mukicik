<%@ Page Title="Insert Product - Mukicik" Language="C#" MasterPageFile="~/Views/Layouts/App.Master" AutoEventWireup="true" CodeBehind="Insert.aspx.cs" Inherits="Mukicik.Views.Pages.Admin.Insert" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-input {
            width: 40%;
            margin-bottom: 1rem;
            float: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-3">
        <div>
            <h1 class="text-primary">Insert New Product</h1>
        </div>
        <hr />
        <div class="d-flex flex-row justify-content-start mx-5 mt-4">
            <div class="d-grid gap-3 w-50">
                <div class="row">
                    <asp:Label ID="ProductNameLabel" CssClass="control-label col-3 text-end" runat="server" Text="Product Name"></asp:Label>
                    <asp:TextBox ID="ProductNameInput" CssClass="col-5" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ProductNameRequiredValidator" runat="server" ErrorMessage="*" ControlToValidate="ProductNameInput" CssClass="col-1" />
                </div>
                <div class="row">
                    <asp:Label ID="ProductPriceLabel" CssClass="control-label col-3 text-end" runat="server" Text="Product Price"></asp:Label>
                    <asp:TextBox ID="ProductPriceInput" CssClass="col-5" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ProductPriceRequiredValidator" runat="server" ErrorMessage="*" ControlToValidate="ProductPriceInput" CssClass="col-1" />
                </div>
                <div class="row">
                    <asp:Label ID="ProductImageLabel" CssClass="control-label col-3 text-end" runat="server" Text="Product Image"></asp:Label>
                    <asp:TextBox ID="ProductImageInput" CssClass="col-5" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ProductImageRequiredValidator" runat="server" ErrorMessage="*" ControlToValidate="ProductImageInput" CssClass="col-1" />
                </div>
                <div class="row">
                    <asp:Label ID="ProductRatingLabel" CssClass="control-label col-3 text-end" runat="server" Text="Product Rating"></asp:Label>
                    <asp:TextBox ID="ProductRatingInput" CssClass="col-5" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ProductRatingRequiredValidator" runat="server" ErrorMessage="*" ControlToValidate="ProductRatingInput" CssClass="col-1" />
                    <asp:RangeValidator ID="ProductRatingRangeValidator" runat="server" ErrorMessage="Rating must be in range 0 - 5" MaximumValue="5" MinimumValue="0" ControlToValidate="ProductRatingInput" Display="Dynamic" Type="Double" CultureInvariantValues="True"></asp:RangeValidator>
                </div>
                <div class="row">
                    <asp:Label ID="ProductCategoryLabel" CssClass="control-label col-3 text-end" runat="server" Text="Product Category"></asp:Label>
                    <asp:DropDownList ID="ProductCategoryDropDownList" CssClass="col-5 p-1" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </div>
                <% if (Message != null || Message != "")
                    {
                    %>
                <div class='alert alert-success row' role='alert'><%: Message %></div>
                <%} %>
                <asp:PlaceHolder ID="MessagePlaceHolder" runat="server"></asp:PlaceHolder>
                <div class="row">
                    <asp:Label ID="Label1" runat="server" Text="" CssClass="col-3"></asp:Label>
                    <div class="col p-0">
                        <asp:Button ID="InsertButton" runat="server" Text="Insert" CssClass="btn btn-primary" OnClick="InsertButton_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
