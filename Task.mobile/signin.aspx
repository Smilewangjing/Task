<%@ Page Title="登录" Language="C#" MasterPageFile="~/master/main-sign.master" AutoEventWireup="true" CodeFile="signin.aspx.cs" Inherits="signin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        /*.form-group{padding:10px 0px 10px 0px;}*/
    </style>
    <script>
        $(function () {
            $("#login").click(function () {
                var account = $(".user").val();
                var password = $(".password").val();
                if (account != "" && password != "") {
                    $.post("../../receiverashx/Login.ashx", {
                        "account": account,
                        "password": password
                    }, function (data) {
                        if (data != "[]") {
                            $(".p2").html("");
                            var Name = $(".user").val();
                            if (Name) {
                                localStorage.setItem("Name", Name);
                                JSON.parse(data).forEach(function (item) {
                                    localStorage.setItem("Id", item.ID);
                                })
                            } else {
                                alert("请输入")
                            }
                            window.location.href = "../../Index.aspx";
                        } else if (data == "[]") {
                            $(".p2").html("账号或密码错误");
                        }
                    })
                } else {
                    $(".p2").html("请填写账号或者密码");
                }

            })
            //记住密码
            $(".remember").click(function () {
                if ($(this).prop("checked")) {
                    var name = $(".user").val();
                    var password = $(".password").val();
                    console.log(name, password);
                    if (name && password) {
                        localStorage.setItem("name", name);
                        localStorage.setItem("password", password);
                        alert("保存成功")
                    } else {
                        alert("请输入")
                    }9
                }
            })
            var dd = localStorage.getItem("name");
            var dt = localStorage.getItem("password");
            $(".user").val(dd);
            $(".password").val(dt);
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container signin">
        <div class="row text-center margin-top-20">
            <div class="col-xs-12">
                <img class="logo img-circle" src="assets/images/user.png" />
            </div>
        </div>
        <div class="row">
            <div class="form-group" >
                <div class="col-sm-12 ">
                    <input type="text" class="form-control user" name="txtLoginName"  id="txtAccount" runat="server" placeholder="邮箱/账号" />
                </div>
            </div>
            <div class="form-group" >
                <div class="col-sm-12 ">
                    <input type="password" class="form-control password" name="txtPassword"  id="txtPassword" runat="server" placeholder="密码" />
                </div>
            </div>
            <div class="form-group" >
                <div class="col-sm-6 text-left">
                    <span style="color:Red;" id="span_error" runat="server"></span>
                </div>
                <div class="col-sm-6 text-right">
                    <a class="btn btn-link fsize-0-10" href="sign-forget.aspx">忘记密码</a>
                </div>
            </div>
            <div class="form-group" >
                <div class="col-sm-12 ">
                <label class="text-200 padding-left-right-15">
                    <input type="checkbox" name="chkAccount" class="remember"  id="chkAccount" runat="server" value="" />&nbsp;记住账号
                </label>
                </div>
            </div>
              <p class="p2" style="color:red;margin-left:30px;"></p>
            <div class="form-group" >
                <div class="col-sm-12">
                    <input type="button" id="login" value="登录" class="btn btn-block  border-radius-30" style=" outline:none;background:#99ccff;" />
                </div>
                <div class="col-sm-12 hidden"></div>
            </div>
            <div class="form-group" >
                <div class="col-sm-12">
                    <a class="btn btn-link btn-block" href="signup.aspx">注册</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>





