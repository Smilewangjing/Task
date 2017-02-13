
$(function () {
    $("#user").blur(function () {
        var val = $("#user").val();
        var email = $("#email").val();
        var user = /^[a-zA-Z]\w{3,15}$/i;
        if ($(this).val() == "" || $(this).val() == "请输入用户名") {
            $(this).parent(".one").next().addClass("two");
            $(this).parent(".one").next().html("用户名不能为空");
        } else if (!user.test($(this).val())) {
            $(this).parent(".one").next().addClass("two");
            $(this).parent(".one").next().html("用户名不正确");
        } else {
            $(this).parent(".one").next().removeClass("two");
            $(this).parent(".one").next().html("");
            $.post("../../receiverashx/Login.ashx", {
                "account": val
            }, function (data) {
                if (data == '[]') {
                    $('#user').parent(".one").next().next().addClass("two");
                    $('#user').parent(".one").next().html("用户名不存在");
                }
            })
        }
    })
    $("#email").blur(function () {
        var val = $("#user").val();
        var email = $("#email").val();
        var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if ($(this).val() == "" || $(this).val() == "请输入邮箱") {
            $(this).parent().next().addClass("two");
            $(this).parent().next().html("邮箱不能为空");
            $(".access_yzm").addClass("disabled");
        } else if (!reg.test($(this).val())) {
            $(this).parent().next().addClass("two");
            $(this).parent().next().html("请输入正确的邮箱");
            $(".access_yzm").addClass("disabled");
        } else {
            $(this).parent().next().removeClass("two");
            $(this).parent().next().html("");
            $(".access_yzm").removeClass("disabled");
            $.post("../../receiverashx/Login.ashx", {
                "account": val
            }, function (data) {
                if (data == '[]') {
                    $('#user').parent().next().next().addClass("two");
                    $('#user').parent().next().html("用户名不存在");
                } else {
                    JSON.parse(data).forEach(function (item, index) {
                        if (item.Email == email) {
                            $(".access_yzm").removeClass("disabled");
                            $(".access_yzm").click(function () {
                                $.post("../../home/EmailValidated.aspx", {
                                    "Email": email
                                }, function (datas) {
                                    console.log(datas);
                                    if (datas == "发送成功") {
                                        alert("发送成功")
                                    }
                                })
                            })
                        }else {
                            $(".access_yzm").addClass("disabled");
                }
                    })
                }
            })
        }
    })
    $("#yzm").blur(function () {
        var yzm2 = $(this).val();
        $.post("../../home/Validated.aspx", { "ValidatedCode": yzm2 }, function (data) {
            if (data == "false") {
                $("#yzm").parent().next().addClass("two");
                $("#yzm").parent().next().html("请输入正确的验证码");
            } else {
                $("#yzm").parent().next().removeClass("two");
                $("#yzm").parent().next().html("");
            }
        })
    })
    $("#next").click(function () {
        var val = $("#user").val();
        var email = $("#email").val();
        var yzm=$(".yzm").val();
        if (val != '' && email != '' && yzm != '') {
            $.post("../../receiverashx/Login.ashx", {
                "account": val,
            }, function (data) {
                console.log(data);
                if (data != "[]") {
                    window.location.href = "../../home/forget-index.aspx?" + val;
                } else if (data == "[]") {
                    alert(1);
                }
            })
           
        }
    })
    var url = window.location.href;
    var index = url.substring(url.lastIndexOf('?') + 1);
    $("#user1").val(index);
    $(".password3").blur(function () {
        var reg = /^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,22}$/;
        if ($(this).val() == "" || $(this).val() == "请输入密码") {
            $(this).parent().next().addClass("two");
            $(this).parent().next().html("密码不能为空");
        } else if (!reg.test($(this).val())) {
            $(this).parent().next().addClass("two");
            $(this).parent().next().html("密码为6~12位的数字、字母或特殊字符");
        } else {
            $(this).parent().next().removeClass("two");
            $(this).parent().next().html("");
        }
    })
    $(".password4").blur(function () {
        var password1 = $(".password3").val();
        if (!($(this).val() == password1)) {
            $(this).parent().next().addClass("two");
            $(this).parent().next().html("两次密码输入不一致");
        } else {
            $(this).parent().next().removeClass("two");
            $(this).parent().next().html("");
        }
    })
    $("#refer").click(function () {
        var user = $("#user1").val();
        var password = $(".password3").val();
        var password1 = $(".password4").val();
        console.log(user);
        if (user != "" && password != "" && password1 != "") {
            $.post("../../receiverashx/User.ashx", {
                    "Account": user,
                    "Password": password1
            }, function (data) {
                console.log(data);
            })
            //$.ajax({
            //    url: "../../receiverashx/User.ashx",
            //    method:"POST",
            //    data:{
            //        "Account": user,
            //        "Password": password1
            //    },
            //    success: function (data) {
            //          console.log(data);
            //      }
            //});
        }
        return false;
    })
})