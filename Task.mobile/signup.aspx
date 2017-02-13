<%@ Page Title="注册" Language="C#" MasterPageFile="~/master/main-sign.master" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="">
        $(function () {
            $(".user1").blur(function () {
                var user = /^[a-zA-Z]\w{3,15}$/i;
                if ($(this).val() == "" || $(this).val() == "账号/邮箱") {
                   $(".p2").html("账号不能为空");
                } else if (!user.test($(this).val())) {
                    $(".p2").html("账号不正确");
                } else {
                    $(".p2").html("");
                }
            })
            $(".user1").blur(function () {
                var val = $(this).val();
                $.post("receiverashx/Register.ashx", {
                    "Account": val
                }, function (data) {
                    if (data == "True") {
                        $(".p2").html("账号已存在");
                    }
                })
            })
            $(".password,.password1").blur(function () {
                if ($(".user1").val() != "") {
                      $(".p2").html("");
                    var reg = /^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,22}$/;
                    if ($(this).val() == "" || $(this).val() == "请输入密码") {
                        $(".p2").html("密码不能为空");
                    } else if (!reg.test($(this).val())) {
                        $(".p2").html("密码为6~12位的数字、字母或特殊字符");
                    } else {
                        $(".p2").html("");
                    }
                } else {
                    $(".p2").html("请输入账号");
                }
            })
            $(".password1").blur(function () {
                var password1 = $(".password").val();
                if (!($(this).val() == password1)) {
                    $(".p2").html("两次密码输入不一致");
                } else {
                    $(".p2").html("");
                }
            });
            $(".submit").click(function () {
                var Account = $(".user1").val();
                var password2 = $(".password1").val();
                $.ajax({
                    url: "../../receiverashx/Register.ashx",
                    method: "POST",
                    data: {
                        "Account": Account,
                        "Password": password2
                    }
                    , success: function (data) {
                        if (data == "1") {
                            alert("注册成功！");
                            window.location.href = "signin.aspx";
                        }
                    }
                });
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container signin">
        <%--<h2>Sign Up <small>注册</small></h2>--%>
        <div class="row text-center margin-top-20">
            <div class="col-xs-12">
                <img class="logo img-circle" src="assets/images/user.png" />
            </div>
        </div>
        <div class="row">
            <div class="form-group">
                <div class="col-sm-12 ">
                    <input type="text" class="form-control user1" id="txtaccount" runat="server" placeholder="输入账号，只能以字母开头，需4-18个字符" />
                </div>
            </div>
            <div class="form-group hidden">
                <div class="col-sm-12 ">
                    <input type="text" class="form-control " id="txtNickName" runat="server" placeholder="昵称" />
                </div>
            </div>
            <div class="form-group hidden">
                <div class="col-sm-12 ">
                    <input type="text" class="form-control " id="text2" placeholder="验证码">
                    <input class="btn btn-link position-absolute position-top-0 position-right-0" type="button"
                        value="发送验证码">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12 ">
                    <input type="password" class="form-control password" id="txtOnePwd" runat="server" placeholder="设置密码">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12 ">
                    <input type="password" class="form-control password1" id="txtTwoPwd" runat="server" placeholder="再次输入密码">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12 text-left">
                    <span id="span_error" runat="server" style="color: Red"></span>
                </div>
            </div>
            <p class="p2" style="color:red;margin-left:30px;"></p>
            <div class="form-group">
                <div class="col-sm-12 margin-top-10">
                    <input id="Button1" class="btn  btn-block border-radius-30 btn-pink submit" style="background:#99ccff;border:1px solid #99ccff;" runat="server" type="button"
                        value="注册">
                </div>
            </div>
            <div class="form-group hidden">
                <div class="col-sm-12">
                    <asp:Button ID="btnRegister" runat="server"  />
                </div>
            </div>
            <div class="form-group" >
                <div class="col-sm-12">
                    <a class="btn btn-link btn-block" href="signin.aspx">已有账号，马上 <span style="color:#99ccff;">登录</span></a>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
