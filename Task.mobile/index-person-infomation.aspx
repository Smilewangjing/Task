<%@ Page Title="任务管理系统" Language="C#" MasterPageFile="~/master/main-drawer.master" AutoEventWireup="true" CodeFile="index-person-infomation.aspx.cs" Inherits="index_person" %>

<%-- 在此处添加内容控件 --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="/assets/css/index-person.css" rel="stylesheet" />
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

        .search_box {
            width:90%;
            margin-left:5%;
            margin-top:2%;
        }
        /*.moreact {
            background: #f8f8f8;
            filter: alpha(opacity=0);
            -moz-opacity: 0;
            -khtml-opacity: 0;
            opacity: 0;
        }*/
    </style>
    <script src="assets/js/index-person.js"></script>
    <script type="text/javascript">
        ///引导视频页面代码
        var setInter;//setInterval接收变量
        var setTime;//settimeout接收变量
        var wait = 10;//默认时间

        $(function () {
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" ng-app="index-person"" ng-controller="personCtrl">
        <div class="row">
            <%--<inmost:WebAdInfo ID="homeAD" runat="server" Height="800" Width="800" Display="Slide" AdCode="homeSlidel" Location="首页-内容-顶部" Name="首页轮换图" />--%>
            <%-- 头部导航的轮播swiper-- start --%>
            <div class="swiper-container swiper-market">
                <div class="swiper-wrapper"> 
                    <div class="swiper-slide">
                        <a href="#">
                            <img class="img-responsive" src="assets/images/111.png"/>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <img class="img-responsive" src="assets/images/222.png"/>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <img class="img-responsive" src="assets/images/333.png"/>
                        </a>
                    </div>
                </div>

                <div class="swiper-pagination"></div>
            </div>
            <%-- 头部导航的轮播swiper-- end --%>
            <div class="white-row margin-bottom-0 border-none text-center inmost-tools min-height-40">
                <a class="col-percent-20 pull-left" href="index.aspx">
                    <p><i class="glyphicon glyphicon-comment fsize-1-6"></i></p>
                    <span class="fsize-0-8">公告</span>
                </a>
                <a class="col-percent-20 pull-left" href="index-task.aspx">
                    <p><i class="glyphicon glyphicon-send fsize-1-6"></i></p>
                    <span class="fsize-0-8">首页</span>
                </a>
                <a class="col-percent-20 pull-left" href="#">
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
            <div class="white-row margin-bottom-0 min-height-100">
                <div class="text-center">
                    <h4 class="padding-top-10"></h4>
                        <div class="search_box form-group has-feedback">
                            <input type="text" class="form-control" placeholder="Search">
                            <span class="form-control-feedback glyphicon glyphicon-search"></span>
                        </div>
                </div>
            </div>                                
            <div class="content_box">
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation">
                        <a href="#">
                            <span class="glyphicon glyphicon-user" style="vertical-align:middle;margin-bottom:2%"> </span>
                            个人信息
                        </a>
                        <div id="info">
                            <div style="position:relative;" class="img_box">
                                <img src="assets/images/user.png" alt="Alternate Text" class="img-responsive"  style="width:40%;margin-left:30%;"/>
                                <div class="img_dw">
                                    <a href="javascript:void(0)">编辑图片</a>
                                </div>
                            </div>
                            <div class="info_an">
                                <button type="button" class="btn btn-success">
                                    <img src="assets/images/02.png" alt="Alternate Text" /> 高清拍照</button>
                            </div>
                            <div class="info_an">
                                <button type="button" class="btn btn-success">
                                    <img src="assets/images/01.png" alt="Alternate Text" /> 本地照片</button>
                            </div>
                            <div class="info_information">
                                <ul>
                                    <li>昵称：<span>{{information.Account}}</span></li>
                                    <li>姓名：<span>易枫</span></li>
                                    <li>邮箱：<span>{{information.Email}}</span></li>
                                    <li>性别：<input style="vertical-align:middle" type="radio" name="gender" value="男" checked />男 &nbsp;<input style="vertical-align:middle;" type="radio" name="gender" value="女" />女</li>
                                    <li>年龄：<span>23</span></li>
                                    <li>所在公司：<span>上海远哈信息科技有限公司</span></li>
                                    <li>......</li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li role="presentation">
                        <a href="index-person-task.aspx">
                            <span class="glyphicon glyphicon-list-alt" style="vertical-align:middle;margin-bottom:2%"> </span>
                            近期任务
                        </a>
                        
                    </li>
                    <li role="presentation">
                        <a href="index-person-count.aspx">
                            <span class="glyphicon glyphicon-stats" style="vertical-align:middle;margin-bottom:2%"> </span>
                            个人统计
                        </a>
                        
                    </li>
                    <li role="presentation">
                        <a href="index-person-setting.aspx">
                            <span class="glyphicon glyphicon-cog" style="vertical-align:middle;margin-bottom:2%"> </span>
                                个人设置
                        </a>
                        
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <script>
        ///heighcharts
        $('#container').highcharts({
            chart: {
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45,
                    beta: 0
                }
            },
            title: {
                text: '任务完成情况（饼状图）'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    depth: 35,
                    dataLabels: {
                        enabled: true,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                type: 'pie',
                name: 'Browser share',
                data: [
                    ['前端项目', 45.0],
                    ['网帖注水', 26.8],
                    {
                        name: '开发型',
                        y: 12.8,
                        sliced: true,
                        selected: true
                    },
                    ['微博评论', 8.5],
                    ['老板666', 6.2],
                    ['Others', 0.7]
                ]
            }]
        });
        $(".content_box>ul>li").eq(0).addClass("active");
        //点击背景色改变
        $(".content_box>ul").on("click", "li", function () {
            $(this).addClass("active").siblings().removeClass("active");
        });
    </script>
</asp:Content>