<%@ Page Language="C#" AutoEventWireup="true" CodeFile="detailed.aspx.cs" Inherits="personal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>任务详细页面</title>
    <link href="../assets/frameworks/bootstrap-3.3.0-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/frameworks/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../assets/css/index.css" rel="stylesheet" />
    <script src="../assets/frameworks/jquery-1.8.3/jquery.min.js"></script>
    <script src="../assets/frameworks/angularJS/angular.min.js"></script>
    <script src="../assets/js/index.js"></script>
    <script src="../assets/js/detailed.js"></script>
</head>
<body>
        <%-- 完成情况页面头部 --%>
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
                               <a href="#" class="quick_link"><img src="../assets/images/user.png" /></a>
                               <ul class="quick_user_toggle">
                                   <li><a href="login.aspx">切换账号</a></li>
                                   <li><a href="login.aspx">退出</a></li>
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
        <%-- 详细任务主内容 --%>
        <div class="content">
            <div class="con">
                <div class="con-task">
                    <%--返回按钮--%>
                    <%--<button type="button" class="close" style="margin:10px;overflow:hidden" onclick="history.go(-1)"><span aria-hidden="true" class="fa fa-reply"></span><span class="sr-only">Close</span></button>--%>
                    <%--详细任务--%>
                    <%--<div class="media">
                        <a href="#" class="media-left"><img src="../assets/images/user.png" /></a>
                        <div class="media-body">
                            <h4>大标题</h4>
                            <h5>发布人：李瑞霞 <i>| </i><span> 发布时间：2016-12-02</span></h5>
                            <p style="text-indent:2em">任务详情：网站配色方案一：简单的、时尚的、高雅的如今极简设计已普遍被应用于网页设计中，当
                                然这拥有充分理由。轻量级的布局和低维修成本使其灵活适合于响应式设计。自然优雅极具美感，使
                                得很多品牌和机构青睐并采用。然而赞赏这一设计风格和创造它是两码事。看起来，由于极简主义元
                                素不多，复制某种风格似乎变的及其容易。然而事实却正好相反，由于设计师可利用的元素极少，创造
                                一个极简主义的设计设计师往往要付出更多思考和努力。对极简主义来说，无聊始终是一种威胁，所以
                                改变你的布局以进一步吸引用户，交替沿z字形布局模式可以帮助阅读。<span class="directive-url"><a href="#">directive url</a></span></p>
                            <div class="media-body-date"><h5 class="pull-right">完成日期：2016-12-20</h5></div>
                            <div class="media-body-submit"><button class="btn">接收</button></div>
                        </div>
                    </div>--%>
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
            <div class="copyright text-center">
                Copyright &copy; 2011-2016 SegmentFault. 当前呈现版本 16.11.16<br>
                <a href="">浙ICP备 15005796号-2</a> &nbsp;
                <a href="">浙公网安备 33010602002000号</a>
            </div>
            <div id="fixed" class="hidden-xs hidden-sm">
                <a id="back" class="border-bottom" href="#">回顶部</a>
                <div class="icon1">
                    <a href=""><span class="glyphicon glyphicon-qrcode"></span></a>
                    <img id="erwm" class="border" src="images/3.png">
                    <p class="erwm-text">扫扫下载 App</p>
                </div>
            </div>
    </div>
</body>
</html>
