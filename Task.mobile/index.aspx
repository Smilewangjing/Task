<%@ Page Title="任务管理系统" Language="C#" MasterPageFile="~/master/main-drawer.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .swiper-newyear .swiper-slide div:last-child {
            border-top: 1px solid #f1f1f1;
        }

        .swiper-newyear .swiper-slide {
            background: #fff; /*margin-top: 2px;margin-bottom: 2px;*/ /*box-shadow: 0px 0px 2px rgba(90, 90, 90, 0.3);*/
        }

            .swiper-newyear .swiper-slide del {
                font-size: 0.913em;
            }

        .inmost-tools a {
            display: block;
            padding: 8px 0px;
            background: #f8f8f8;
        }

            .inmost-tools a p {
                height: 20px;
            }

            .inmost-tools a:hover {
                background: #e9e9e9;
            }

        del {
            color: #aaa;
            padding-left: 5px;
        }

        /*.moreact {
            background: #f8f8f8;
            filter: alpha(opacity=0);
            -moz-opacity: 0;
            -khtml-opacity: 0;
            opacity: 0;
        }*/
    </style>
    <script type="text/javascript">


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
      
        //var url = window.location.href;
        //var index = url.substring(url.lastIndexOf('?') + 1);
        //console.log(index);
        //var app = angular.module("Menu", ["ng", "ngRoute"]);
        //app.controller("twoCtrl", ["$scope", "MenuService", function ($scope, MenuService) {
        //    $scope.title = "123";
        //    MenuService.getMenu(function (datas) {
        //        //获取全部
        //        $scope.datas = datas;
        //        console.log(datas);
        //    });
        //}]).factory("MenuService", function ($http) {
        //    return {
        //        getMenu: function (handler) {
        //            //$http.get("192.168.2.226:8083/receiverashx/ProcessReceiver.ashx")
        //            $http({
        //                method: "get",
        //                url: "receiverashx/Login.ashx",
        //                cache: false,
        //                params: {
        //                    "account": index
        //                }
        //            }).then(function (result) {
        //                handler(result.data);
        //            });
        //        }
        //    }
        //})
        var app = angular.module("Menu", ["ng", "ngRoute"]);
        app.controller("twoCtrl", ["$scope", function ($scope) {
            $scope.user = localStorage.getItem("Name");
            console.log($scope.user)
            $scope.id = localStorage.getItem("id");
            console.log($scope.id);
        }])
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <%--<inmost:Navbarsub ID="Navbarsub1" runat="server" />--%>

    <div class="container" ng-app="Menu" ng-controller="twoCtrl">
        <div class="row">
             <div class="swiper-container swiper-market">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="">
                            <img class="img-responsive" src="assets/images/111.png" />
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img class="img-responsive" src="assets/images/222.png" />
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img class="img-responsive" src="assets/images/333.png" />
                        </a>
                    </div>
                </div>

                <div class="swiper-pagination"></div>
            </div>
            <div class="white-row margin-bottom-0 border-none text-center inmost-tools min-height-40 menu">                
                 <a class="col-percent-20 pull-left"  href="index.aspx">
                    <p><i class="glyphicon glyphicon-comment fsize-1-6"></i></p>
                    <span class="fsize-0-8">公告</span>
                </a>
                <a class="col-percent-20 pull-left"  href="index-task.aspx">
                    <p><i class="glyphicon glyphicon-send fsize-1-6"></i></p>
                    <span class="fsize-0-8">首页</span>
                </a>
                <a class="col-percent-20 pull-left"  ng-href="index-person-infomation.aspx">
                    <p><i class="glyphicon glyphicon-home fsize-1-7"></i></p>
                    <span class="fsize-0-8">个人中心</span>
                </a>
                <a class="col-percent-20 pull-left" href="#">
                    <p><i class="glyphicon glyphicon-header fsize-1-6"></i></p>
                    <span class="fsize-0-8">帮助中心</span>
                </a>
                <a class="col-percent-20 pull-left" href="#">
                    <p><i class="fa fa-puzzle-piece fsize-1-6"></i></p>
                    <span class="fsize-0-8">其他</span>
                </a>
            </div>
        </div>
        <div class="row">
            <div class=" margin-bottom-0 border-none  inmost-tools min-height-40">
                <h2 class="text-center">公告</h2>
                <p style="text-indent:28px;padding:0 15px;background:#f3f3f3;">
                    QT86最初是为了黑板报字体参考而创造,现在qt86.com已经成为了互联网世界最流行的艺术字体在线生成 QT86最初是为了黑板报字体参考而创造,现在qt86.com已经成为了互联网世界最流行的艺术字体在线生成 QT86最初是为了黑板报字体参考而创造,现在qt86.com已经成为了互联网世界最流行的艺术字体在线生成 QT86最初是为了黑板报字体参考而创造,现在qt86.com已经成为了互联网世界最流行的艺术字体在线生成 QT86最初是为了黑板报字体参考而创造,现在qt86.com已经成为了互联网世界最流行的艺术字体在线生成器工具网站,QT86作为互联网第一款字体转换器一直忠诚且稳定免费的...
                </p>
            </div>
        </div>
          
    </div>
</asp:Content>

