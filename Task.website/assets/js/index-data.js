$(function () {
    var url = window.location.href;
    var index = url.substring(url.lastIndexOf('?') + 1);
    console.log(index);
    $.post("../../receiverashx/Login.ashx", {
        "account":index
    }, function (datas) {
            var item = JSON.parse(datas)[0];
            //JSON.parse(datas).forEach(function (item, index) {
            //console.log(item);
            var user = '<li><span>' + item.Account + '</span></li><li><span class="caret" style="color:#fff"></span></li>'
            $(".quick_user").append(user);
            var lis = ' <li class="menu_item"><a href="../../Index.aspx?' + item.Account + '">首页</a></li> <li class="menu_item"><a href="../../home/personal1.aspx?' + item.Account + '">个人中心</a></li> <li class="menu_item"><a href="">帮助中心</a></li>'
            $(".menu").append(lis)
            //获取任务数据
            function getTasks(f, id, d) {
                $.ajax("../../receiverashx/ProcessReceiver.ashx", {
                    method: "POST",
                    data: {
                        flag: f,
                        userID: id,
                        duration: d
                    },
                    //成功后回调函数
                    success: getTasksHandler
                })
            };
            //获取到数据后创建任务media
            function getTasksHandler(data) {
                //console.log(data);
                if (data.length == 0) {
                    console.log("没有数据");
                } else {
                    //清空原有数据 
                    $(".con-main-msg>.media").remove();
                    //遍历获取到的数据
                    var data = JSON.parse(data);
                    for (i = 0 ; i < data.length ; i++) {
                        //console.log(data[i]);
                        //console.log(data[i].ID);
                        var msg = $(".con-main-msg");
                        var media = $("<div class='media'></div>");
                        var media_left = $("<a href='#' class='media-left media-middle'><img src='assets/images/user.png' /></a>");
                        var medis_body = $("<div class='media-body'><div class='media-body-poster'><h4>" + data[i].ServerName + "</h4>"
                            + "<h5 class='pull-right send-time'>" + data[i].CreateTime + "</h5></div><p><a val=" + data[i].ID + " href='home/detailed.aspx?" + item.Account + "&task=" + data[i].CommandID + "'>" + data[i].CommandContent + "</a></p>"
                            + "<div class='media-body-state'><p>" + data[i].Description + "</p><p class='pull-right complete-time'>" + data[i].DisableTime + "</p></div></div>");
                        media.append(media_left);
                        media.append(medis_body);
                        msg.append(media);
                        if (data[i].Description == "正在执行") {
                            $(".con-main-msg>.media>.media-body>p>a").click(function () {
                                var id = $(this).attr("val");
                                console.log(id);
                                $.ajax("../../receiverashx/TaskStateChange.ashx", {
                                    method: "POST",
                                    async: true,
                                    data: {
                                        id: id,
                                        stste: 1
                                    },
                                    success: function (data) {
                                        console.log(data);
                                    }
                                });
                                //$.post("../../receiverashx/TaskStateChange.ashx", {
                                //    id: id,
                                //    state: 2
                                //}, function (data) {
                                //    console.log(data)
                                //}
                                //    )
                            })
                        }
                    }

                }
            }
            //首页获取数据
            getTasks(1, item.ID, 7);
            //获取未读数据
            $(".con-main-header>ul>li:eq(0)").click(function () {
                getTasks(1, item.ID, 7);
            });
            //获取已读数据
            $(".con-main-header>ul>li:eq(1)").click(function () {
                getTasks(2, item.ID, 7);
            });
            //查看完成情况
            $(".con-main-header>ul>li:eq(2)").click(function () {
                getTasks("unfinshed", item.ID, 7);
            });
            //获取已读全部
            $(".con-main-msg-head>.btn-group>.btn:eq(0)").click(function () {
                getTasks("all", item.ID, 7);
            });
            //获取待办任务
            $(".con-main-msg-head>.btn-group>.btn:eq(1)").click(function () {
                getTasks(2, item.ID, 7);
            });
            //获取正在执行数据
            $(".con-main-msg-head>.btn-group>.btn:eq(2)").click(function () {
                getTasks(3, item.ID, 7);
            });
            //获取已完成数据
            $(".con-main-msg-head>.btn-group>.btn:eq(3)").click(function () {
                getTasks("finshed", item.ID, 7);
            });
            //获取今天数据
            $(".today").click(function () {
                if ($(".con-main-header>ul>li.active>a").text() == "未读") {
                    //console.log(1);
                    getTasks(1, item.ID, 1);
                } else if ($(".con-main-header>ul>li.active>a").text() == "已读") {
                    getTasks(2, item.ID, 1);
                } else {
                    //console.log($(".con-main-msg-head>.btn-group>div.active").text());
                    if ($(".con-main-msg-head>.btn-group>div.active").text() == "全部") {
                        getTasks("all", item.ID, 1);
                    } else if ($(".con-main-msg-head>.btn-group>div.active").text() == "待办任务") {
                        getTasks(2, item.ID, 1);
                    } else if ($(".con-main-msg-head>.btn-group>div.active").text() == "正在执行") {
                        getTasks(3, item.ID, 1);
                    } else {
                        getTasks("finshed", item.ID, 1);
                    }
                }
            });
            //获取最近三天数据
            $(".threeDay").click(function () {
                if ($(".con-main-header>ul>li.active>a").text() == "未读") {
                    console.log(1);
                    getTasks(1, 5, 3);
                } else if ($(".con-main-header>ul>li.active>a").text() == "已读") {
                    getTasks(2, 5, 3);
                } else {
                    if ($(".con-main-msg-head>.btn-group>div.active").text() == "全部") {
                        getTasks("all", 5, 3);
                    } else if ($(".con-main-msg-head>.btn-group>div.active").text() == "待办任务") {
                        getTasks(2, item.ID, 3);
                    } else if ($(".con-main-msg-head>.btn-group>div.active").text() == "正在执行") {
                        getTasks(3, 5, 3);
                    } else {
                        getTasks("finshed", 5, 3);
                    }
                }
            });
            //获取全部数据
            $(".allDay").click(function () {
                if ($(".con-main-header>ul>li.active>a").text() == "未读") {
                    console.log(1);
                    getTasks(1, 5, 7);
                } else if ($(".con-main-header>ul>li.active>a").text() == "已读") {
                    getTasks(2, 5, 7);
                } else {
                    if ($(".con-main-msg-head>.btn-group>div.active").text() == "全部") {
                        getTasks("all", 5, 7);
                    } else if ($(".con-main-msg-head>.btn-group>div.active").text() == "待办任务") {
                        getTasks(2, item.ID, 7);
                    } else if ($(".con-main-msg-head>.btn-group>div.active").text() == "正在执行") {
                        getTasks(3, 5, 7);
                    } else {
                        getTasks("finshed", 5, 7);
                    }
                }
            })
            //})
    })
})

