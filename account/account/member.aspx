<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="member.aspx.cs" Inherits="account.member" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>Member Page</p> 
    <div class="jumbotron">
        <asp:Label ID="loggedInAs" runat="server">You are logged in as: </asp:Label>

        <h1>Member Services</h1>
        <h4>
          This page is a package of all the services we, as your travel agency, offer. There are services to find points of interest and restaurants,
          services to calculate travel distances and inform you about natural hazards in the area, a service to inform you about crime rates,
          and even a place to see what our registration and login workflow is like!
        </h4>
        <br />

        <h2>Web Services</h2>
        <h3>Points of Interest : Enter a location and keyword(s) and see 5 points of interest (or less if there aren&#39;t more). The results are kept in json form. Ex: Location: &quot;Tempe&quot; Keywords: &quot;Bar + Pubs&quot;</h3>
        <h4>PoiSearch (String, String) : String [ ]</h4>
        <h4>URL of service: http://webstrar8.fulton.asu.edu/page5/POIService.svc </h4>
        (Input) Enter a location: <asp:TextBox ID="tbPOI_loc" runat="server"></asp:TextBox>
        <br />
        (Input) Enter keywords: <asp:TextBox ID="tbPOI_keywords" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnPOI" runat="server" Text="Invoke" OnClick="btnPOI_Click" />
        <br />
        (Output) Points of Interest: 
        <asp:Label ID="lblPOI" runat="server" Text="POI list will appear here"></asp:Label>
        <br />
        <br />

        <h3>Crime Area: Enter a Zipcode The result is a number representing the total number of crimes in that area.</h3>
        <h4>&nbsp;GetCrimeData (String): int</h4>
        <h4>URL of service: <a href="http://webstrar8.fulton.asu.edu/Page6/Service1.svc">http://webstrar8.fulton.asu.edu/Page6/Service1.svc</a></h4>
        <br />
        (Input) Enter a Zipcode:
        <asp:TextBox ID="TextBoxCA" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="ButtonCA" runat="server" OnClick="ButtonCA_Click" Text="Invoke" />
        <br />
        (Output) Crime Number: <asp:Label ID="LabelCA" runat="server" Text="Crime Number will appear here"></asp:Label>
        <br />

        <h3>Stemming: Enter a Word or Words. The result is a list of words that are the Stems of the given words, Stems do not have to be actual words.</h3>
        <h4>&nbsp;GetStem (String): String</h4>
        <h4>URL of service: <a href="http://webstrar8.fulton.asu.edu/Page6/Service1.svc">http://webstrar8.fulton.asu.edu/Page7/ServiceStemming.svc</a></h4>
        <br />
        (Input) Enter Word(s):
        <asp:TextBox ID="TextBoxCA0" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="ButtonCA0" runat="server" OnClick="ButtonStemming_Click" Text="Invoke" />
        <br />
        (Output) Stems: <asp:Label ID="LabelCA0" runat="server" Text="Stems will appear here"></asp:Label>
        <br />

        <h3>Nearest Store: Enter a store name and a Zipcode. The result is a string representing the street adress of the store.</h3>
        <h4>&nbsp;GetNearestStore (String, String): String</h4>
        <h4>URL of service: <a href="http://webstrar8.fulton.asu.edu/Page6/Service1.svc">http://webstrar8.fulton.asu.edu/Page8/ServiceNearestStore.svc</a></h4>
        <br />
        (Input) Enter a Store:
        <asp:TextBox ID="TextBoxCA1" runat="server"></asp:TextBox>
        <br />
        (Input) Enter a Zipcode:
        <asp:TextBox ID="TextBoxCA3" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="ButtonCA1" runat="server" OnClick="ButtonStore_Click" Text="Invoke" />
        <br />
        (Output) Store Location: <asp:Label ID="LabelCA1" runat="server" Text="Store location will appear here"></asp:Label>
        <br/>

      
        <h3>Number 2 Words: Enter a number The result is a string representing an equivelent number using words where possible</h3>
        <h4>&nbsp;Number2Words (String): String</h4>
        <h4>URL of service: <a href="http://webstrar8.fulton.asu.edu/Page6/Service1.svc">http://webstrar8.fulton.asu.edu/Page9/ServiceNumber2Words.svc</a></h4>
        <br />
        (Input) Enter Number:
        <asp:TextBox ID="TextBoxCA2" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="ButtonCA2" runat="server" OnClick="ButtonNumber_Click" Text="Invoke" />
        <br />
        (Output) Number: <asp:Label ID="LabelCA2" runat="server" Text="Number will appear here"></asp:Label>

      
          <!-- Begin Beverly Emmons' Code-->
        <h3>Closest Restaurant Service : Enter an address and a distance &#60;= 50,000 meters to get a list of up to 20 nearby restaurants! </h3>
        <h4>FindClosestRestaurants (String, int) : List of strings </h4>
        <h4>URL of service:  http://webstrar8.fulton.asu.edu/Page2/ClosestRestaurantAndNaturalHazardsService.svc?wsdl </h4>
        (Input) Enter an address: <asp:TextBox ID="restaurantStreet" runat="server">Street</asp:TextBox> 
        <asp:TextBox ID="restaurantcity" runat="server">City</asp:TextBox> 
        <asp:TextBox ID="restaurantstate" runat="server">State</asp:TextBox>
        <br />
        (Input) Enter a distance &#60;= 50,000m: <asp:TextBox ID="restaurantdistance" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Invoke" OnClick="btnRestaurant_Click" />
        <br />
        (Output) Closest Restaurants: 
        <asp:Label ID="Label1" runat="server" Text="Closest restaurants list will appear here"></asp:Label>
        <br />
        <br />
      
        <h3>Natural Hazards Service : Enter a latitude and a longitude to get a count of the number of natural hazards in the area! </h3>
        <h4>NaturalHazardService (String, String) : int </h4>
        <h4>URL of service:  http://webstrar8.fulton.asu.edu/Page2/ClosestRestaurantAndNaturalHazardsService.svc?wsdl </h4>
        (Input) Enter a latitude: <asp:TextBox ID="latitude" runat="server"></asp:TextBox> 
        <br />
        (Input) Enter a longitude: <asp:TextBox ID="longitude" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button2" runat="server" Text="Invoke" OnClick="btnHazards_Click" />
        <br />
        (Output) Natural Hazards Count: 
        <asp:Label ID="Label2" runat="server" Text="Count will appear here"></asp:Label>
        <br />
        <br />
      
        <h3>Travel Distance Calculator : Enter a starting address and an ending address to get the travel distance between the locations! </h3>
        <h4>TravelCalculator (String, String) : String </h4>
        <h4>URL of service:  http://webstrar8.fulton.asu.edu/page0/TravelCalculatorService.svc/travel?startAddress=YOUR_ADDRESS&&endAddress=YOUR_ADDRESS </h4>
        (Input) Enter a starting address: <asp:TextBox ID="travelstartstreet" runat="server">Street</asp:TextBox> 
        <asp:TextBox ID="travelstartcity" runat="server">City</asp:TextBox> 
        <asp:TextBox ID="travelstartstate" runat="server">State</asp:TextBox>
        <br />
        (Input) Enter a starting address: <asp:TextBox ID="travelendstreet" runat="server">Street</asp:TextBox> 
        <asp:TextBox ID="travelendcity" runat="server">City</asp:TextBox> 
        <asp:TextBox ID="travelendstate" runat="server">State</asp:TextBox>
        <br />
        <asp:Button ID="Button3" runat="server" Text="Invoke" OnClick="btnTravel_Click" />
        <br />
        (Output) Travel Distances: 
        <asp:Label ID="Label3" runat="server" Text="Travel distances will appear here"></asp:Label>
        <br />
        <br />
      
        <h3>Natural Weather Service : Enter a starting address and an ending address to get the travel distance between the locations! </h3>
        <h4>NationalWeatherService (String) : String [ ] </h4>
        <h4>URL of service:  http://webstrar8.fulton.asu.edu/Page1/NationalWeatherService.svc?wsdl </h4>
        (Input) Enter a zipcode: <asp:TextBox ID="zipcode" runat="server"></asp:TextBox> 
        <br />
        <asp:Button ID="Button4" runat="server" Text="Invoke" OnClick="btnWeather_Click" />
        <br />
        (Output) Weather Forecast: 
        <asp:Label ID="Label4" runat="server" Text="5-Day weather forecast will appear here"></asp:Label>
        <br />
        <br />
        <!-- End Beverly Emmons' Code -->

        <h2>Components</h2>
        <h3>EncryptDecrypt DLL : Encrypt and Decrypt Passwords</h3>
        <h4>Encrypt (String, bool) : String </h4>
        <h4>Decrypt (String, bool) : String </h4>
        <h4>DLL located in bin of application</h4>
        (Input) Enter password:
        <asp:TextBox ID="tb_encrypt" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btn_encrypt" runat="server" Text="Invoke" OnClick="btn_encrypt_Click" />
        <br />
        (Output)
        <asp:Label ID="lbl_encryptOut" runat="server" Text="Here"></asp:Label>
        <br />
        (Input) Enter encrypted password:
        <asp:TextBox ID="tb_decrypt" runat="server" Width="146px">paste password output here</asp:TextBox>
        <br />
        <asp:Button ID="btn_decrypt" runat="server" Text="Invoke" OnClick="btn_decrypt_Click" />
        <br />
        (Output)
        <asp:Label ID="lbl_decryptOut" runat="server" Text="Here"></asp:Label>
        <br />
        <br />

        <h3>XML Member Register/Login : Register an Account and then Try to Login</h3>
        <h4>Registration (String, String, String) : String </h4>
        <h4>Login (String, String) : String </h4>
        <h4>xmlAuth is embedded in the application and also available as a service here: http://webstrar8.fulton.asu.edu/page3/auth.svc </h4>
        **Register an Account**
        <br />
        (Input) Enter Username:
        <asp:TextBox ID="tb_register_user" runat="server"></asp:TextBox>
        <br />
        (Input) Enter Password:<asp:TextBox ID="tb_register_pw" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btn_register" runat="server" Text="Invoke" OnClick="btn_register_Click" />
        <br />
        (Output) <asp:Label ID="lbl_register_output" runat="server" Text="Output will display success, username already exists, or failure"></asp:Label>
        <br />
        <br />
        **Login to an Account**
        <br />
        (Input) Enter Username:
        <asp:TextBox ID="tb_login_user" runat="server"></asp:TextBox>
        <br />
        (Input) Enter Password: <asp:TextBox ID="tb_login_pw" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btn_login" runat="server" Text="Invoke" OnClick="btn_login_Click" />
        <br />
        (Output) <asp:Label ID="lbl_login_output" runat="server" Text="Output will display success, invalid pw, or user does not exist"></asp:Label>
        <br />
        <br />
        You can click here to go through the actual flow of creating an account and logging in: <asp:Button ID="btn_flow" runat="server" Text="Link" OnClick="btn_flow_Click" />

      			<div class="login-register">
				            <a runat="server" href="default.aspx">Go Back</a>
				         </div>

    </div>
</asp:Content>
