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