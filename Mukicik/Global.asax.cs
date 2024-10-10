using System;
using System.Web.Routing;

namespace Mukicik
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            //RegisterCustomRoutes(RouteTable.Routes);
            Application["user-count"] = 0;
        }

        void RegisterCustomRoutes(RouteCollection routes)
        {
            routes.MapPageRoute(
                routeName: "Home",
                routeUrl: "",
                physicalFile: "~/Views/Page/Home.aspx"
            );
            routes.MapPageRoute(
                routeName: "Register",
                routeUrl: "register",
                physicalFile: "~/Views/Page/Register.aspx"
            );
            routes.MapPageRoute(
                routeName: "Login",
                routeUrl: "login",
                physicalFile: "~/Views/Page/Login.aspx"
            );
            routes.MapPageRoute(
                routeName: "Product",
                routeUrl: "product",
                physicalFile: "~/Views/Page/ViewProduct.aspx"
                );
            routes.MapPageRoute(
                routeName: "AdminInsert",
                routeUrl: "admin/insert",
                physicalFile: "~/Views/Page/Admin/Insert.aspx"
            );
            routes.MapPageRoute(
                routeName: "AdminModify",
                routeUrl: "admin/modify",
                physicalFile: "~/Views/Page/Admin/Modify.aspx"
            );
            routes.MapPageRoute(
                routeName: "AdminDelete",
                routeUrl: "admin/delete/{id}",
                physicalFile: "~/Views/Page/Admin/DeleteProduct.aspx"
            );

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}