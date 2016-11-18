<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="account.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row main">
        <div class="panel-heading">
            <div class="panel-title text-center">
                <h2 class="title">Login to Enter Member Page</h2>
                <hr />
            </div>
        </div>
        <div class="main-login main-center">
            <div class="form-horizontal">

                <div class="form-group">
                    <label for="username" class="cols-sm-2 control-label">Username</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                            <asp:TextBox runat="server" ID="txtusername" CssClass="form-control" placeholder="Enter your Username"></asp:TextBox>
                          
                        </div>
                          <asp:Label runat="server" ForeColor="Red" ID="lblUserNameError" Visible="false"></asp:Label>
                          <asp:RequiredFieldValidator runat="server" id="reqUsername" ForeColor="Red" ControlToValidate="txtusername" Text="User Name Required" SetFocusOnError="true" Display="Dynamic" ></asp:RequiredFieldValidator>

                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="cols-sm-2 control-label">Password</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                            <asp:TextBox runat="server" TextMode="Password" ID="txtpassword" CssClass="form-control" placeholder="Enter your Password"></asp:TextBox>
                          
                        </div>
                          <asp:Label runat="server" ForeColor="Red" ID="lblPasswordError" Visible="false"></asp:Label>
                          <asp:RequiredFieldValidator runat="server" id="ReqPassword" ForeColor="Red" ControlToValidate="txtpassword" Text="User Name Required" SetFocusOnError="true" Display="Dynamic" ></asp:RequiredFieldValidator>
                     </div>
                </div>
                <div class="form-group ">
                    <asp:Button runat="server" ID="btnLogin" CssClass="btn btn-primary btn-lg btn-block login-button" Text="Login" OnClick="btnLogin_Click" />
                </div>
                <div class="login-register">
                    <a runat="server" href="default.aspx">Go Back</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
