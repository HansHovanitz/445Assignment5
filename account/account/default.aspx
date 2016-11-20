<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="account._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        fieldset.scheduler-border {
            border: 1px groove #ddd !important;
            padding: 0 1.4em 1.4em 1.4em !important;
            margin: 0 0 1.5em 0 !important;
            -webkit-box-shadow: 0px 0px 0px 0px #000;
            box-shadow: 0px 0px 0px 0px #000;
        }

        legend.scheduler-border {
            width: inherit; /* Or auto */
            padding: 0 10px; /* To give a bit of padding on the left and right */
            border-bottom: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row main">
        <div class="panel-heading">
            <div class="panel-title text-center">
                <h2 class="title">Welcome to the travel agency landing page! </h2>
            </div>
        </div>
      <div class="jumbotron">
         <div>
            <h3>Services we offer:</h3>
            <h4>A locator for points of interest
              <br/>
              A locator for restaurants near you
              <br/>
              A tool for counting natural hazards in an area
              <br/>
              A tool for seeing crime rates for an area
              <br/>
              A weather forecast tool
              <br/>
              A tool for calculating travel distance between two places
            </h4>
            </div>
          <div>
            <h3>How to sign up:</h3>
            <h4>
              To sign up, simply click the "Member Register" button below. If you already have an account, you may sign in using the "Member Login" button below.
              Once you are logged in, you will be automatically redirected to the member page to use the services we provide.
            </h4>
            </div>
          <div>
            <h3>TA's - How to test: </h3>
            <h4>
              The member registration page saves the username, password, and email of the new user to an XML file. This ensures that no user
              may sign up with the same username. Once a user registers, they will be redirected to login so that they can access the member page
              where they can try out all the services listed above.
              <br/>
              <br/>
              Once a user makes an account, they may login using that account on their next visits by clicking "Member login". This will ask
              for their username and password. If the account was created on the same browser on the same machine, then the username will be
              pre-populated for them. Otherwise, or if the user has cleared their cookies since account creation, the username field will be blank.
              Entering the correct password will allow the user to login and to be redirected to the member page to try out the services.
              <br/>
              <br/>
              Accessing the member page before logging in or after logging out will redirect the user to the login page.
              <br/>
              <br/>
              The link to the staff page will require a staff login. The staff login username is: PUT STAFF INFO HERE!!. The staff login password is:
              PUT STAFF INFO HERE!!. Logging into the staff page will allow the staff member to add additional staff members to the XML file.
              <br/>
              <br/>
              The service directory page is a list of the components and their creators, just like in assignment 3.
              <br/>
              Cookies are used to store the username of the last user to log on.
              Session state is used to track whether a user has logged in or not, which determines their access to the member page.
            </h4>
            <h3>Test cases/Inputs:</h3>
            <h4></h4>
            <br/>
          </div>
      </div>
        <div class="main-login main-center">
            <div class="form-horizontal">
                <div class="row">
                    <div class="col-md-6">
                        <a href="Register.aspx" runat="server" class="btn btn-info">Member   Register
                        </a>
                    </div>
                    <div class="col-md-6">
                        <a href="login.aspx" runat="server" class="btn btn-info">Member   Login
                        </a>
                    </div>
                  </div>
              <br/>
              <div class="row">
                  <div class="col-md-6">
                        <a href="Staff.aspx" runat="server" class="btn btn-info">Staff Page
                        </a>
                    </div>
                  <div class="col-md-6">
                        <a href="http://group5.mobicloud.asu.edu/index.html" runat="server" class="btn btn-info">Service Directory
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
