<%@ Page Title="任务管理系统" Language="C#" MasterPageFile="~/master/main-drawer.master" AutoEventWireup="true" CodeFile="index-task.aspx.cs" Inherits="index_task" %>

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
    <script src="assets/js/index.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <%--<inmost:Navbarsub ID="Navbarsub1" runat="server" />--%>

    <div class="container" ng-app="index" ng-controller="oneCtrl">
        <div class="row">
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
            <div class="white-row margin-bottom-0 border-none text-center inmost-tools min-height-40">
                
                <a class="col-percent-20 pull-left" href="index.aspx">
                    <p><i class="glyphicon glyphicon-comment fsize-1-6"></i></p>
                    <span class="fsize-0-8">公告</span>
                </a>
                <a class="col-percent-20 pull-left" href="#">
                    <p><i class="glyphicon glyphicon-send fsize-1-6"></i></p>
                    <span class="fsize-0-8">首页</span>
                </a>
                <a class="col-percent-20 pull-left" href="index-person-infomation.aspx">
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
        <div class="row rows-one">
            <div class="form-group has-feedback">
                <input type="text" class="form-control">
                <span class="glyphicon glyphicon-search form-control-feedback"></span>
            </div>
        </div>
        <div class="row rows-two">
            <div class="btn-group btn-group-justified">
                <div class="btn-group" role="group">
                    <button class="btn btn-default dropdown" data-toggle="dropdown" id="unread">
                        未读
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu uls">
                        <li ng-click="getUnreadToday()"><a href="javascript:void(0)"><%--{{options.duration.today=="1"?"今天":""}}--%>今天</a></li>
                        <li ng-click="getUnreadThree()"><a href="javascript:void(0)"><%--{{options.duration.three=="3"?"最近三天":""}}--%>最近三天</a></li>
                        <li ng-click="getUnread()"><a href="javascript:void(0)"><%--{{options.duration.all=="7"?"全部":""}}--%>全部</a></li>
                    </ul>
                </div>
                <div class="btn-group" role="group">
                    <button class="btn btn-default dropdown" data-toggle="dropdown">
                        已读
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu uls">
                        <li ng-click="getReadToday()"><a href="javascript:void(0)"><%--{{options.duration.today=="1"?"今天":""}}--%>今天</a></li>
                        <li ng-click="getReadThree()"><a href="javascript:void(0)"><%--{{options.duration.three=="3"?"最近三天":""}}--%>最近三天</a></li>
                        <li ng-click="getRead()"><a href="javascript:void(0)"><%--{{options.duration.all=="7"?"全部":""}}--%>全部</a></li>
                    </ul>
                </div>
                <div class="btn-group" role="group">
                    <button class="btn btn-default" data-toggle="dropdown">
                        完成情况
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu uls">
                         <li>
                             <a href="javascript:void(0)"><%--{{options.type.finish=="finshed"?"已完成":""}}--%>
                                 已完成
                                 <span ng-click="getFinshed()" class="firstSpan">全部</span>
                                 <span ng-click="getTodayFinshed()">今天</span>
                                 <span ng-click="getThreeFinshed()">近三天</span>
                             </a>
                         </li>
                        <li>
                            <a href="javascript:void(0)"><%--{{options.type.doing==3?"正在解决":""}}--%>
                                正执行
                                <span ng-click="getDoing()" class="firstSpan">全部</span>
                                <span ng-click="getTodayDoing()">今天</span>
                                <span ng-click="getThreeDoing()">近三天</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)"><%--{{options.type.unfinish=="unfinsh"?"未完成":""}}--%>
                                未完成
                                <span ng-click="getUnfinsh()" class="firstSpan">全部</span>
                                <span ng-click="getTodayUnfinsh()">今天</span>
                                <span ng-click="getThreeUnfinsh()">近三天</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row row-three" ng-repeat="data in datas">
            <div class="col-percent-100">
                <my-one class="{{data.CommandID}}" val="{{data.ID}}">
                           
                </my-one>
                <div class="media">
                    <a class="media-left media-middle" href="#">
                        <img src="assets/images/user.png" />
                    </a>
                    <div class="media-body">
                        
                       <div class="media-body-poster" >
                            <h4>{{data.ServerName}}</h4><h5 class="pull-right send-time">发布时间：{{data.CreateTime}}</h5>
                        </div>
                        <p id="p2"><a href="">{{data.CommandContent}}</a></p>
                        <div class="media-body-state">
                            <p style="margin-top:10px;" id="state">指令状态（{{data.Description}}）</p><p class="pull-right complete-time">日期:{{data.DisableTime}}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row row-four">
            <div class="more" style="margin-top:20px;">
                <button class="btn btn-default" style="width:50%;margin-left:25%;">加载更多</button>
            </div>
        </div>
   </div>
    <script>
        $(function () {
            $(".uls li a").on("click", "span", function () {
                $(this).css("border", "2px solid #337AB7").siblings("span").css("border", "");
                $(this).parent().parent().siblings().find("span").css("border", "");
            });
        });
    </script>
</asp:Content>

