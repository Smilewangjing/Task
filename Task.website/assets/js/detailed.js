$(function () {
    var url = window.location.href;
    var index = url.substring(url.lastIndexOf('?') + 1, url.lastIndexOf('&'));
    //console.log(index);
    var taskid = url.substring(url.lastIndexOf('=') + 1);
    //console.log(taskid);
    $.post("../../receiverashx/Login.ashx", {
        "account": index
    }, function (datas) {
        var item = JSON.parse(datas)[0];
        //JSON.parse(datas).forEach(function (item, index) {
        //    console.log(item);
            var user = '<li><span>' + item.Account + '</span></li><li><span class="caret" style="color:#fff"></span></li>'
            $(".quick_user").append(user);
            var lis = ' <li class="menu_item"><a href="../../Index.aspx?' + item.Account + '">首页</a></li> <li class="menu_item"><a href="../../home/personal1.aspx?' + item.Account + '">个人中心</a></li> <li class="menu_item"><a href="">帮助中心</a></li>'
            $(".menu").append(lis)
            //获取任务数据
            function getTasks(id) {
                //console.log(id);
                $.ajax("../../receiverashx/TaskDetail.ashx", {
                    method: "POST",
                    data:{ 
                        id: id
                    },
                    //成功后回调函数
                    success: getTasksHandler
                })
            };
            //获取到数据后创建任务media
            function getTasksHandler(data) {
                //console.log(data)
                if (data.length == 0) {
                    console.log("没有数据");
                } else {
                    //展示获取到的数据
                    var data = JSON.parse(data);
                    //console.log(data)
                    var data = data.Table1[0];
                    //console.log(data);
                    var msg = $(".con-task");
                    var media = $("<div class='media'></div>");
                    var media_left = $("<a href='#' class='media-left'><img src='../assets/images/user.png' /></a>");
                    var media_body = $("<div class='media-body'><h4>详细任务：</h4><h5>发布人：" + data.ServerName + " <i>| </i><span> 发布时间：" + data.CreateTime + "</span></h5>"
                        + "<p style='text-indent:2em'>" + data.CommandContent + "<span class='directive-url'><a href='" + data.PossyURL + "'>" + data.PossyURL + "</a></span></p>"
                        + "<div class='media-body-date'><h5 class='pull-right'>完成日期：" + data.DisableDate + "</h5></div><div class='media-body-submit'><button class='btn'>接收</button></div>");
                    media.append(media_left);
                    media.append(media_body);
                    msg.append(media);
                }
                $(".media-body>.media-body-submit>.btn").click(function () {
                    $.ajax("../../receiverashx/TaskStateChange.ashx", {
                        method: "POST",
                        async: false,
                        data: {
                            id: taskid,
                            state: 3
                        },
                        success: function (data) {
                            console.log(data);
                        }
                    });
                    //$.post("../../receiverashx/TaskStateChange.ashx", {
                    //    id: taskid,
                    //    state:3
                    //}, function (data) {
                    //    alert(data);
                    //}
                    //    )
                })
            }
            getTasks(taskid);
        //})
    })



})
