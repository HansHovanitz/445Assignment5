using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace account
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session != null)
            {
                if (Session.Count == 0) //user has not logged in
                {
                    if (Session["loggedIn"] != "member")
                    {
                        Response.Redirect("~/member.aspx");
                    }
                    else if (Session["loggedIn"] != "staff")
                    {
                        Response.Redirect("~/staff.aspx");
                    }
                }
            }
        }

        protected void Application_BeginRequest()
        {
            // forced redirect of user when session is not detected
            //if (Session.Count == 0 && Session["loggedIn"] != "member" && Session["loggedIn"] != "staff") //user has not logged in
            //{
            //    Response.Redirect("~/login.aspx");
            //}
        }
    }
}