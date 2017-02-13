<%@ Page  Title="退出" Language="C#" MasterPageFile="~/master/main-sign.master" AutoEventWireup="true" CodeFile="signout.aspx.cs" Inherits="signout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <div class="row bg-gray">
            <div id="sign-empty" class="white-row border-top-none padding-top-60 padding-bottom-60 text-center">
                <p>
                    <i class="icon-signout fsize-2 color-pink"></i>
                </p>
                <p class="padding-10">
                    退出成功！
                </p>
                <p>
                    <a href="signin.aspx" class="btn btn-default padding-left-right-20">重新登录</a>
                </p>
                <p class="padding-top-15">
                    </p>
            </div>
        </div>

    </div>

</asp:Content>