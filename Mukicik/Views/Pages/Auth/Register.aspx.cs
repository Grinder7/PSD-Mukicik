using Mukicik.Factories;
using Mukicik.Models;
using Mukicik.Repositories.UserRepository;
using System;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mukicik.Views.Pages.Auth
{
    public partial class Register : System.Web.UI.Page
    {
        readonly IUserRepository _userRepository = new UserRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Response.Redirect("~/Views/Pages/Home.aspx");
            }
        }

        protected void DOBCalendar_OnSelectionChanged_SelectionChanged(object sender, EventArgs e)
        {
            DOBInput.Text = DOBCalendar.SelectedDate.ToString("dd MMMM yyyy");
        }


        protected void InsertUserIntoDatabase()
        {
            User user;
            if (ProfilePictureInput.HasFile)
            {
                int userId = _userRepository.GetNextValidId();
                string fileName = Guid.NewGuid().ToString() + new FileInfo(ProfilePictureInput.FileName).Extension;
                Directory.CreateDirectory(Server.MapPath("~/Public/Images/User/") + $"{userId}");
                string filePath = Server.MapPath("~/Public/Images/User/") + userId + "/" + fileName;
                ProfilePictureInput.SaveAs(filePath);
                user = UserFactory.Create(userId, NameInput.Text, EmailInput.Text, PasswordInput.Text, GenderInput.Text, DateTime.ParseExact(DOBInput.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture), fileName);
            }
            else
            {
                user = UserFactory.Create(NameInput.Text, EmailInput.Text, PasswordInput.Text, GenderInput.Text, DateTime.ParseExact(DOBInput.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture), null);
            }
            _userRepository.InsertUser(user);
            _userRepository.SaveChanges();
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                InsertUserIntoDatabase();
                CreateSuccessMessage("Registration successful");
            }
        }

        protected void CreateSuccessMessage(string message)
        {
            RegisterMessagePlaceHolder.Controls.Add(new LiteralControl($"<div class='alert alert-success'>{message}</div>"));
        }

        protected void CreateErrorMessage(string message)
        {
            RegisterMessagePlaceHolder.Controls.Add(new LiteralControl($"<div class='alert alert-danger'>{message}</div>"));
        }

        protected bool CustomEmailValidator(string email)
        {
            bool isValid = true;
            if (!new EmailAddressAttribute().IsValid(email))
            {
                isValid = false;
            }
            else if (email.IndexOf(".") == -1)
            {
                isValid = false;
            }
            return isValid;
        }

        protected void EmailValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (CustomEmailValidator(args.Value))
            {
                args.IsValid = true;
            }
            else
            {
                CreateErrorMessage("Email: Incorrect email format");
                args.IsValid = false;
            }
        }

        protected void GenderCustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value == "")
            {
                args.IsValid = false;
                CreateErrorMessage("Gender: One of the options should be chosen");
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void TermsCheckBoxCustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (!TermsCheckBox.Checked)
            {
                args.IsValid = false;
                CreateErrorMessage("Terms and Conditions: You must agree to the terms and conditions");
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}