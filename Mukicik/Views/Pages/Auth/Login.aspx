<%@ Page Title="Login - Mukicik" Language="C#" MasterPageFile="~/Views/Layouts/App.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Mukicik.Views.Pages.Auth.Login" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="text-primary">Login</h1>
        <hr />
        <div class="d-flex flex-row mt-4">
            <div class="d-grid gap-3 w-75">
                <div class="row">
                    <asp:Label ID="EmailLabel" CssClass="control-label col-3 text-end" runat="server" Text="Email"></asp:Label>
                    <asp:TextBox ID="EmailInput" CssClass="col-5" runat="server" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" runat="server" ErrorMessage="*" ControlToValidate="EmailInput" CssClass="col-1" />
                </div>
                <div class="row">
                    <asp:Label ID="PasswordLabel" CssClass="control-label col-3 text-end" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox ID="PasswordInput" CssClass="col-5" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator" runat="server" ErrorMessage="*" ControlToValidate="PasswordInput" CssClass="col-1" />
                </div>
                <div class="row">
                    <asp:Label ID="SpacerLabel1" runat="server" Text="" CssClass="col-3"></asp:Label>
                    <asp:CheckBox ID="RememberMeCheckBox" runat="server" Text="&amp;#160 Remember Me" CssClass="col-5 p-0" Font-Bold="True" />
                </div>
                <div class="row">
                    <asp:Label ID="Label3" runat="server" Text="" CssClass="col-3"></asp:Label>
                    <div class="col w-25 p-0">
                        <asp:Button ID="LoginButton" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="LoginButton_Click" />
                    </div>
                </div>
                <div class="row">
                    <asp:Label ID="Label6" runat="server" Text="" CssClass="col-3"></asp:Label>
                    <div class="col-5">
                        <asp:PlaceHolder ID="LoginMessagePlaceHolder" runat="server"></asp:PlaceHolder>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
