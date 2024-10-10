<%@ Page Title="Home - Mukicik" Language="C#" MasterPageFile="~/Views/Layouts/App.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Mukicik.Views.Pages.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="d-flex flex-row h-100 mx-5">
            <div class="p-3 d-flex justify-content-center" style="flex: 4 1 auto">
                <asp:Image ID="GuitarImage" AlternateText="guitar"
                    ImageAlign="left"
                    ImageUrl="~/Views/Images/retro-guitar-vector.png" runat="server" Height="520px" />

            </div>
            <div class="d-flex flex-column justify-content-start mt-5 pt-5" style="flex: 5 1 auto">
                <h1 class="text-primary" style="font-size: 66px">Mukicik</h1>
                <h3 class="text-primary mt-3">An innovative music selling store with competitive prices</h3>
                <h3 class="text-primary mb-4">It's never this cheap to shop in music!</h3>
                <%if (Session["user"] == null)
                    {%>
                <asp:LinkButton CssClass="btn btn-primary text-white bg-gradient" Style="width: fit-content" ID="RegisterButton" runat="server" PostBackUrl="~/Views/Pages/Register.aspx">Be a New Member</asp:LinkButton>
                <%}
                    else
                    {%>
                <asp:LinkButton CssClass="btn btn-primary text-white bg-gradient" Style="width: fit-content" ID="ViewProductButton" runat="server" PostBackUrl="~/Views/Pages/ViewProduct.aspx">View Products</asp:LinkButton>
                <%} %>
            </div>
        </div>
        <div class="container">
            <hr />
            <h2 class="text-primary mb-4">Top Products</h2>
            <div class="card-list d-flex flex-row w-100 justify-content-around">
                <% foreach (Mukicik.Models.Product product in TopSixProducts)
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
