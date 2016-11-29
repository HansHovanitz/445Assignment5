using System;
using System.Collections.Generic;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Xml;
using account.ClosestRestaurantAndNaturalHazards;
using account.NationalWeather;
using EncryptDecrypt;

namespace account
{
  public partial class member : Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (Session.Count == 0 && Session["loggedIn"] != "member" && Session["loggedIn"] != "staff") //user has not logged in
      {
        Response.Redirect("~/login.aspx");
      }

      //If cookie has been set, auto fill the username for the member login - done by Beverly Emmons
      HttpCookie myCookies = Request.Cookies["memberLogin"];
      if ((myCookies != null) && (myCookies["username"] != ""))
      {
        loggedInAs.Text += myCookies["username"];
      }
      //End Beverly's Code
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
        apiUrl = "http://webstrar8.fulton.asu.edu/page5/POIService.svc/PoiSearch/" + location + "?" + "keywords=" +
                 keywords;
        xmlResponse = client.DownloadString(apiUrl);
        lblPOI.Text = xmlResponse;
      }
      catch
      {
        lblPOI.Text =
          "Please make sure you enter a valid location. Ex: Phoenix and some valid keywords. Ex: Bars, entertainment, etc.";
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
        int result =
          Convert.ToInt32(_registration.Registeration(tb_register_user.Text, "blank@blank.com",
            _crypt.Encrypt(tb_register_pw.Text, true)));
        String encryptedPw = _crypt.Encrypt(tb_register_pw.Text, true);
        if (result == 1)
        {
          lbl_register_output.Text = String.Format("User {0} was saved with password {1}.", tb_register_user.Text,
            encryptedPw);
        }
        else if (result == 0)
        {
          lbl_register_output.Text =
            "That user already exists. There have been lots of test users added so please try a new one";
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

    //BEGIN BEVERLY EMMONS' CODE
    protected void btnRestaurant_Click(object sender, EventArgs e)
    {
      IClosestRestaurantAndNaturalHazardsService service = new ClosestRestaurantAndNaturalHazardsServiceClient();

      //get and validate input
      string address = restaurantStreet.Text;
      string city = restaurantcity.Text;
      string state = restaurantstate.Text;
      decimal travelDistance;
      decimal.TryParse(restaurantdistance.Text, out travelDistance);

      if (String.IsNullOrEmpty(address))
      {
        Label1.Text = "Address field cannot be empty.";
      }
      else if (String.IsNullOrEmpty(city))
      {
        Label1.Text = "City field cannot be empty.";
      }
      else if (String.IsNullOrEmpty(state))
      {
        Label1.Text = "State field cannot be empty.";
      }
      else if (travelDistance <= 0)
      {
        Label1.Text = "Travel distance must be > 0.";
      }
      else if (travelDistance > 50000)
      {
        Label1.Text = "Travel distance must be < 50,000.";
      }
      else
      {
        string fullAddress = address + ", " + city + ", " + state;

        //call service
        IList<string> results = service.FindClosestRestaurants(fullAddress, travelDistance);

        //make result text to display
        if (results == null || results.Count == 0)
        {
          Label1.Text = "It looks like there were no results returned for the address and" +
                        " travel distance you entered. You might want to \n try again.";
        }
        else
        {
          string resultsString = string.Empty;
          int countLimitor = 0;
          foreach (string result in results)
          {
            if (countLimitor == 20)
              break;

            resultsString += "<div>" + result + "</div>";
            countLimitor++;
          }

          Label1.Text = resultsString;
        }
      }
    }

    protected void btnHazards_Click(object sender, EventArgs e)
    {
      string longi = longitude.Text;
      string lat = latitude.Text;

      if (longi != string.Empty && lat != string.Empty)
      {
        IClosestRestaurantAndNaturalHazardsService service = new ClosestRestaurantAndNaturalHazardsServiceClient();

        decimal longitude1, latitude1;

        decimal.TryParse(longi, out longitude1);
        decimal.TryParse(lat, out latitude1);

        decimal count = service.NaturalHazardsService(latitude1, longitude1);

        if (count == -1)
        {
          Label2.Text = "Oops! It looks like the longitude and latitude pair \n " +
                        "you provided were invalid, or belonged to a remote location \n" +
                        " that Google Maps could not pinpoint. Please try again!";
        }
        else
        {
          Label2.Text = count.ToString();
        }
      }
    }

    protected void btnWeather_Click(object sender, EventArgs e)
    {
      string zip = zipcode.Text.Trim();

      if (zip == string.Empty || !IsUsZipCode(zip))
      {
        Label4.Text = "Oops! Looks like you entered an invalid zip code. Please try again.";
      }
      else
      {
        INationalWeatherService service = new NationalWeatherServiceClient();
        string[] forecast = service.GetWeatherForecast(zip);

        if (forecast != null)
        {
          Label4.Text = forecast[0] + "<br/>" + forecast[1] + "<br/>" + forecast[2] + "<br/>" + forecast[3] + "<br/>" +
                        forecast[4] + "<br/>";
        }
        else
        {
          Label4.Text = "Oops! Looks like you entered an invalid zip code. Please try again.";
        }
      }
    }

    private bool IsUsZipCode(string zipCode)
    {
      string _usZipRegEx = @"^\d{5}(?:[-\s]\d{4})?$";

      bool validZipCode = !Regex.Match(zipCode, _usZipRegEx).Success ? false : true;

      return validZipCode;
    }

    protected void btnTravel_Click(object sender, EventArgs e)
    {
      string startAddress = travelstartstreet.Text;
      string startCity = travelstartcity.Text;
      string startState = travelstartstate.Text;

      string endAddress = travelendstreet.Text;
      string endCity = travelendcity.Text;
      string endState = travelendstate.Text;

      if (String.IsNullOrEmpty(startAddress))
      {
        Label3.Text = "Starting city field cannot be empty.";
      }
      else if (String.IsNullOrEmpty(startState))
      {
        Label3.Text = "Starting state field cannot be empty.";
      }
      else if (String.IsNullOrEmpty(startCity))
      {
        Label3.Text = "Ending city field cannot be empty.";
      }
      else if (String.IsNullOrEmpty(endState))
      {
        Label3.Text = "Ending state field cannot be empty.";
      }
      else
      {
        Label3.Text = string.Empty;

        if (startAddress == string.Empty || startAddress == "Street Address")
        {
          startAddress = string.Empty;
        }
        if (endAddress == string.Empty || endAddress == "Street Address")
        {
          endAddress = string.Empty;
        }

        string start = startAddress + startCity + startState;
        string end = endAddress + endCity + endState;

        WebClient client = new WebClient();
        XmlDocument xmlDoc = new XmlDocument();

        string apiUrl = "http://webstrar8.fulton.asu.edu/page0/TravelCalculatorService.svc/travel?startAddress=" + start +
                        "&endAddress=" + end;
        string xmlResponse = client.DownloadString(apiUrl);

        if (xmlResponse != string.Empty)
        {
          xmlDoc.LoadXml(xmlResponse);
        }

        string result = xmlDoc.InnerText;

        if (result == string.Empty)
        {
          Label3.Text =
            "It looks like we couldn't resolve directions to your end address from your start address. Please try again.";
        }
        else
        {
          Label3.Text = result;
        }
      }
    }
       //END BEVERLY EMMONS' CODE

    // Invoke for crime service
        protected void ButtonCA_Click(object sender, EventArgs e)
        {

            CrimeService.Service1Client crimeClient = new CrimeService.Service1Client();

            int value = crimeClient.GetCrimeData(TextBoxCA.Text);
            LabelCA.Text = value.ToString();
            
            crimeClient.Close();
        }

        protected void ButtonStemming_Click(object sender, EventArgs e)
        {

            ServiceStemming.ServiceStemmingClient stemClient = new ServiceStemming.ServiceStemmingClient();

            string value = stemClient.GetStem(TextBoxCA0.Text);
            LabelCA0.Text = value.ToString();

            stemClient.Close();
        }

        protected void ButtonStore_Click(object sender, EventArgs e)
        {

            ServiceNearestStore.ServiceNearestStoreClient storeClient = new ServiceNearestStore.ServiceNearestStoreClient();

            String value = storeClient.GetNearestStore(TextBoxCA1.Text, TextBoxCA3.Text);
            LabelCA1.Text = value.ToString();

            storeClient.Close();
        }

        protected void ButtonNumber_Click(object sender, EventArgs e)
        {

            ServiceNumber2Words.ServiceNumber2WordsClient numberClient = new ServiceNumber2Words.ServiceNumber2WordsClient();

            String value = numberClient.Number2Words(TextBoxCA2.Text);
            LabelCA2.Text = value.ToString();

            numberClient.Close();
        }
    }
  }