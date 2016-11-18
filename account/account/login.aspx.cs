using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//EncryptDecrypt DLL
using EncryptDecrypt;

namespace account
{
    public partial class login : System.Web.UI.Page
    {
        CryptionFunctions _crypt = new CryptionFunctions();
        int result = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //xmlAuth login = new xmlAuth();
            //Use xmlAuth as embedded component or as service. 
            xmlAuthServ.IauthClient login = new xmlAuthServ.IauthClient();
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
                        Response.Redirect("~/member.aspx");
                        break;
                    }
                case 2:
                    {
                        lblPasswordError.Visible = true;
                        lblPasswordError.Text = "Invalid Password";
                        break;
                    }
                default:
                    {
                        System.Console.WriteLine("Something Went Wrong");
                        break;
                    }
            }
        }
    }
}