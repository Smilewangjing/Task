

$(function(){
    $(".user,.user1").blur(function () {
        var user = /^[a-zA-Z]\w{3,15}$/i;
        if ($(this).val() == "" || $(this).val() == "请输入用户名") {
            $(this).parent(".one").next().next().addClass("two");
            $(this).parent(".one").next().html("账号不能为空");
        } else if (!user.test($(this).val())) {
            $(this).parent(".one").next().next().addClass("two");
            $(this).parent(".one").next().html("账号不正确");
        } else {
            $(this).parent(".one").next().next().removeClass("two");
            $(this).parent(".one").next().html("");
        }
    })
    $(".user1").blur(function () {
        var val = $(this).val();
        $.post("../../receiverashx/Register.ashx", {
            "Account":val
        }, function (data) {
            if (data=="True") {
                $(".user1").parent(".one").next().next().addClass("two");
                $(".user1").parent(".one").next().html("账号已存在");
            }
        })
    })
    $(".nickName").blur(function () {
        if ($(".user1").val()=="") {
            $(".user1").parent(".one").next().next().addClass("two");
            $(".user1").parent(".one").next().html("请输入账号");
        } else {
            $(".nickName").parent(".one").next().next().removeClass("two");
            $(".nickName").parent(".one").next().html("");
        }
    })
    $(".phone").blur(function () {
        if ($(".user1").val() != "") {
            $(".user1").parent(".one").next().next().removeClass("two");
            $(".user1").parent(".one").next().html("");
            if ($(".nickName").val() != "") {
                $(".nickName").parent(".one").next().next().removeClass("two");
                $(".nickName").parent(".one").next().html("");
                var user = /^1[3|4|5|8|7][0-9]\d{4,8}$/i;//验证手机正则
                if ($(this).val() == "" || $(this).val() == "请输入手机号") {
                    $(this).parent(".one").next().next().addClass("two");
                    $(this).parent(".one").next().html("手机号不能为空");
                } else if ($(this).val().length < 11) {
                    $(this).parent(".one").next().next().addClass("two");
                    $(this).parent(".one").next().html("手机号长度有误");
                } else if (!user.test($(this).val())) {
                    $(this).parent(".one").next().next().addClass("two");
                    $(this).parent(".one").next().html("手机号不存在");
                } else {
                    $(this).parent(".one").next().next().removeClass("two");
                    $(this).parent(".one").next().html("");
                }
                var phone = $(this).val();
                $.post("../../receiverashx/Register.ashx", {
                    "MobilePhone": phone
                }, function (data) {
                    if (data == "True") {
                        $(".phone").parent(".one").next().next().addClass("two");
                        $(".phone").parent(".one").next().html("手机号已存在");
                    }
                })
            } else {
                $(".nickName").parent(".one").next().next().addClass("two");
                $(".nickName").parent(".one").next().html("请输入昵称");
            }
        } else {
            $(".user1").parent(".one").next().next().addClass("two");
            $(".user1").parent(".one").next().html("请输入账号");
        }
    })
    $(".password,.password1").blur(function () {
        if ($(".user1").val() != "") {
            $(".user1").parent(".one").next().next().removeClass("two");
            $(".user1").parent(".one").next().html("");
            if ($(".nickName").val() != "") {
                $(".nickName").parent(".one").next().next().removeClass("two");
                $(".nickName").parent(".one").next().html("");
                if ($(".phone").val() != "") {
                    $(".phone").parent(".one").next().next().removeClass("two");
                    $(".phone").parent(".one").next().html("");
                    var reg = /^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,22}$/;
                    if ($(this).val() == "" || $(this).val() == "请输入密码") {
                        $(this).parent(".one").next().next().addClass("two");
                        $(this).parent(".one").next().html("密码不能为空");
                    } else if (!reg.test($(this).val())) {
                        $(this).parent(".one").next().next().addClass("two");
                        $(this).parent(".one").next().html("密码为6~12位的数字、字母或特殊字符");
                    } else {
                        $(this).parent(".one").next().next().removeClass("two");
                        $(this).parent(".one").next().html("");
                    }
                } else {
                    $(".phone").parent(".one").next().next().addClass("two");
                    $(".phone").parent(".one").next().html("请输入手机号");
                }
            } else {
                $(".nickName").parent(".one").next().next().addClass("two");
                $(".nickName").parent(".one").next().html("请输入昵称");
            }
        } else {
            $(".user1").parent(".one").next().next().addClass("two");
            $(".user1").parent(".one").next().html("请输入账号");
        }
    })
    $(".email").blur(function () {
        if ($(".user1").val() != "") {
            $(".user1").parent(".one").next().next().removeClass("two");
            $(".user1").parent(".one").next().html("");
            if ($(".nickName").val() != "") {
                $(".nickName").parent(".one").next().next().removeClass("two");
                $(".nickName").parent(".one").next().html("");
                if ($(".phone").val() != "") {
                    $(".phone").parent(".one").next().next().removeClass("two");
                    $(".phone").parent(".one").next().html("");
                    if ($(".password2").val() != "") {
                        $(".password2").parent(".one").next().next().removeClass("two");
                        $(".password2").parent(".one").next().html("");
                        if ($(".password3").val() != "") {
                            $(".password3").parent(".one").next().next().removeClass("two");
                            $(".password3").parent(".one").next().html("");
                            var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                            if ($(this).val() == "" || $(this).val() == "请输入邮箱") {
                                $(this).parent(".one").next().next().addClass("two");
                                $(this).parent(".one").next().html("邮箱不能为空");
                                $(".access_yzm").addClass("disabled");
                            } else if (!reg.test($(this).val())) {
                                $(this).parent(".one").next().next().addClass("two");
                                $(this).parent(".one").next().html("请输入正确的邮箱");
                                $(".access_yzm").addClass("disabled");
                            } else {
                                $(this).parent(".one").next().next().removeClass("two");
                                $(this).parent(".one").next().html("");
                                $(".access_yzm").removeClass("disabled");
                            }
                            var email = $(this).val();
                            $.post("../../receiverashx/Register.ashx", {
                                "Email": email
                            }, function (data) {
                                if (data == "True") {
                                    $(".email").parent(".one").next().next().addClass("two");
                                    $(".email").parent(".one").next().html("邮箱已存在");
                                }
                            })
                        } else {
                            $(".password3").parent(".one").next().next().addClass("two");
                            $(".password3").parent(".one").next().html("请输入密码");
                        }
                    } else {
                        $(".password2").parent(".one").next().next().addClass("two");
                        $(".password2").parent(".one").next().html("请输入密码");
                    }
                } else {
                    $(".phone").parent(".one").next().next().addClass("two");
                    $(".phone").parent(".one").next().html("请输入手机号");
                }
            } else {
                $(".nickName").parent(".one").next().next().addClass("two");
                $(".nickName").parent(".one").next().html("请输入昵称");
            }
        } else {
            $(".user1").parent(".one").next().next().addClass("two");
            $(".user1").parent(".one").next().html("请输入账号");
        }
    })
    //验证密码
    $(".password1").eq(1).blur(function () {
        var password1 = $(".password1").eq(0).val();
        if (!($(this).val() == password1)) {
            $(this).parent(".one").next().next().addClass("two");
            $(this).parent(".one").next().html("两次密码输入不一致");
        } else {
            $(this).parent(".one").next().next().removeClass("two");
            $(this).parent(".one").next().html("");
        }
    })
    //记住密码
    $("#rememberme").click(function () {
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
            }
        }
    })
    var dd = localStorage.getItem("name");
    var dt = localStorage.getItem("password");
    $(".user").val(dd);
    $(".password").val(dt);
    //注册向后台发送数据
    $(".register-box1 .submit").click(function () {
       var Account= $(".user1").val();
       var mobilePhone = $(".phonenumber").val();
       var password2 = $(".password2").val();
        var email = $(".email1").val();
        var nickName = $(".nickName").val();
        var yzm1 = $(".yzm1").val();
        if (Account != '' && mobilePhone != "" && password2 != '' && email != "" && nickName != "" && yam1 != "") {
            $.ajax({
                url: "../../home/EmailValidated.aspx",
                method: "POST",
                data: {
                    "ValidatedCode": yzm1
                }
       , success: function (data) {
           if (data == "true") {
               $.ajax({
                   url: "../../receiverashx/Register.ashx",
                   method: "POST",
                   data: {
                       "Account": Account,
                       "Password": password2,
                       "NickName": nickName,
                       "MobilePhone": mobilePhone,
                       "Email": email,
                   }
                   , success: function (data) {
                       if (data == "1") {
                           alert("注册成功！");
                           $(".toggle").trigger("click");
                       }
                   }
               });
           }
       }
            });
        } else {
            alert("请输入")
        }
       
       
    })
    $(".access_yzm").click(function () {
        var email=$(".email1").val();
        $.post("../../home/EmailValidated.aspx", {
            "Email": email
        }, function (datas) {
            console.log(datas);
            if (datas == "发送成功") {
                alert("发送成功")
            }
        })
    })
    //换验证图片
    $("#huan").click(function () {
        $("#yzm1").val("");
        $("#yzm1").parent().parent().parent().next().parent().next().css("margin-top", "");
        $("#yzm1").parent().parent().parent().next().html("");
        $(this).prev("img").attr("src", "../../home/ValidatedCode.aspx?t=" + Math.random());
    });
    //验证码
    $(".yzm1").blur(function () {
        var yzm2 = $(this).val();
        $.post("../../home/Validated.aspx", { "ValidatedCode": yzm2 }, function (data) {
            if (data == "false") {
                $("#yzm1").parent().parent().parent().next().parent().next().css("margin-top", "-10px");
                $("#yzm1").parent().parent().parent().next().html("请输入正确验证码");
            } else {
                $("#yzm1").parent().parent().parent().next().parent().next().css("margin-top", "");
                $("#yzm1").parent().parent().parent().next().html("");
            }
        })
    })
    //登陆传递消息
    $("#login5").click(function () {
       var account = $(".user").val();
       var password = $(".password").val();
       var yzm2 = $("#yzm1").val();
       var p3 = $(".p3").html();
       if (account != "" && password != "" && yzm2!=""&&p3=="") {
           $.post("../../receiverashx/Login.ashx", {
               "account": account,
               "password": password
           }, function (data) {
               console.log(data);
               if (data != "[]") {
                   $("#login5").parent().prev(".p2").html("");
                   window.location.href = "../../Index.aspx?" + account;
               } else if (data == "[]") {
                   $("#login5").parent().prev(".p2").html("账号或密码错误");
               }
           })
       } else {
           $("#login5").parent().prev(".p2").html("请填写账号或者密码或验证码");
       }
        
    })
})