//var app = angular.module("app", [])
//.controller("taskIndexCtrl", ["$scope", "taskService", function ($scope, taskService) {
//    //默认显示全部任务
//    taskService.getAllTasks(1, 5, 7, function (data) {
//        //console.log(data);
//        $scope.allTasks = data;
//    });
//    //点击获取未读任务
//    $scope.cunReadTasks = function () {
//        taskService.getAllTasks(1, 5, 7, function (data) {
//            $scope.allTasks = data;
//        })
//    };
//    //点击获取已读任务
//    $scope.cReadTasks = function () {
//        taskService.getAllTasks(2, 5, 7, function (data) {
//            //console.log(data);
//            $scope.allTasks = data;
//        })
//    };
//    //点击获取正在执行的任务
//    $scope.cdoingTasks = function () {
//        taskService.getAllTasks(3, 5, 7, function (data) {
//            $scope.allTasks = data;
//        })
//    }
//    //点击显示全部未完已完任务事件
//    $scope.cgetAllTasks = function () {
//        taskService.getAllTasks("all", 5, 7, function (data) {
//            //console.log(data);
//            $scope.allTasks = data;
//        })
//    };
//    //点击显示未完成任务事件
//    $scope.cgetUnfinshedTasks = function () {
//        taskService.getAllTasks("unfinshed", 5, 7, function (data) {
//            $scope.allTasks = data;
//        })
//    };
//    //点击显示完成任务事件
//    $scope.cgetFinshedTasks = function () {
//        taskService.getAllTasks("finshed", 5, 7, function (data) {
//            $scope.allTasks = data;
//        })
//    }

//}])
////服务-查询的服务
//.factory("taskService", ["$http", function ($http) {
//    //获取任务方法
//    return {
//        getAllTasks: function (f, id, d, handler) {
//            $http({
//                method: "post",
//                url: "../../receiverashx/ProcessReceiver.ashx",
//                cache: false,
//                params: {
//                    flag: f,
//                    userID: id,
//                    duration: d
//                }
//            }).then(function (result) {
//                handler(result.data);
//            })
//        }
//    }

//}]);
////.service("taskService", ["$http", function ($http) {
////    //获取任务方法
////    this.getAllTasks = function (f,id,d,handler) {
////        $http({
////            method: "post",
////            url: "../../receiverashx/ProcessReceiver.ashx",
////            cache: false,
////            params: {
////                flag: f,
////                userID: id,
////                duration: d
////            }
////        }).then(function (result) {
////            handler(result.data);
////        });
////    };
////}]);