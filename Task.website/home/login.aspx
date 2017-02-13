<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>首页</title>
     <link rel="stylesheet" href="../assets/frameworks/bootstrap-3.3.0-dist/css/bootstrap.css" />
     <link rel="stylesheet" href="../assets/css/login.css" />
    <link rel="stylesheet" href="../assets/frameworks/font-awesome-4.7.0/css/font-awesome.min.css"/>
    <script src="../assets/frameworks/jquery-1.8.3/jquery.min.js"></script>
    <script src="../assets/frameworks/jquery-2.1.4/jquery.min.js"></script>
	<script src="../assets/frameworks/bootstrap-3.3.0-dist/js/bootstrap.min.js"></script>
    <script src="../assets/js/index.js"></script>
    <script src="../assets/js/login.js"></script>
    <style>
         .p2{
            margin-left:40px;
            margin-top:10px;
            color:red;
        }
        .two{
            margin-top:10px!important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server"></form>
        <div class="container header text-center">
            <h1>任务管理系统</h1>
        </div>
        <div></div>
        <div class="content" style="margin:0 auto;">
            <div id="content1" class="log">
				    <div id="login" class="register-box login" style="margin:0 auto;">
                        <div class="toggle">
                            <i class="fa fa-toggle-on" style="cursor:pointer"></i>
                            <span>切换注册</span>
                        </div>
                        <div class="reg-slogan">登陆</div>
                        <div class="center">
                            <div class="input-group one">
                                <span class="input-group-addon">
                                    <span class="fa fa-user-o"></span>
                                </span>
                                <input type="text" class="form-control user" placeholder="请输入用户名" />
                            </div>
                            <p class="p2"></p>
                            <div class="input-group one">
                                <span class="input-group-addon">
                                    <span class="fa fa-lock"></span>
                                </span>
                                <input type="password" class="form-control password" placeholder="请输入密码">
                            </div>
                             <p class="p2"></p>
                            <div style="margin-top:20px;">
                                <div class="left" >
                                    <div class="input-group one" style="margin-top:0;">
                                        <span class="input-group-addon">
                                            <span class="fa fa-retweet"></span>
                                        </span>
                                        <input type="text" class="form-control" placeholder="验证码" id="yzm1">
                                    </div>
                                </div>
                                <div class="right" style="margin-top:0;">
                                    <img src="ValidatedCode.aspx" id="yzm" style="display:inline-block;width:70px;height:33px;"/>
                                    <span style="cursor:pointer;"id="huan">换一张</span>
                                </div>
                            </div>
                             <p class="p2 p3"></p>
                        </div>
                        <p class="safe">
                            <label class="remembermetext" for="rememberme">
                                <input id="rememberme" class="rememberme" name="rememberme"  value="forever" type="checkbox">
                               <label for="rememberme">记住我的登陆</label>
                            </label>
                            <a class="lost" href="login-forget.aspx">忘记密码？</a>
                        </p>
                        <p class="p2"></p>
                        <p class="but" style="margin-top:25px; margin-bottom:35px;">
                            <input class="submit form-control" id="login5" value="登录" name="submit" type="submit" id="submit" style="margin-bottom:10px;">
                        </p>
                    </div>
				    <div id="reg" class="register-box1 reg">
                        <div class="toggle">
                            <i class="fa fa-toggle-off" style="cursor:pointer"></i>
                            <span>切换登陆</span>
                        </div>
                        <div class="reg-slogan">注册</div>
                        <div class="center">
                            <div class="input-group one">
                                <span class="input-group-addon">
                                    <span class="fa fa-user-o"></span>
                                </span>
                                <input type="text" class="form-control user1" placeholder="只能以字母开头，包含字符、数字、下划线，需4-18个字符" />
                            </div>
                            <p class="p2"></p>
                            <div class="input-group one">
                                <span class="input-group-addon">
                                    <span class="fa fa-user-o"></span>
                                </span>
                                <input type="text" class="form-control nickName" placeholder="请输入昵称" />
                            </div>
                            <p class="p2"></p>
                            <div class="input-group one">
                                <span class="input-group-addon">
                                    <span class="fa fa-phone"></span>
                                </span>
                                <input type="text " class="form-control phone phonenumber" placeholder="请输入手机号码">
                            </div>
                            <p class="p2"></p>
                             <div class="input-group one">
                                <span class="input-group-addon">
                                    <span class="fa fa-lock"></span>
                                </span>
                                <input type="password" class="form-control password1 password2" placeholder="密码最小长度为6">
                            </div>
                            <p class="p2"></p>
                             <div class="input-group one">
                                <span class="input-group-addon">
                                    <span class="fa fa-lock"></span>
                                </span>
                                <input type="password" class="form-control password1 password3" placeholder="再次输入密码">
                            </div>
                            <p class="p2"></p>
                             <div class="input-group one">
                                <span class="input-group-addon">
                                    <span class="fa fa-envelope"></span>
                                </span>
                                <input type="text" class="form-control email email1" placeholder="请输入常用邮箱">
                            </div>
                            <p class="p2"></p>
                            <div style="margin-top:-10px;">
                                <div class="left">
                                    <div class="input-group one">
                                        <span class="input-group-addon">
                                            <span class="fa fa-retweet"></span>
                                        </span>
                                        <input type="text" class="form-control yzm1" placeholder="验证码">
                                    </div>
                                </div>
                                <div class="right">
                                  <button class="btn access_yzm">获取验证码</button>
                                </div>
                            </div>
                           
                            
                            <p class="safe">
                                <label class="remembermetext" for="rememberme" style="margin-left:-35px;margin-top:15px;">
                                    <input id="rememberme" class="rememberme" name="rememberme" checked="checked" value="forever" type="checkbox">
                                    我同意注册协议
                                </label>                               
                            </p>
                        </div>
                       
                        <p class="but" style="margin-top:-5px; margin-bottom:35px;">
                            <input class="submit form-control"  value="注册" name="submit" type="submit" style="margin-bottom:10px;" >
                        </p>
                    </div>
			    </div>
        </div>
</body>
</html>
