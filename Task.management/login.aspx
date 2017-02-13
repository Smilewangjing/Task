<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="assets/css/login.css" />
    <title></title>
    <script src="assets/framework/jquery-2.1.4/jquery.min.js"></script>
    <script src="assets/js/login.js"></script>
   
</head>
<body>
    <!--导航条-->
    <div class="nav">
        <p>您好，请<span>登录</span></p>
    </div>
    <form id="form1" runat="server">

    <!--信息-->
    <div class="text">
        <table id="Tab"></table>
        <div id="page"></div>
    </div>
    <!--登陆框-->
    <div class="hidden-login">
        <span>登陆</span>
        <div id="login">
            账号：<input type="text" name="Account"/><br />
            密码：<input type="password" name="password"/><br />
            <p id="isLogin">确认登陆</p>
        </div>
    </div>
    </form>
</body>
</html>
