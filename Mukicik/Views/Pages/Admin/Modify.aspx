<%@ Page Title="Modify - Mukicik" Language="C#" MasterPageFile="~/Views/Layouts/App.Master" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="Mukicik.Views.Pages.Admin.Modify" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .grid-select-button {
            text-decoration: none;
            color: deepskyblue !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div>
            <h1 class="text-primary">Modify Product</h1>
        </div>
        <hr />
        <div class="mt-3">
            <div>
                <asp:GridView ID="ProductGridView" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="w-100" BorderWidth="1px" OnRowDeleting="ProductGridView_RowDeleting" EmptyDataText="No Product" OnRowEditing="ProductGridView_RowEditing">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:ButtonField CommandName="Edit" Text="Select" ControlStyle-CssClass="grid-select-button"/>
                        <asp:BoundField DataField="ProductId" HeaderText="Id" SortExpression="ProductId"></asp:BoundField>
                        <asp:BoundField DataField="ProductName" HeaderText="Name" SortExpression="ProductName"></asp:BoundField>
                        <asp:BoundField DataField="ProductPrice" HeaderText="Price" SortExpression="ProductPrice"></asp:BoundField>
                        <asp:BoundField DataField="ProductImage" HeaderText="Image" SortExpression="ProductImage"></asp:BoundField>
                        <asp:BoundField DataField="ProductRating" HeaderText="Rating" SortExpression="ProductRating"></asp:BoundField>
                        <asp:TemplateField HeaderText="Category">
                            <ItemTemplate>
                                <asp:HiddenField ID="CategoryIdField" runat="server" Value=<%# Bind("Category.CategoryId") %> />
                                <asp:Label ID="CategoryLabel" runat="server" Text='<%# Bind("Category.CategoryName") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ButtonField CommandName="Delete" Text="Delete" ControlStyle-CssClass="btn btn-primary text-white"/>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </div>
            <div class="container mt-5">
                <div class="d-flex flex-row justify-content-start">
                    <div class="d-grid gap-3 w-50">
                        <div class="row">
                            <asp:Label ID="ProductIdLabel" CssClass="control-label col-3 text-end" runat="server" Text="Product Id"></asp:Label>
                            <asp:TextBox ID="ProductIdInput" CssClass="col-5" runat="server" Enabled="false"></asp:TextBox>
                            
                        </div>
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
                        </div>
                        <asp:RangeValidator ID="ProductRatingRangeValidator" runat="server" ErrorMessage="Rating must be in range 1 - 5" MaximumValue="5" MinimumValue="0" ControlToValidate="ProductRatingInput" CssClass="row" Display="Dynamic" Type="Double"></asp:RangeValidator>
                        <div class="row">
                            <asp:Label ID="ProductCategoryLabel" CssClass="control-label col-3 text-end" runat="server" Text="Product Category"></asp:Label>
                            <asp:DropDownList ID="ProductCategoryDropDownList" CssClass="col-5 p-1" runat="server">
                            </asp:DropDownList>
                        </div>
                        <asp:PlaceHolder ID="MessagePlaceHolder" runat="server"></asp:PlaceHolder>
                        <div class="row">
                            <asp:Label ID="Label1" runat="server" Text="" CssClass="col-3"></asp:Label>
                            <div class="col p-0">
                                <asp:Button ID="UpdateButton" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="UpdateButton_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
