$(function () {
    var url = window.location.href;
    var index = url.substring(url.lastIndexOf('?') + 1);
    console.log(index);
    $.post("../../receiverashx/Login.ashx", {
        "account":index
    }, function (datas) {
        var data0 = JSON.parse(datas);
        for (i = 0; i < data0.length; i++) {
            var user = '<li><span>' + data0[i].Account + '</span></li><li><span class="caret" style="color:#fff"></span></li>'
            $(".quick_user").append(user);
            var lis = ' <li class="menu_item"><a href="../../Index.aspx?' + data0[i].Account + '">首页</a></li> <li class="menu_item"><a href="../../home/personal1.aspx?' + data0[i].Account + '">个人中心</a></li> <li class="menu_item"><a href="">帮助中心</a></li>'
            $(".menu").append(lis);
            var msg = ' <p>Hi,' + data0[i].Account + '</p><p class="zh"><span>邮箱：</span><span>' + data0[i].Email + '</span></p>'
            $(".personal-user").append(msg);
            var message = ' <tr><td>昵称：</td><td>' + data0[i].NickName + '</td></tr><tr><td>邮箱：</td><td>' + data0[i].Email + '</td></tr><tr><td>性别：</td><td>男</td></tr><tr><td>年龄：</td><td>23</td></tr><tr><td>所在公司：</td><td>上海远哈信息科技有限公司</td></tr>'
            $(".person_information table").append(message);
            //全部
           var userid=data0[i].ID;
           $(".recentTask").click(function () {
               console.log(userid)
                $(".media_all").empty();
                ajax("../../receiverashx/ProcessReceiver.ashx", {
                    flag: "all",
                    userID: userid,
                    duration: 7,
                })
            })
            //未读
            $("#unread").click(function () {
                $(".media_all").empty();
                ajax("../../receiverashx/ProcessReceiver.ashx", {
                    flag: 1,
                    userID: userid,
                    duration: 7,
                })
            })
            //已读
            $("#read").click(function () {
                $(".media_all").empty();
                ajax("../../receiverashx/ProcessReceiver.ashx", {
                    flag: 2,
                    userID: userid,
                    duration: 7,
                })
            })
            //待办任务
            $("#finsh-total").click(function () {
                $(".media_all").empty();
                ajax("../../receiverashx/ProcessReceiver.ashx", {
                    flag: "all",
                    userID: userid,
                    duration: 7,
                })
            })
            //未执行
            $("#unfinsh").click(function () {
                $(".media_all").empty();
                ajax("../../receiverashx/ProcessReceiver.ashx", {
                    flag: "unfinshed",
                    userID: userid,
                    duration: 7,
                })
            })
            //正在解决
            $("#doing").click(function () {
                $(".media_all").empty();
                ajax("../../receiverashx/ProcessReceiver.ashx", {
                    flag: 3,
                    userID: userid,
                    duration: 7,
                })
            })
            //已完成
            $("#finsh").click(function () {
                $(".media_all").empty();
                ajax("../../receiverashx/ProcessReceiver.ashx", {
                    flag: "finshed",
                    userID: userid,
                    duration: 7,
                })
            })
            $("#search").click(function () {
                var active = $("#con-main-msg-head>div>div.active").text();
                console.log(active);
                var val = $("#select1").find("option:selected").val()
                if (active == "未读") {
                    $(".media_all").empty();
                    ajax("../../receiverashx/ProcessReceiver.ashx", {
                        flag: 1,
                        userID: userid,
                        duration: val,
                    })
                } else if (active == "已读") {
                    $(".media_all").empty();
                    ajax("../../receiverashx/ProcessReceiver.ashx", {
                        flag: 2,
                        userID: userid,
                        duration: val,
                    })
                }
            })
            $("#search1").click(function () {
                var active = $(".con-main-msg-head>.btn_group>div.active").text();
                console.log(active);
                var val = $("#select2").find("option:selected").val()
                if (active == "待办任务") {
                    $(".media_all").empty();
                    ajax("../../receiverashx/ProcessReceiver.ashx", {
                        flag: "unfinshed",
                        userID: userid,
                        duration: val,
                    })
                } else if (active == "正在解决") {
                    $(".media_all").empty();
                    ajax("../../receiverashx/ProcessReceiver.ashx", {
                        flag: 3,
                        userID: userid,
                        duration: val,
                    })
                } else if (active == "已完成") {
                    $(".media_all").empty();
                    ajax("../../receiverashx/ProcessReceiver.ashx", {
                        flag: "finshed",
                        userID: userid,
                        duration: val,
                    })
                }
            })
            function ajax(url, data) {
                console.log(data0)
                $.ajax({
                    url: url,
                    async: false,
                    method: "POST",
                    data: data,
                    success: function (data) {
                        if (data.length == 0) {
                            console.log("没有数据");
                        }
                        else {
                            alert(data);
                            var data = JSON.parse(data);
                            
                            for (i = 0 ; i < data.length ; i++) {
                                var newMedia = '<div class="media"><a href="#" class="media-left media-middle"><img src="../assets/images/user.png" /></a><div class="media-body"><div class="media-body-poster"><h4>' + data[i].ServerName + '</h4><h5 class="pull-right send-time">' + data[i].CreateTime + '</h5></div><p><a class="jump" href="detailed.aspx?' + data0[0].Account + '&task=' + data[i].CommandID + '" val="'+data[i].ID+'">' + data[i].CommandContent + '</a></p><div class="media-body-state"> <p>指令状态（' + data[i].Description + '）</p><p class="pull-right complete-time p1">日期:' + data[i].DisableTime + '</p></div> </div></div>'
                                $(".media_all").append(newMedia);
                            }
                            $(".jump").click(function () {
                                var Taskid = $(this).attr("val");
                                var state = $(this).parent().next().children().html();
                                alert(Taskid)
                                if (state == "指令状态（已下达）") {
                                    $.ajax({
                                        url: "../../receiverashx/TaskStateChange.ashx",
                                        async: false,
                                        data: {
                                            "id": Taskid,
                                            "state": 2
                                        },
                                        success: function (datas) {
                                            alert(1);
                                            console.log(datas);
                                        }

                                  
                                    })
                                } 
                            })
                        }
            
                    }
                })
            }
            
           
        }
    });
})
