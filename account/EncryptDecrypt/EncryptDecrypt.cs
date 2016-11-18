using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;


/************************************************
/ Hans Hovanitz
/ 11/17/2016
/ CSE 445
************************************************/

/// <summary>
/// Some of this code was taken from and follows CryptorEngine here: 
/// Source: http://stackoverflow.com/questions/12856140/encrypt-and-decrypt-password
/// </summary>
namespace EncryptDecrypt
{
    public class CryptionFunctions
    {
        public String Encrypt(String toEncrypt, bool useHashing)
        {
            String toUse = toEncrypt;
            String error = "";
            byte[] keyArray;
            byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(toEncrypt);

            System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
            String key = (String)settingsReader.GetValue("SecurityKey", typeof(String));

            try
            {
                if (useHashing == true)
                {
                    MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
                    keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
                    hashmd5.Clear();
                }
                else
                    keyArray = UTF8Encoding.UTF8.GetBytes(key);

                TripleDESCryptoServiceProvider cServiceProvider = new TripleDESCryptoServiceProvider();
                cServiceProvider.Key = keyArray;
                cServiceProvider.Mode = CipherMode.ECB;
                cServiceProvider.Padding = PaddingMode.PKCS7;

                ICryptoTransform cTransform = cServiceProvider.CreateEncryptor();
                byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);
                cServiceProvider.Clear();
                return Convert.ToBase64String(resultArray, 0, resultArray.Length);
            }
            catch(Exception ex)
            {
                error = "Something went wrong." + ex;
                return error;
            }
        }

        public String Decrypt(String cipherString, bool useHashing)
        {
            String toUse = cipherString;
            String error = "";
            byte[] keyArray;
            byte[] toEncryptArray = Convert.FromBase64String(cipherString);

            System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
            String key = (String)settingsReader.GetValue("SecurityKey", typeof(String));

            try
            {
                if (useHashing == true)
                {
                    MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
                    keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
                    hashmd5.Clear();
                }
                else
                    keyArray = UTF8Encoding.UTF8.GetBytes(key);

                TripleDESCryptoServiceProvider cServiceProvider = new TripleDESCryptoServiceProvider();
                cServiceProvider.Key = keyArray;
                cServiceProvider.Mode = CipherMode.ECB;
                cServiceProvider.Padding = PaddingMode.PKCS7;

                ICryptoTransform cTransform = cServiceProvider.CreateDecryptor();
                byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);

                cServiceProvider.Clear();
                return UTF8Encoding.UTF8.GetString(resultArray);
            }
            catch(Exception ex)
            {
                error = "Something went wrong." + ex;
                return error;
            }
        }
    }
}
