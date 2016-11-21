using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EncryptDecrypt;

namespace account
{
    public partial class staff : Page
    {

        CryptionFunctions _crypt = new CryptionFunctions();

        //Pick to use xmlAuth as embedded component or as service.
        //xmlAuth _registration = new xmlAuth();
        xmlAuthServ.IauthClient _registration = new xmlAuthServ.IauthClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count == 0 && Session["loggedIn"] != "staff") //user has not logged in as staff
            {
                Response.Redirect("~/login.aspx");
            }

            //If cookie has been set, auto fill the username for the member login - done by Beverly Emmons
            HttpCookie myCookies = Request.Cookies["memberLogin"];
            if ((myCookies != null) && (myCookies["username"] != ""))
            {
                loggedInAs.Text += myCookies["username"];
            }
            //End Josh's copy of Beverly's Code
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int resutlt = Convert.ToInt32(_registration.RegisterationStaff(TextBox1.Text, TextBox3.Text, _crypt.Encrypt(TextBox2.Text, true)));
            if (resutlt == 1)
            {
                //Create new cookie for the new member - done by Beverly Emmons
                HttpCookie newCookie = new HttpCookie("memberLogin");
                newCookie["username"] = TextBox1.Text;
                newCookie.Expires = DateTime.Now.AddMonths(6);
                Response.Cookies.Add(newCookie);
                //end Beverly's code

                Response.Redirect("~/login.aspx");
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "User Name Aleardy Exist";
            }
            Response.Write(resutlt);
        }
    }
}