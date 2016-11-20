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
    public partial class member : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPOI_Click(object sender, EventArgs e)
        {
            String location;
            String keywords;
            String apiUrl;
            String xmlResponse;
            WebClient client = new WebClient();
            try
            {
                location = tbPOI_loc.Text;
                keywords = tbPOI_keywords.Text;
                apiUrl = "http://webstrar8.fulton.asu.edu/page5/POIService.svc/PoiSearch/" + location + "?" + "keywords=" + keywords;
                xmlResponse = client.DownloadString(apiUrl);
                lblPOI.Text = xmlResponse;
            }
            catch
            {
                lblPOI.Text = "Please make sure you enter a valid location. Ex: Phoenix and some valid keywords. Ex: Bars, entertainment, etc.";
            }
        }

        protected void btn_encrypt_Click(object sender, EventArgs e)
        {
            try
            {
                CryptionFunctions _crypt = new CryptionFunctions();
                String strToEncrypt = tb_encrypt.Text;
                String result = _crypt.Encrypt(strToEncrypt, true);
                lbl_encryptOut.Text = result;
            }
            catch
            {
                lbl_encryptOut.Text = "Please Try Again.";
            }
        }

        protected void btn_decrypt_Click(object sender, EventArgs e)
        {
            try
            {
                CryptionFunctions _crypt = new CryptionFunctions();
                String strToDecrypt = tb_decrypt.Text;
                String result = _crypt.Decrypt(strToDecrypt, true);
                lbl_decryptOut.Text = result;
            }
            catch
            {
                lbl_decryptOut.Text = "Please Try Again.";
            }

        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            //Pick to use xmlAuth as embedded or as service. 
            xmlAuthServ.IauthClient _registration = new xmlAuthServ.IauthClient();
            //xmlAuth _registration = new xmlAuth();

            CryptionFunctions _crypt = new CryptionFunctions();
 
            try
            {
                int result = Convert.ToInt32(_registration.Registeration(tb_register_user.Text, "blank@blank.com", _crypt.Encrypt(tb_register_pw.Text, true)));
                String encryptedPw = _crypt.Encrypt(tb_register_pw.Text, true);
                if (result == 1)
                {
                    lbl_register_output.Text = System.String.Format("User {0} was saved with password {1}.", tb_register_user.Text, encryptedPw);
                }
                else if (result == 0)
                {
                    lbl_register_output.Text = "That user already exists. There have been lots of test users added so please try a new one";
                }
                else
                {
                    lbl_register_output.Text = "Please try again";
                }
            }
            catch
            {
                lbl_register_output.Text = "Please try again";
            }
            
            

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            //Pick between embedded component and service. 
            xmlAuthServ.IauthClient _login = new xmlAuthServ.IauthClient();
            //xmlAuth _login = new xmlAuth();

            CryptionFunctions _crypt = new CryptionFunctions();
            
            try
            {
                int result = Convert.ToInt32(_login.Login(tb_login_user.Text, _crypt.Encrypt(tb_login_pw.Text, true)));
                if (result == 0)
                {
                    lbl_login_output.Text = "User Name Does Not Exist";
                }
                else if (result == 1)
                {
                    lbl_login_output.Text = "Successful Login";
                }
                else if (result == 2)
                {
                    lbl_login_output.Text = "Password is Invalid";
                }
                else
                {
                    lbl_login_output.Text = "Something Went Wrong. Try Again Please";
                }
            }
            catch
            {
                lbl_login_output.Text = "Something Went Wrong. Try Again Please";
            }
        }

        protected void btn_flow_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/default.aspx");
        }
    }
}