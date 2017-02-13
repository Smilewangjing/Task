
///引导视频页面代码
var setInter;//setInterval接收变量
var setTime;//settimeout接收变量
var wait = 10;//默认时间

$(function () {
    //inmosttitle.text("爱啵秀");
    //图片轮换
    _swiper.market();
    _swiper.newyear();

    setTime = setTimeout("DelGuide()", 10000); //十一秒之后调用删除DelGuide方法;
    t = setInterval("timeOut()", 1000);//每秒调用一次timeOut方法
});

_swiper = (function () {
    var api = {};
    api.market = function () {
        var Swiper_market = new Swiper('.swiper-market', {
            direction: 'horizontal',
            autoHeight: true,
            lazyLoading: true,
            lazyLoadingInPrevNext: true,
            lazyLoadingOnTransitionStart: true,
            autoplay: 8000, //可选选项，自动滑动
            loop: true,

            // 如果需要分页器
            pagination: '.swiper-pagination'
            // 如果需要前进后退按钮
            //nextButton: '.swiper-button-next',
            //prevButton: '.swiper-button-prev',
            // 如果需要滚动条
            //scrollbar: '.swiper-scrollbar',
        });
    };
    api.newyear = function () {
        var Swiper_Newyear = new Swiper(".swiper-newyear", {
            direction: 'horizontal',
            autoHeight: true,
            slidesPerView: '3',
            visibilityFullFit: true,
            spaceBetween: 15,
            autoplay: 16000, //可选选项，自动滑动
            freeMode: true,
            loop: false//,
        });
    };
    return api;
})();

function DelGuide() {//删除遮罩层方法
    $("#guide").remove();//删除
}
function timeOut() {//倒计时
    if (wait > 0) {
        wait--;//默认时间减少
        $("#seconds").html(wait + "s ");//赋值
    }
    else {
        clearInterval(setInter);
        clearTimeout(setTime);
    }
}
var app = angular.module("index", ["ng", "ngRoute"]);
app.controller("oneCtrl", ["$scope", "TaskService", function ($scope, TaskService) {
    $scope.title = "123";
    console.log($scope.title);
    $scope.Id = localStorage.getItem("Id");
    var Id = $scope.Id
    //$scope.options = {
    //    type: {
    //        finish: "finshed",
    //        unfinish: "unfinsh",
    //        doing: 3
    //    },
    //    type1: {
    //        unread: 1,
    //        read: 2,
    //        all: "all",
    //    },
    //    duration: {
    //        today: 1,
    //        three: 3,
    //        all: 7
    //    }
    //};
    TaskService.getAllTask(function (datas) {
        //获取全部
        $scope.datas = datas;
    }, Id, "all", 7);
    $scope.getTask = function () {
        TaskService.getAllTask(function (datas) {
            //获取全部（方法）
            $scope.datas = datas;
        }, Id, "all", 7);
    };
    $scope.getFinshed = function () {
        TaskService.getAllTask(function (datas) {
            //获取完成（全部）
            $scope.datas = datas;
        }, Id, "finshed", 7);
    };
    $scope.getTodayFinshed = function () {
        TaskService.getAllTask(function (datas) {
            //获取完成（今天）
            $scope.datas = datas;
            
        }, Id, "finshed", 1);
    };
    $scope.getThreeFinshed = function () {
        TaskService.getAllTask(function (datas) {
            //获取完成（近三天）
            $scope.datas = datas;
        }, Id, "finshed", 3);
    };
    $scope.getUnfinsh = function () {
        TaskService.getAllTask(function (datas) {
            //获取未完成(全部)
            $scope.datas = datas;
        }, Id, "unfinsh", 7);
    };
    $scope.getTodayUnfinsh = function () {
        TaskService.getAllTask(function (datas) {
            //获取未完成（今天）
            $scope.datas = datas;
        }, Id, "unfinsh", 1);
    };
    $scope.getThreeUnfinsh = function () {
        TaskService.getAllTask(function (datas) {
            //获取未完成(近三天)
            $scope.datas = datas;
        }, Id, "unfinsh", 3);

    };
    $scope.getRead = function () {
        TaskService.getAllTask(function (datas) {
            //获取已读
            $scope.datas = datas;
        }, Id, 2, 7);
        
    };
    $scope.getUnread = function () {
        TaskService.getAllTask(function (datas) {
            //获取未读
            $scope.datas = datas;
        }, Id, 1, 7);
       
    };
    $scope.getDoing = function () {
        TaskService.getAllTask(function (datas) {
            //获取正在执行（全部）
            $scope.datas = datas;
        }, Id, 3, 7);
      
    };
    $scope.getTodayDoing = function () {
        TaskService.getAllTask(function (datas) {
            //获取正在执行(今天)
            $scope.datas = datas;
        }, Id, 3, 1);
    };
    $scope.getThreeDoing = function () {
        TaskService.getAllTask(function (datas) {
            //获取正在执行（近三天）
            $scope.datas = datas;
        }, Id, 3, 3);
       
    };
    $scope.getUnreadToday = function () {
        TaskService.getAllTask(function (datas) {
            //获取未读今天
            $scope.datas = datas;
        }, Id, 1, 1);
    };
    $scope.getUnreadThree = function () {
        TaskService.getAllTask(function (datas) {
            //获取未读最近三天
            $scope.datas = datas;
        }, Id, 1, 3);
      
    };
    $scope.getReadToday = function () {
        TaskService.getAllTask(function (datas) {
            //获取已读今天
            $scope.datas = datas;
        }, Id, 2, 1);
      
    };
    $scope.getReadThree = function () {
        TaskService.getAllTask(function (datas) {
            //获取已读最近三天
            $scope.datas = datas;
        }, Id, 2, 3);
        
    };
    
}])
.factory("TaskService", ["$http", function ($http) {
    return {
        getAllTask: function (handler, id, flag, duration) {
            //$http.get("192.168.2.226:8083/receiverashx/ProcessReceiver.ashx")
            $http({
                method: "get",
                url: "../../receiverashx/ProcessReceiver.ashx",
                cache: false,
                params: {
                    userID: id,
                    flag: flag,
                    duration: duration
                }
            }).then(function (result) {
                handler(result.data);
            });
        }
    };
}]).directive("myOne", function () {
    return {
        restrict: "AE",
        compile: function compile() {
            return {
                post: function postLink(scope, element) {
                    //console.log(element.next());
                    element.next().click(function () {
                        //获取commandid
                        var id = element.attr("class");
                        //获取id
                        var ids = element.attr("val");
                        if (id != '' && ids != '') {
                            //获取commandid
                                localStorage.setItem("id", id);
                                //获取id
                                localStorage.setItem("ids", ids);
                            }
                            var state = $(this).children(".media-body").children(".media-body-state").children("#state").html();
                            if (state == "指令状态（已下达）") {
                                $.ajax({
                                    url: "../../receiverashx/TaskStateChange.ashx",
                                    async:false,
                                    data:{
                                        "id": ids,
                                        "state": 2
                                    }
                                   
                                }, function (datas) {
                                    console.log(datas);
                                })
                            }
                            window.location.href = "../../task.aspx";
                    })
                    //element.next().next("#p2").children("a").click(function () {
                    //    var id = element.attr("class");
                    //    if (id != '') {
                    //        localStorage.setItem("id", id);
                    //        alert("保存成功");
                    //    }
                        
                    //})

                }
            }
        }
    }
})