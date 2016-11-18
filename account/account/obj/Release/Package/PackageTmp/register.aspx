<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="account.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h2 class="title">Create A New Account</h2>
                       
	               		<hr />
	               	</div>
                    <div class="panel-title text-center">
	               		<p>Use the form below to create a new account </p>
	               	</div>
                   
	            </div> 
				<div class="main-login main-center">
					<div class="form-horizontal" >
						
				<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Username</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									 <asp:TextBox runat="server" ID="txtusername" CssClass="form-control" placeholder="Enter your Username" ></asp:TextBox>
                                      
								</div>
                                 <asp:Label runat="server" ForeColor="Red" ID="lblUserNameError" Visible="false" ></asp:Label>
                                       <asp:RequiredFieldValidator runat="server" id="reqUsername" ForeColor="Red" ControlToValidate="txtusername" ErrorMessage="User Name Required" SetFocusOnError="true" Display="Dynamic" ></asp:RequiredFieldValidator>

							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Your Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                    <asp:TextBox runat="server" CssClass="form-control" id="txtemail"  placeholder="Enter your Email"></asp:TextBox>
								</div>
							</div>
						</div>

						

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									 <asp:TextBox runat="server" TextMode="Password" ID="txtpassword" CssClass="form-control"  placeholder="Enter your Password" ></asp:TextBox>
                                 
								</div>
                                 <asp:RequiredFieldValidator runat="server" ID="ReqPassword" ForeColor="Red" ControlToValidate="txtpassword" ErrorMessage="Password Required" SetFocusOnError="true" Display="Dynamic" ></asp:RequiredFieldValidator>
                                   <asp:RegularExpressionValidator Display = "Dynamic"  ForeColor="Red" ControlToValidate = "txtpassword" ID="RegularExpressionValidator2" ValidationExpression = "^[\s\S]{6,}$" runat="server" ErrorMessage="Minimum 6 characters required."></asp:RegularExpressionValidator>
                  
							</div>

						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                     <asp:TextBox runat="server" TextMode="Password"  CssClass="form-control"  ID="txtconfirm"  placeholder="Confirm your Password"></asp:TextBox>
                                    
								</div>
                                 <asp:CompareValidator runat="server" id="cmpNumbers"  ForeColor="Red" controltovalidate="txtpassword" controltocompare="txtconfirm"  Display="Dynamic"  errormessage="Confirmed Password Not Match" /><br />
                                 <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtconfirm" ErrorMessage="Confirm Password Required" SetFocusOnError="true" Display="Dynamic" ></asp:RequiredFieldValidator>
                                  
							</div>
						</div>

						<div class="form-group ">
                            <asp:Button runat="server" ID="btnRegistration" CssClass="btn btn-primary btn-lg btn-block login-button" Text="Register" OnClick="btnRegistration_Click" />
						</div>
						<div class="login-register">
				            <a runat="server" href="default.aspx">Go Back</a>
				         </div>
					</div>
				</div>
			</div>
</asp:Content>
