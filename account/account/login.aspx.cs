using System;
using System.Web;
using System.Web.UI;
//EncryptDecrypt DLL
using EncryptDecrypt;

namespace account
{
    public partial class login : Page
    {
        CryptionFunctions _crypt = new CryptionFunctions();
        int result = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            //If cookie has been set, auto fill the username for the member login - done by Beverly Emmons
            HttpCookie myCookies = Request.Cookies["memberLogin"];
            if ((myCookies != null) && (myCookies["username"] != ""))
            {
              txtusername.Text = myCookies["username"];
            }
            //End Beverly's Code
        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //xmlAuth login = new xmlAuth();
            //Use xmlAuth as embedded component or as service. 
            xmlAuthServ.IauthClient login = new xmlAuthServ.IauthClient();

            HttpCookie myCookies = Request.Cookies["memberLogin"];

            result = Convert.ToInt32(login.Login(txtusername.Text, _crypt.Encrypt(txtpassword.Text, true)));
            switch (result)
            {
                case 0:
                    {
                        lblUserNameError.Visible = true;
                        lblUserNameError.Text = "User Name Does Not Exist";
                        break;
                    }
                case 1:
                    {
                        //If the user doesn't have a cookie on the browser,
                        //Create a new cookie for them - done by Beverly Emmons
                        if ((myCookies == null) || (myCookies["username"] == ""))
                        {
                          HttpCookie newCookie = new HttpCookie("memberLogin");
                          newCookie["username"] = txtusername.Text;
                          newCookie.Expires = DateTime.Now.AddMonths(6);
                          Response.Cookies.Add(newCookie);
                        }

                        Session["loggedIn"] = "member";
                        //end Beverly's Code

                        Response.Redirect("~/member.aspx");
                        break;
                    }
                case 2:
                    {
                        lblPasswordError.Visible = true;
                        lblPasswordError.Text = "Invalid Password";
                        break;
                    }
                case 3:
                    {
                        //If the user doesn't have a cookie on the browser,
                        //Create a new cookie for them - done by Beverly Emmons
                        if ((myCookies == null) || (myCookies["username"] == ""))
                        {
                            HttpCookie newCookie = new HttpCookie("memberLogin");
                            newCookie["username"] = txtusername.Text;
                            newCookie.Expires = DateTime.Now.AddMonths(6);
                            Response.Cookies.Add(newCookie);
                        }

                        Session["loggedIn"] = "staff";
                        //end Beverly's Code

                        Response.Redirect("~/staff.aspx");
                        break;
                    }
                default:
                    {
                        Console.WriteLine("Something Went Wrong");
                        break;
                    }
            }
        }
    }
}