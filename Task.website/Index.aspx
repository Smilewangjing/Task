<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>任务管理首页</title>
    <!--[if IE 8]>
        <script src="assets/frameworks/angular.js-ie8-builds-master/example/vendor/es5-shim.min.js"></script>        
    <![endif]-->
    <link rel="stylesheet" href="assets/frameworks/bootstrap-3.3.0-dist/css/bootstrap.min.css" />
    <link href="assets/frameworks/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="assets/css/index.css" rel="stylesheet" />
    <script src="assets/frameworks/jquery-1.8.3/jquery.min.js"></script>
    <script src="assets/js/index.js"></script>
    <script src="assets/js/index-data.js"></script>
    <script src="assets/js/page.js"></script>
    <script src="assets/js/page1.js"></script>
</head>
<body>
    <%-- 首页头部 --%>
    <div class="content-head">
            <div class="header">
               <div class="header-left">
                   <div class="header-logo">
                       <a href="#">任务管理系统</a>
                   </div>
                   <ul class="menu">
                      
                   </ul>
               </div>
               <div class="header-right">
                   <div class="two pull-right">
                       <ul class="quick_user">
                           <li>
                               <a href="#" class="quick_link"><img src="assets/images/user.png" /></a>
                               <ul class="quick_user_toggle">
                                   <li><a href="home/login.aspx">切换账号</a></li>
                                   <li><a href="home/login.aspx">退出</a></li>
                               </ul>
                           </li>
                         
                       </ul>
                   </div>
                   <div class="header-search pull-right">
                       <div class="input-group">
                           <span class="input-group-btn">
                               <button class="btn" type="button">
                                   <span class="glyphicon glyphicon-search"></span>
                               </button>
                           </span>
                           <input id="searchBox" name="search" type="text" placeholder="输入关键字搜索" class="form-control" />
                       </div>
                   </div>
               </div>
         </div>
    </div>
        <%-- 首页主内容 --%>
    <div class="content">
         <div class="con">
            <div class="con-main">
                <%-- 首页任务分类 --%>
                <div class="con-main-header">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="javascript:;">未读</a></li>
                        <li><a href="javascript:;">已读</a></li>
                        <li><a href="javascript:;">完成情况</a></li>
                        <li class="pull-right"><span class="label label-green today"><a href="javascript:;">今天</a></span><span class="label label-green threeDay"><a href="javascript:;">最近三天</a></span><span class="label label-green allDay"><a href="javascript:;">全部</a></span></li>
                    </ul>
                </div>
                <%-- 首页任务主内容 --%>
                <div class="con-main-msg">
                    <%-- 完成情况分类 --%>
                        <div class="con-main-msg-head">
                            <div class="btn-group">
                                <div class="btn btn-default active">全部</div>
                                <div class="btn btn-default">待办任务</div>
                                <div class="btn btn-default">正在执行</div>
                                <div class="btn btn-default">已完成</div>
                            </div>
                        </div>
                    <%-- 任务主内容 --%>
                    <%--<div class="media" ng-repeat="allTask in allTasks">
                        <a href="#" class="media-left media-middle"><img src="assets/images/user.png" /></a>
                        <div class="media-body">
                            <div class="media-body-poster">
                                <h4>{{allTask.ServerName}}</h4><h5 class="pull-right send-time">{{allTask.CreateTime}}</h5>
                            </div>
                            <p><a href="home/detailed.aspx">{{allTask.CommandContent}}</a></p>
                            <div class="media-body-state">
                                <p>{{allTask.Description}}</p><p class="pull-right complete-time">{{allTask.DisableTime}}</p>
                            </div>
                        </div>
                    </div>--%>
                </div>
                <%-- 分页 --%>
                <div class="tcdPageCode"></div>
            </div>
             <%-- 右侧公告广告栏 --%>
            <div class="con-ad">
                <div class="con-ad-notice">
                    <h4><span class="fa fa-bullhorn pull-left" style="margin-left:30px"></span>&nbsp;&nbsp;&nbsp;&nbsp;公司公告</h4>
                    <div class="con-ad-notice-boby">
                        <dl>
                            <dd><a href="#">水电费dsfdgg</a></dd>
                            <dd><a href="#">物业费</a></dd>
                            <dd><a href="#">水电费vfdvfdbdfb</a></dd>
                            <dd><a href="#">物业费</a></dd>
                        </dl>
                    </div>
                </div>
                <div class="con-ad-news">
                    <h4><span class="fa fa-bullhorn pull-left" style="margin-left:30px"></span>&nbsp;&nbsp;&nbsp;&nbsp;公司头条</h4>
                    <div class="con-ad-news-boby">
                        <dl>
                            <dd><a href="#">水电费</a></dd>
                            <dd><a href="#">物业费</a></dd>
                            <dd><a href="#">水电费</a></dd>
                            <dd><a href="#">物业费</a></dd>
                        </dl>
                    </div>
                </div>
            </div>
         </div> 
    </div>
        <%-- 尾部 --%>
    <div class="content">
        <div id="footer">
            <dl class="foot-one site-link">
                <dt>网站相关</dt>
                <dd><a href="">关于我们</a></dd>
                <dd><a href="">服务条款</a></dd>
                <dd><a href="">帮助中心</a></dd>
                <dd><a href="">声望与权威</a></dd>
                <dd><a href="">编辑器语法</a></dd>
                <dd><a href="">每周精选</a></dd>
                <dd><a href="">APP下载</a></dd>
                <dd><a href="">社区服务中心</a></dd>
            </dl>
            <dl class="foot-one site-link">
                <dt>联系合作</dt>
                <dd><a href="">联系我们</a></dd>
                <dd><a href="">加入我们</a></dd>
                <dd><a href="">合作伙伴</a></dd>
                <dd><a href="">媒体报道</a></dd>
                <dd><a href="">建议反馈</a></dd>
            </dl>
            <dl class="foot-one site-link">
                <dt>常用链接</dt>
                <dd><a href="">笔记插件: Chrome</a></dd>
                <dd><a href="">笔记插件: Firefox</a></dd>
                <dd><a href="">订阅：问答 / 文章</a></dd>
                <dd><a href="">文档镜像</a></dd>
                <dd><a href="">社区访谈</a></dd>
                <dd><a href="">D-DAY 技术沙龙</a></dd>
                <dd><a href="">黑客马拉松 Hackathon</a></dd>
                <dd><a href="">域名搜索注册</a></dd>
            </dl>
            <dl class="foot-one site-link">
                <dt>网站相关</dt>
                <dd><a href="">Github</a></dd>
                <dd><a href="">Twitter</a></dd>
                <dd><a href="">新浪微博</a></dd>
                <dd><a href="">团队日志</a></dd>
                <dd><a href="">产品技术日志</a></dd>
                <dd><a href="">社区运营日志</a></dd>
                <dd><a href="">市场运营日志</a></dd>
            </dl>
            <dl class="foot-two site-link" id="lic">
                <dt>内容许可</dt>
                <dd>除特别说明外，用户内容均采用 <a  href="#">知识共享署名-相同方式共享 3.0 中国大陆许可协议</a> 进行许可</dd>
                <dd>本站由 <a  href="">又拍云</a> 提供 CDN 存储服务</dd>
            </dl>
        </div>
        <%-- 版本信息 --%>
        <div class="copyright text-center">
            Copyright &copy; 2011-2016 SegmentFault. 当前呈现版本 16.11.16<br>
            <a href="">浙ICP备 15005796号-2</a> &nbsp;
            <a href="">浙公网安备 33010602002000号</a>
        </div>
        <%--回到顶部 --%>
        <div id="fixed" class="hidden-xs hidden-sm">
            <a id="back" class="border-bottom" href="#">回顶部</a>
            <div class="icon1">
                <a href=""><span class="glyphicon glyphicon-qrcode"></span></a>
                <img id="erwm" class="border" src="assets/images/3.png">
                <p class="erwm-text">扫扫下载 App</p>
            </div>
        </div>
    </div>
</body>
    <script>
       
    </script>
</html>
