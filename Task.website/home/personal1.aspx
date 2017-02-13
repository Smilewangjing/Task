<%@ Page Language="C#" AutoEventWireup="true" CodeFile="personal1.aspx.cs" Inherits="www_personal1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人首页</title>
    <!--[if IE 8]>
        <script src="assets/frameworks/angular.js-ie8-builds-master/example/vendor/es5-shim.min.js"></script>        
    <![endif]-->
    <link rel="stylesheet" href="../assets/frameworks/bootstrap-3.3.0-dist/css/bootstrap.css" />
    <link href="../assets/frameworks/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/css/personal.css" />
    <script src="../assets/frameworks/jquery-1.8.3/jquery.min.js"></script>
    <script src="../assets/frameworks/jquery-2.1.4/jquery.min.js"></script>
    <script src="../assets/frameworks/bootstrap-3.3.0-dist/js/bootstrap.min.js"></script>
    <script src="../assets/frameworks/Highcharts-5.0.6/code/highcharts.js"></script>
    <script src="../assets/frameworks/Highcharts-5.0.6/code/highcharts-3d.js"></script>
    <script src="../assets/frameworks/Highcharts-5.0.6/code/modules/exporting.js"></script>
    <script src="../assets/js/page.js"></script>
    <script src="../assets/js/page1.js"></script>
    <script src="../assets/js/index.js"></script>
    <script src="../assets/js/personal.js"></script>
