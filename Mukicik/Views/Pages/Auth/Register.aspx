<%@ Page Title="Register - Mukicik" Language="C#" MasterPageFile="~/Views/Layouts/App.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Mukicik.Views.Pages.Auth.Register" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mx-5 mt-3">
        <div>
            <h1 class="text-primary">Register</h1>
        </div>
        <hr />
        <div class="d-flex flex-row justify-content-center mx-5 mt-4">
            <div class="d-grid gap-3 w-75">
                <div class="row">
                    <asp:Label ID="EmailLabel" CssClass="control-label col-3 text-end" runat="server" Text="Email"></asp:Label>
                    <asp:TextBox ID="EmailInput" CssClass="col-5" runat="server" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="EmailInput" CssClass="col-1" />
                    <asp:CustomValidator ID="EmailValidator" runat="server" ErrorMessage="*" CssClass="col-1" ControlToValidate="EmailInput" OnServerValidate="EmailValidator_ServerValidate" ValidateEmptyText="true"></asp:CustomValidator>
                </div>
                <div class="row">
                    <asp:Label ID="NameLabel" CssClass="control-label col-3 text-end" runat="server" Text="Name"></asp:Label>
                    <asp:TextBox ID="NameInput" CssClass="col-5" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="NameInput" CssClass="col-1" />
                </div>
                <div class="row">
                    <asp:Label ID="PasswordLabel" CssClass="control-label col-3 text-end" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox ID="PasswordInput" CssClass="col-5" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="PasswordInput" CssClass="col-1" />
                </div>
                <div class="row">
                    <asp:Label ID="ConfirmLabel" CssClass="control-label col-3 text-end" runat="server" Text="Confirm Password"></asp:Label>
                    <asp:TextBox ID="ConfirmInput" CssClass="col-5" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="ConfirmInput" CssClass="col-1" />
                    <asp:CompareValidator ID="ComparePasswordValidator" runat="server" ErrorMessage="Password must be the same" ControlToValidate="PasswordInput" ControlToCompare="ConfirmInput" Display="Dynamic"></asp:CompareValidator>
                </div>
                <div class="row">
                    <asp:Label ID="GenderLabel" CssClass="control-label col-3 text-end" runat="server" Text="Gender"></asp:Label>
                    <div class="col-5">
                        <asp:RadioButtonList ID="GenderInput" runat="server" RepeatDirection="Horizontal" Width="60%">
                            <asp:ListItem Value="Male">&amp;#160 Male</asp:ListItem>
                            <asp:ListItem Value="Female">&amp;#160 Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <asp:CustomValidator ID="GenderCustomValidator" runat="server" ErrorMessage="*" CssClass="col-1" ControlToValidate="GenderInput" OnServerValidate="GenderCustomValidator_ServerValidate" ValidateEmptyText="true"></asp:CustomValidator>
                </div>
                <div class="row">
                    <asp:Label ID="DOBLabel" CssClass="control-label col-3 text-end" runat="server" Text="Date Of Birth"></asp:Label>
                    <div class="col-5">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="DOBUpdatePanel" runat="server">
                            <ContentTemplate>
                                <asp:Calendar ID="DOBCalendar" runat="server" OnSelectionChanged="DOBCalendar_OnSelectionChanged_SelectionChanged"></asp:Calendar>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <asp:Label ID="Label4" runat="server" Text="" CssClass="col-1"></asp:Label>
                </div>
                <div class="row">
                    <asp:Label ID="Label1" runat="server" Text="" CssClass="col-3"></asp:Label>
                    <div class="col-5">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="DOBInput" CssClass="form-control w-100" runat="server" Enabled="False"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="DOBInput" CssClass="col-1" />
                </div>
                <div class="row align-items-center">
                    <asp:Label ID="ProfilePictureLabel" CssClass="control-label col-3 text-end" runat="server" Text="Profile Picture"></asp:Label>
                    <asp:FileUpload ID="ProfilePictureInput" class="col-5" runat="server" />
                    <asp:Label ID="Label5" runat="server" Text="" CssClass="col-1"></asp:Label>
                </div>
                <div class="row">
                    <asp:Label ID="Label2" runat="server" Text="" CssClass="col-3"></asp:Label>
                    <asp:CheckBox ID="TermsCheckBox" runat="server" Text="&amp;#160 I agree to terms and conditions" CssClass="col-5" Font-Bold="True" />
                    <asp:CustomValidator ID="TermsCheckBoxCustomValidator" runat="server" ErrorMessage="*" CssClass="col-1" OnServerValidate="TermsCheckBoxCustomValidator_ServerValidate"></asp:CustomValidator>
                </div>
                <div class="row">
                    <asp:Label ID="Label3" runat="server" Text="" CssClass="col-3"></asp:Label>
                    <div class="col w-25">
                        <asp:Button ID="RegisterButton" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="RegisterButton_Click" />
                    </div>
                </div>
                <div class="row">
                    <asp:Label ID="Label6" runat="server" Text="" CssClass="col-3"></asp:Label>
                    <div class="col-5">
                        <asp:PlaceHolder ID="RegisterMessagePlaceHolder" runat="server"></asp:PlaceHolder>
                    </div>
                </div>
            </div>
            <div class="w-25 overflow-hidden">
                <asp:Image ID="ViolinImage" runat="server" ImageUrl="~/Views/Images/violin-vector.png" CssClass="img-responsive" draggable="false" AlternateText="violin" />
            </div>
        </div>
    </div>
</asp:Content>
