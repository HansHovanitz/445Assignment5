<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="account.member" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>Staff Page</p>
    <div class="jumbotron">
        
        <h1>Staff Services</h1>

        <asp:Label ID="loggedInAs" runat="server" Text="Logged in as: "></asp:Label>
        <br />
        <br />
        ***Register Staff Account***<br />
        (Input) Enter Username:
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        (Input) Enter Password:
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
&nbsp;<asp:Button ID="Button1" runat="server" Text="Invoke" />
        <br />
        (Output)
        <asp:Label ID="Label1" runat="server" Text="Output will display success, invalid pw, or user does not exist"></asp:Label>
        <br />
        <br />

    </div>
</asp:Content>