</head>
<body>
    <form id="form1" runat="server">    </form>
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
        <div class="content">
            <div class="personal-center">
                <div class="personal-left">
                    <div class="personal-user">
                        <img src="../assets/images/user.png" />
                       
                    </div>
                    <dl>
                        <dt style="margin-top:10px;"><span class="fa fa-user-o"></span>我的信息</dt>
                        <dd>
                            <a href="javascript:void(0)">个人信息<span class="car">&gt;</span></a>

                        </dd>
                    </dl>
                     <dl>
                        <dt><span class="fa fa-envelope-o"></span>我的任务</dt>
                        <dd class="recentTask">
                            <a href="javascript:void(0)">近期任务<span class="car">&gt;</span></a>
                        </dd>
                         <dd id="finsh-total">
                            <a href="javascript:void(0)">完成情况<span class="car">&gt;</span></a>
                        </dd>
                    </dl>
                     <dl>
                        <dt><span class="fa fa-pie-chart"></span>我的统计</dt>
                        <dd>
                            <a href="javascript:void(0)">任务统计<span class="car">&gt;</span></a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><span class="fa fa-cog"></span>个人设置</dt>
                        <dd>
                            <a href="javascript:void(0)">设置<span class="car">&gt;</span></a>
                        </dd>
                    </dl>
                </div>
                <div class="personal-right">
                    <div class="personal-one personal" style="display:none;">
                        <div id="intro">
                            <div>
                                <img src="../assets/images/user.png" alt="Alternate Text" />
                            </div>
                            <div class="img_alt">
                                <a href="javascript:void(0)" class="loca_img">本地照片</a>
                                <a href="javascript:void(0)" class="HD_img">高清拍照</a>
                            </div>
                            <div class="person_information">
                                <table style="width:300px;height:200px;margin:0 430px;margin-top:-40px;">
                                   
                                </table>
                            </div>
                    </div>
                </div>
                <div class="personal-two personal" style="display:none;">
                    <div class="personal-two-filter pull-right" style="display:inline-block">
                        <h5>
                            <select id="select1">
                                <option value="1">今天</option>
                                <option value="3">最近三天</option>
                                <option value="7">全部</option>
                            </select>
                        </h5>
                        <button class="btn" id="search" style="margin-top:-3px;">搜索</button>
                    </div>
                     <div class="con-main-msg">
                        <div class="con-main-msg-head" id="con-main-msg-head">
                            <div class="btn-group">
                                <div class="btn btn-default active" id="unread">未读</div>
                                <div class="btn btn-default" id="read">已读</div>
                            </div>
                        </div>
                    </div>
                    <div class="media_all">
                    </div>
                    <%--分页--%>
                    <div class="tcdPageCode"></div>
                </div>
                    <%-- 完成情况 --%>
                <div class="performance personal" style="display:none">
                        <div class="con-main-msg">
                            <div class="personal-two-filter pull-right" style="display:inline-block">
                            <h5>
                                <select id="select2">
                                    <option value="1">今天</option>
                                    <option value="3">最近三天</option>
                                    <option value="7">全部</option>
                                </select>
                            </h5>
                            <button class="btn" id="search1" style="margin-top:-3px;">搜索</button>
                        </div>
                        <div class="con-main-msg-head">
                            <div class="btn-group btn_group">
                                <div class="btn btn-default active" id="unfinsh">待办任务</div>
                                <div class="btn btn-default" id="doing">正在解决</div>
                                <div class="btn btn-default" id="finsh">已完成</div>
                            </div>
                        </div>
                        <div class="media_all" style="margin-top:20px;">
                        </div>
                    </div>
                     <%--分页--%>
                    <div class="PageCode"></div>
                </div>
                <div class="total personal" style="display:none;">
                    <div id="container" style="width:1010px;">

                    </div>
                    <div class="total-bottom">
                        <h3>完成情况</h3>
                        <table class="table5">
                            <tr>
                                <th>已完成</th>
                                 <th>未完成</th>
                                 <th>待审核</th>
                                 <th>已审核</th>
                            </tr>
                            <tr>
                                <td>12</td>
                                 <td>11</td>
                                 <td>12</td>
                                 <td>2</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="setting personal" style="display:none;">
                    <h3>个人设置</h3>
                    <table class="table1">
                        <tr>
                            <td>个人资料：</td>
                            <td><span>是否对其他人公开</span><input type="checkbox" name="message" /></td>
                        </tr>
                        <tr>
                            <td>用户权限：</td>
                            <td><span>是否自动接收任务</span><input type="checkbox" name="task" /></td>
                        </tr>
                         <tr>
                            <td>任务提醒：</td>
                            <td><span>登陆是否自动弹出已接任务</span><input type="checkbox" name="task1" /></td>
                              <td><span>登陆是否自动弹出新公告</span><input type="checkbox" name="task2" /></td>
                        </tr>
                    </table>
                    <h3>账号与安全</h3>
                    <table class="table2">
                        <tr>
                            <td>个人状态：</td>
                            <td><span>是否分享地理位置</span><input type="checkbox" name="message" /></td>
                        </tr>
                        <tr>
                            <td>安全设置：</td>
                            <td>
                                  <!-- Button trigger modal -->
                                <button type="button" class="btn btn-green" data-toggle="modal" data-target="#myModal">
                                    修改个人信息
                                </button>

                                <!-- Modal -->
                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" style="top:150px;">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal -title" id="myModalLabel">修改个人信息</h4>
                                            </div>
                                            <div class="modal-body">
                                                <table class="table4" style="width:500px;height:200px;margin-left:100px;">
                                                    <tr>
                                                        <td>昵称：</td>
                                                        <td><input type="text" name="name1" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>姓名：</td>
                                                        <td><input type="text" name="name" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>邮箱：</td>
                                                        <td><input type="text" name="email" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>手机号：</td>
                                                        <td><input type="text" name="phone" /></td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-info">保存</button>
                                                <button type="button" class="btn btn-info" data-dismiss="modal">关闭</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                     <h3>通用设置</h3>
                    <table class="table3">
                        <tr>
                            <td>保存附件路径：</td>
                            <td><input type="text" name="message" /><button class="btn1">选择</button></td>
                        </tr>
                    </table>
                     <button class="btn btn-green" style="margin-top:50px;margin-left:500px;">保存</button>
                </div>
            </div>
        </div>
            </div>
        <div style="clear:both;"></div>
            <div class="root-footer">
                  <div id="footer">
                <dl class="foot-one site-link">
                    <dt>网站相关</dt>
                    <dd>
                        <a href="">关于我们</a>
                    </dd>
                    <dd>
                        <a href="">服务条款</a>
                    </dd>
                    <dd>
                        <a href="">帮助中心</a>
                    </dd>
                    <dd>
                        <a href="">声望与权威</a>
                    </dd>
                    <dd>
                        <a href="">编辑器语法</a>
                    </dd>
                    <dd>
                        <a href="">每周精选</a>
                    </dd>
                    <dd>
                        <a href="">APP下载</a>
                    </dd>
                    <dd>
                        <a href="">社区服务中心</a>
                    </dd>
                </dl>
                <dl class="foot-one site-link">
                    <dt>联系合作</dt>
                    <dd>
                        <a href="">联系我们</a>
                    </dd>
                    <dd>
                        <a href="">加入我们</a>
                    </dd>
                    <dd>
                        <a href="">合作伙伴</a>
                    </dd>
                    <dd>
                        <a href="">媒体报道</a>
                    </dd>
                    <dd>
                        <a href="">建议反馈</a>
                    </dd>
                </dl>
                <dl class="foot-one site-link">
                    <dt>常用链接</dt>
                    <dd>
                        <a href="">笔记插件: Chrome</a>
                    </dd>
                    <dd>
                        <a href="">笔记插件: Firefox</a>
                    </dd>
                    <dd>
                        <a href="">订阅：问答 / 文章</a>
                    </dd>
                    <dd>
                        <a href="">文档镜像</a>
                    </dd>
                    <dd>
                        <a href="">社区访谈</a>
                    </dd>
                    <dd>
                        <a href="">D-DAY 技术沙龙</a>
                    </dd>
                    <dd>
                        <a href="">黑客马拉松 Hackathon</a>
                    </dd>
                    <dd>
                        <a href="">域名搜索注册</a>
                    </dd>
                </dl>
                <dl class="foot-one site-link">
                    <dt>网站相关</dt>
                    <dd>
                        <a href="">Github</a>
                    </dd>
                    <dd>
                        <a href="">Twitter</a>
                    </dd>
                    <dd>
                        <a href="">新浪微博</a>
                    </dd>
                    <dd>
                        <a href="">团队日志</a>
                    </dd>
                    <dd>
                        <a href="">产品技术日志</a>
                    </dd>
                    <dd>
                        <a href="">社区运营日志</a>
                    </dd>
                    <dd>
                        <a href="">市场运营日志</a>
                    </dd>
                </dl>
                <dl class="foot-two site-link" id="lic">
                    <dt>内容许可</dt>
                    <dd>
                        除特别说明外，用户内容均采用 <a href="#">知识共享署名-相同方式共享 3.0 中国大陆许可协议</a> 进行许可
                    </dd>
                    <dd>
                        本站由 <a href="">又拍云</a> 提供 CDN 存储服务
                    </dd>
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
                    <a href="">
                        <span class="glyphicon glyphicon-qrcode"></span>
                    </a>
                    <img id="erwm" class="border" src="images/3.png">
                    <p class="erwm-text">扫扫下载 App</p>
                </div>
            </div>
            </div>
    <script>
        //饼状图
        $("#unfinsh").trigger("click");
        Highcharts.chart('container', {
            chart: {
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45,
                    beta: 0
                }
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
                    ['Firefox', 45.0],
                    ['IE', 26.8],
                    {
                        name: 'Chrome',
                        y: 12.8,
                        sliced: true,
                        selected: true
                    },
                    ['Safari', 8.5],
                    ['Opera', 6.2],
                    ['Others', 0.7]
                ]
            }]
        });
        $(function () {
            $(".con-main-msg>.con-main-msg-head").show();
        })
    </script>
</body>
</html>
