using Mukicik.Models;
using System;
using System.Web;

namespace Mukicik.Views.Layouts
{
    public partial class App : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["user-cred"] != null && Session["user"] == null)
            {
                Response.Redirect("~/Views/Pages/Auth/Login.aspx");
            }
            if (Session["user"] != null)
            {
                User user = (User)Session["user"];
                NavUsernameLabel.Text = user.Username;
            }
            UserCountLabel.Text = "Users Count: " + Application["user-count"].ToString();
        }

        protected void NavLogoutButton_Click(object sender, EventArgs e)
        {
            Application["user-count"] = ((int)Application["user-count"]) - 1;
            Session["user"] = null;
            if (Request.Cookies["user-cred"] != null)
            {
                HttpCookie cookie = new HttpCookie("user-cred")
                {
                    Expires = DateTime.Now.AddDays(-1)
                };
                Response.Cookies.Add(cookie);
            }
            Response.Redirect("~/Views/Pages/Home.aspx");
        }
    }
}