<%@ Page  Title="找回密码" Language="C#" MasterPageFile="/master/main-sign.master" AutoEventWireup="true" CodeFile="sign-forget.aspx.cs" Inherits="sign_forget" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="">
        $(function () {
            $("#user").blur(function () {
                var val = $("#user").val();
                var email = $("#email").val();
                var user = /^[a-zA-Z]\w{3,15}$/i;
                if ($(this).val() == "" || $(this).val() == "请输入用户名") {
                    $(".p2").html("用户名不能为空");
                } else if (!user.test($(this).val())) {
                    $(".p2").html("用户名不正确");
                } else {
                    $(".p2").html("");
                    $.post("receiverashx/Login.ashx", {
                        "account": val
                    }, function (data) {
                        if (data == '[]') {
                            $('.p2').html("用户名不存在");
                        }
                    })
                }
            })
            $("#email").blur(function () {
                var val = $("#user").val();
                var email = $("#email").val();
                var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                if ($(this).val() == "" || $(this).val() == "请输入邮箱") {
                    $('.p2').html("邮箱不能为空");
                    $(".access_yzm").addClass("disabled");
                } else if (!reg.test($(this).val())) {
                    $('.p2').html("请输入正确的邮箱");
                    $(".access_yzm").addClass("disabled");
                } else {
                    $('.p2').html("");
                    $(".access_yzm").removeClass("disabled");
                    $.post("receiverashx/Login.ashx", {
                        "account": val
                    }, function (data) {
                        if (data == '[]') {
                            $('.p2').html("用户名不存在");
                        } else {
                            JSON.parse(data).forEach(function (item, index) {
                                if (item.Email == email) {
                                    $("#access_yzm").removeClass("disabled");
                                    $("#access_yzm").click(function () {
                                        $.post("interface/EmailValidated.aspx", {
                                            "Email": email
                                        }, function (datas) {
                                            console.log(datas);
                                            if (datas == "发送成功") {
                                                alert("发送成功")
                                            }
                                        })
                                    })
                                } else {
                                    $('.p2').html("用户名和邮箱不匹配");
                                    $("#access_yzm").addClass("disabled");
                                }
                            })
                        }
                    })
                }
            })
            $("#text3").blur(function () {
                var yzm2 = $(this).val();
                $.post("interface/Validated.aspx", { "ValidatedCode": yzm2 }, function (data) {
                    if (data == "false") {
                       $(".p2").html("请输入正确的验证码");
                    } else {
                        $(".p2").html("");
                    }
                })
            })
        });
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container signin">
        <div class="row padding-top-40">
            <div class="form-group">
                <div class="col-sm-12 ">
                    <input type="text" class="form-control" id="user" placeholder="输入用户名">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12 ">
                    <input type="text" class="form-control" id="email" placeholder="输入邮箱">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-12 ">
                    <input type="text" class="form-control " id="text3" placeholder="输入验证码" />
                    <input class="btn btn-link  position-absolute position-top-0 position-right-0" id="access_yzm" type="button" value="发送验证码" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12 ">
                    <input type="text" class="form-control" id="text4" placeholder="输入新密码" />
                </div>
            </div>
              <p class="p2" style="color:red;margin-left:30px;"></p>
            <div class="form-group">
                <div class="col-sm-12">
                    <input type="button" class="btn  btn-block border-radius-30 " style="background:#99ccff;"  value="完成" />
                </div>
            </div>
            <div class="form-group hidden">
                <div class="col-sm-5">
                    <a class="btn btn-link btn-block" href="signin.aspx">密码已找回，马上 <span class="color-pink">登录</span></a>
                </div>
            </div>
        </div>
    </div>

</asp:Content>


