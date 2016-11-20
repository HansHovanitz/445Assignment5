<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="member.aspx.cs" Inherits="account.member" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>Member Page</p>
    <div class="jumbotron">
        
        <h1>Member Services</h1>
        <br />
        <h2>Web Service</h2>
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

    </div>
</asp:Content>
