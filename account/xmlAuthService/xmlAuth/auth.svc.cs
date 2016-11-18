using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Xml;
using System.Xml.Linq;

/************************************************
/ Hans Hovanitz
/ 11/17/2016
/ CSE 445
************************************************/

namespace xmlAuth
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "auth" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select auth.svc or auth.svc.cs at the Solution Explorer and start debugging.
    public class auth : Iauth
    {
        string Result = "0";
        int count = 0;
        public string DoWork()
        {
            return "done";
        }

        public string Registeration(string userName, string email, string password)
        {
            try
            {
                XDocument docs = XDocument.Load(System.Web.HttpContext.Current.Server.MapPath("/App_Data/Member.xml"));
                count = docs.Descendants("MemberCredentials")
                .Where(id => id.Attribute("UserName").Value == userName)
                .Count();
                if (count == 0)
                {
                    XmlDocument doc = new XmlDocument();
                    doc.Load(System.Web.HttpContext.Current.Server.MapPath("/App_Data/Member.xml"));
                    XmlElement MemberCredentials = doc.CreateElement("MemberCredentials");
                    MemberCredentials.SetAttribute("UserName", userName);
                    MemberCredentials.SetAttribute("Email", email);
                    MemberCredentials.SetAttribute("Password", password);
                    doc.DocumentElement.AppendChild(MemberCredentials);
                    doc.Save(System.Web.HttpContext.Current.Server.MapPath("/App_Data/Member.xml"));
                    // -------------- Successful Save = 1 ------------
                    Result = "1";
                }
                else
                {
                    // --------------User Name Already Exists  = 0 -----------------
                    Result = "0";
                }
            }
            catch (Exception ex)
            {
                return "There was an error. " + ex;
            }
            return Result;
        }

        public string Login(string userName, string password)
        {
            try
            {
                XDocument doc = XDocument.Load(System.Web.HttpContext.Current.Server.MapPath("/App_Data/Member.xml"));
                count = doc.Descendants("MemberCredentials")
                .Where(id => id.Attribute("UserName").Value == userName)
                .Count();
                Result = (count == 0) ? "0" : "1"; //--------User Name Does Not Exist  = 0 -----------
                if (count > 0)
                {
                    Result = ((doc.Descendants("MemberCredentials").Where(id => id.Attribute("UserName").Value == userName && id.Attribute("Password").Value == password).Count()) > 0) ? "1" : "2"; // "Success = 1"    ----- "Invalid Password  = 2"
                }
            }
            catch (Exception ex)
            {
                return "There was an error. " + ex;
            }
            return Result;
        }
    }
}
