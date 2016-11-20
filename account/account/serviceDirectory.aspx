<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="serviceDirectory.aspx.cs" Inherits="account._default" %>

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
                <h2 class="title">Service Directory</h2>
            </div>
        </div>
        <div class="jumbotron">
              
          <asp:Table ID="Table1" runat="server">
              <asp:TableHeaderRow>
                <asp:TableHeaderCell>Service</asp:TableHeaderCell>
                <asp:TableHeaderCell>Provider Name</asp:TableHeaderCell>
                <asp:TableHeaderCell>Component Type</asp:TableHeaderCell>
                <asp:TableHeaderCell>Operation Name</asp:TableHeaderCell>
                <asp:TableHeaderCell>Parameters</asp:TableHeaderCell>
                <asp:TableHeaderCell>Return Type</asp:TableHeaderCell>
                <asp:TableHeaderCell>Description</asp:TableHeaderCell>
                <asp:TableHeaderCell>Link</asp:TableHeaderCell>
              </asp:TableHeaderRow>
          <asp:TableRow>
            <asp:TableCell>Closest Restaurant</asp:TableCell>
            <asp:TableCell>Beverly Emmons</asp:TableCell>
            <asp:TableCell>WSDL</asp:TableCell>
            <asp:TableCell>FindClosestRestaurants</asp:TableCell>
            <asp:TableCell>String, int</asp:TableCell>
            <asp:TableCell>List of Strings</asp:TableCell>
            <asp:TableCell>Enter an address and a distance &#60;= 50,000 meters to get a list of up to 20 nearby restaurants!</asp:TableCell>
            <asp:TableCell>Link Here</asp:TableCell>
           </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>Natural Hazards</asp:TableCell>
            <asp:TableCell>Beverly Emmons</asp:TableCell>
            <asp:TableCell>WSDL</asp:TableCell>
            <asp:TableCell>NaturalHazardService</asp:TableCell>
            <asp:TableCell>String, String</asp:TableCell>
            <asp:TableCell>int</asp:TableCell>
            <asp:TableCell>Enter a latitude and a longitude to get a count of the number of natural hazards in the area!</asp:TableCell>
            <asp:TableCell>Link Here</asp:TableCell>
           </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>Weather Service</asp:TableCell>
            <asp:TableCell>Beverly Emmons</asp:TableCell>
            <asp:TableCell>WSDL</asp:TableCell>
            <asp:TableCell>NationalWeatherService</asp:TableCell>
            <asp:TableCell>String, String</asp:TableCell>
            <asp:TableCell>String [ ]</asp:TableCell>
            <asp:TableCell>Enter a starting address and an ending address to get the travel distance between the locations!</asp:TableCell>
            <asp:TableCell>Link Here</asp:TableCell>
           </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>Travel Calculator</asp:TableCell>
            <asp:TableCell>Beverly Emmons</asp:TableCell>
            <asp:TableCell>RESTful</asp:TableCell>
            <asp:TableCell>TravelCalculator</asp:TableCell>
            <asp:TableCell>String, String</asp:TableCell>
            <asp:TableCell>String</asp:TableCell>
            <asp:TableCell>Enter a starting address and an ending address to get the travel distance between the locations!</asp:TableCell>
            <asp:TableCell>Link Here</asp:TableCell>
           </asp:TableRow>
            </asp:Table>
          			<div class="login-register">
				            <a runat="server" href="default.aspx">Go Back</a>
				         </div>
        </div>
    </div>
</asp:Content>
