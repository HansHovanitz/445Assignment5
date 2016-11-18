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
                <h2 class="title">Default Page</h2>
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
            </div>
        </div>
    </div>
</asp:Content>
