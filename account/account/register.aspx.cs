using System;
using System.Web;
//EncryptDecrypt DLL
using EncryptDecrypt;

namespace account
{
    public partial class register : System.Web.UI.Page
    {
        CryptionFunctions _crypt = new CryptionFunctions();

        //Pick to use xmlAuth as embedded component or as service.
        //xmlAuth _registration = new xmlAuth();
        xmlAuthServ.IauthClient _registration = new xmlAuthServ.IauthClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnRegistration_Click(object sender, EventArgs e)
        {
            int resutlt = Convert.ToInt32(_registration.Registeration(txtusername.Text, txtemail.Text, _crypt.Encrypt(txtpassword.Text , true)));
            if (resutlt == 1)
            {
                //Create new cookie for the new member - done by Beverly Emmons
                HttpCookie newCookie = new HttpCookie("memberLogin");
                newCookie["username"] = txtusername.Text;
                newCookie.Expires = DateTime.Now.AddMonths(6);
                Response.Cookies.Add(newCookie);
                //end Beverly's code

                Response.Redirect("~/login.aspx");
            }
            else
            {
                lblUserNameError.Visible = true;
                lblUserNameError.Text = "User Name Aleardy Exist";
            }
            Response.Write(resutlt);
        } 
    }
}