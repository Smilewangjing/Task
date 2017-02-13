<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login-forget.aspx.cs" Inherits="home_login_forget" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../assets/css/forget.css" rel="stylesheet" />
    <script src="../assets/frameworks/jquery-1.8.3/jquery.min.js"></script>
    <script src="../assets/js/forget.js"></script>
</head>
<body>
    <form id="form1" runat="server"></form>
    <div class="container">
        <div class="head">
            <div class="header">
                <div class="header-cnt fn-clear">
                    <h1 class="logo">
                        <a class="logo-img" href="" title="任务管理系统"> 任务管理 </a>
                    </h1>
                    <h2 class="logo-title"> 重置登录密码 </h2>
                    <ul class="nav">
                        <li class="nav-first">
                            <a href="" >注册</a>
                            -
                            <a href="" >登录</a>
                        </li>
                        <li>
                            <a href="" >我的任务</a>
                        </li>
                        <li class="">
                            <a href="" target="_blank" >帮助中心</a>
                        </li>
                        <li class="nav-last">
                            <a href="" target="_blank">提建议</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div>
        <div class="content">
            <span style="display:inline;width:1px;height:1px;overflow:hidden"></span>
            <div class="maincenter">
                <div class="maincenter-box">
                    <div class="maincenter-box-tip"></div>
                    <div class="ui-form-item one">
                        <label class="ui-label">账户名</label>
                        <input  class="ui-input" id="user1" name="logonId" placeholder="电子邮箱或手机号码"  value=""  type="text">
                    </div>
                    <p class="p3"></p>
                    <div class="ui-form-item">
                         <label class="ui-label">密码</label>
                        <input  class="ui-input password3" name="logonId" placeholder="请输入密码"  value=""  type="password">
                    </div>
                    <p class="p3"></p>
                    <div class="ui-form-item">
                         <label class="ui-label">密码</label>
                        <input  class="ui-input password4" name="logonId" placeholder="请再次输入密码"  value=""  type="password">
                    </div>
                    <p class="p3"></p>
                    <div class="ui-form-item ui-form-item-last">
                        <div class="ui-button ui-button-morange">
                            <input class="ui-button-text" id="refer" value="提交" type="submit">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
    <div class="foot">
        <div class="footer">
            <div class="copyright"> 版权所有 2004-2016 ICP证：沪B2-222345667 </div>
            <div id="ServerNum" class="server"> membercenter-60-34   0ae498831484294608270193421940_0 </div>
        </div>
   </div>
</body>
</html>
