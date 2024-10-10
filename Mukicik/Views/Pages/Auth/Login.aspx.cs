using Mukicik.Models;
using Mukicik.Repositories.UserRepository;
using System;
using System.Web;
using System.Web.UI;

namespace Mukicik.Views.Pages.Auth
{
    public partial class Login : System.Web.UI.Page
    {
        readonly IUserRepository _userRepository = new UserRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Response.Redirect("~/Views/Page/Home.aspx");
            }
            if (Request.Cookies["user-cred"] != null)
            {
                int userId = int.Parse(Request.Cookies["user-cred"].Value);
                User user = _userRepository.GetUserById(userId);
                Session["user"] = user;
                Application["user-count"] = ((int)Application["user-count"]) + 1;
                Response.Redirect("~/Views/Pages/Home.aspx");
            }
        }

        protected void CreateUserCredCookie(string userId)
        {
            HttpCookie cookie = new HttpCookie("user-cred")
            {
                Value = userId,
                Expires = DateTime.Now.AddDays(1)
            };
            Response.Cookies.Add(cookie);
        }

        protected void CreateErrorMessage(string message)
        {
            LoginMessagePlaceHolder.Controls.Add(new LiteralControl($"<div class='alert alert-danger'>{message}</div>"));
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            User user = _userRepository.GetUserByEmailAndPassword(EmailInput.Text, PasswordInput.Text);
            if (user == null)
            {
                CreateErrorMessage("Wrong combination of email and password");
                return;
            }
            Session["user"] = user;
            if (RememberMeCheckBox.Checked)
            {
                CreateUserCredCookie(user.UserId.ToString());
            }
            Application["user-count"] = ((int)Application["user-count"]) + 1;
            Response.Redirect("~/Views/Pages/Home.aspx");
        }
    }
}