$(function () {
    //登录头像
    $(".quick_user").mouseenter(function () {
        $(".quick_user_toggle").stop(true).slideDown();
    })
    $(".quick_user").mouseleave(function () {
        $(".quick_user_toggle").stop(true).slideUp();
    })
    //登录页面翻转
    $('#content1 .toggle').on('click', function () {
        if ($('#content1').hasClass('log')) {
            $('#content1')[0].className = 'register'
        } else {
            $('#content1')[0].className = 'log'
        }
    });
    //个人中心导航
     $(".personal-left dl dd").slideUp();
     $(".personal-left dl dt").on("click", function () {
         $(this).css({ "background": "#005f3c", "color": "#fff" });
         $(this).children("span").css("color", "#fff");
         $(this).parent().siblings().children("dt").css({ "background": "", "color": "#666" })
         $(this).parent().siblings().children("dt").children("span").css("color", "#666");
        if ($(this).siblings("dd").css("display") == "none") {
            $(".personal-left dl dd").slideUp();
            $(this).siblings("dd").slideDown();
        }
    });
    $(".personal-left dl dt").eq(0).trigger("click");
    $(".personal-left dl dd").on("click", function () {
        $(this).addClass("personal-active1");
        $(this).siblings().removeClass("personal-active1")
        $(this).parent().siblings().children("dd").removeClass("personal-active1");
        //console.log($(".personal-left dl dd"))
        var index = $(".personal-left dl dd").index(this);
        $(".personal").eq(index).css("display", "block").siblings().css("display", "none");
    });
    
    //选择指令状态
    $(".con-main-msg>.con-main-msg-head").hide();
    $(".con-main-header ul li>a").click(function () {
        $(this).parent().siblings().removeClass("active");
        $(this).parent().addClass("active");     
        if ($(this).text() == "完成情况") {
            $(".con-main-msg>.con-main-msg-head").show();
        } else {
            $(".con-main-msg>.con-main-msg-head").hide();
        }
    });
    //完成情况样式状态
    $(".con-main-msg>.con-main-msg-head>.btn-group>.btn").click(function () {
        $(this).siblings().removeClass("active");
        $(this).addClass("active");
    })
    //回到顶部按钮
    $("#back").click(function () {
        $('body,html').animate({ scrollTop: 0 }, 1000);
        return false;
    });
    $(".personal-left dl dt").next().eq(0).trigger("click");
})