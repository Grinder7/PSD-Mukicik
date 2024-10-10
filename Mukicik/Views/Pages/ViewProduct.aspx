<%@ Page Title="Product - Mukicik" Language="C#" MasterPageFile="~/Views/Layouts/App.Master" AutoEventWireup="true" CodeBehind="ViewProduct.aspx.cs" Inherits="Mukicik.Views.Pages.ViewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="text-primary mt-3">Our Products</h1>
        <hr />
        <div class="card-list w-100">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5 row-cols-xxl-6 row-gap-3">
                <% foreach (Mukicik.Models.Product product in Products)
                    { %>
                    <div class="col">
                        <div class="card m-auto" style="width: 12rem">
                            <img src="/Views/Images/Products/<%:product.ProductImage%>" alt="<%: product.ProductName %>" class="card-img-top object-fit-contain p-3" style="height: 245px"/>
                            <div class="card-body">
                                <h5 class="card-title text-primary">
                                    <%: product.ProductName %>
                                </h5>
                                <p class="card-text fw-bold" style="color: goldenrod">
                                    <%: product.ProductRating %> ⭐
                                </p>
                                <p class="card-text">
                                    <%: product.ProductPrice.ToString("C", System.Globalization.CultureInfo.CreateSpecificCulture("id-id")) %>
                                </p>
                            </div>
                        </div>
                    </div>
                <%} %>
            </div>
        </div>
    </div>
</asp:Content>
