<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="loadHtml_Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台管理页面</title>
    <!--引入css-->
    <link href="/assets/css/common.css" rel="stylesheet" />
    <link href="../assets/css/main.css" rel="stylesheet" />
    <link href="/assets/framework/bootstrap-3.3.0-dist/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/assets/framework/DataTables-1.10.12/media/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <!--引入js-->
    <script src="/assets/framework/jquery-2.1.4/jquery.min.js"></script>
    <script src="/assets/framework/bootstrap-3.3.0-dist/dist/js/bootstrap.min.js"></script>
    <script src="/assets/framework/DataTables-1.10.12/media/js/jquery.dataTables.min.js"></script>
    <script src="/assets/framework/DataTables-1.10.12/media/js/dataTables.bootstrap.min.js"></script>
    <script src="/assets/framework/DataTables-1.10.12/media/js/jquery.dataTables.min.js"></script>
    <script src="/assets/framework/DataTables-1.10.12/media/js/dataTables.bootstrap.min.js"></script>
    <script src="../assets/js/main.js"></script>
    <script>
        $(function () {
            //内容展示区
            $("#userMessage").click(function () {
                $("#content").load("userMessage.aspx");
            })
            $("#loginLog").click(function () {
                $("#content").load("conLog.aspx");
            })
            $("#authorityManage").click(function () {
                $("#content").load("authorityManagement.aspx"); 
            })
            $("#role").click(function () {
                $("#content").load("RoleManage.aspx");
            })
            $("#function").click(function () {
                $("#content").load("FunctionManage.aspx");
            })
            $("#adminOrganiz").click(function () {
                $("#content").load("OrganizManage.aspx");
            })
            $("#receiverOrganiz").click(function () {
                $("#content").load("ReceiverOrganiz.aspx");
            })
            $("#structMessage").click(function () {
                $("#content").load("TaskInfo.aspx");
            })
            $("#structAdd").click(function () {
                $("#content").load("TaskInfoAdd.aspx?id=1");
                //$("#content").click(function(){
                    //window.location.href="TaskInfoAdd.aspx";
                //})
                //$("#content").trigger("click");
            })
            $("#structDispense").click(function () {
                $("#content").load("TaskDispense.aspx");
            })
            $("#structReply").click(function () {
                $("#content").load("TaskReply.aspx");
            })
            $("#receiverMessage").click(function () {
                $("#content").load("ReceiverMessage.aspx");
            })
        })
    </script>
 </head>  
<body>
	
    <div>
    <!-- 导航项目 -->
    <div class="row">
        <div class="collapse navbar-collapse navbar-collapse-example nav-title">
            <span>任务管理系统</span>
            <!-- 右侧的导航项目 -->
            <ul class="nav navbar-nav navbar-right myNavbar">
                <li><a>欢迎光临，</a></li>
                <li class="dropdown">
                    <a href="/" class="dropdown-toggle" data-toggle="dropdown">管理员<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/">个人中心</a></li>
                        <li><a href="/">登录日志</a></li>
                        <li><a href="/">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!-- END .navbar-collapse -->
    <div class="row">
        <div class="col-sm-2 myLeftCol">
            <div class="list">
                <ul>
                    <li>
                        <p class="title"><i class="glyphicon glyphicon-user"></i> 用户管理</p>
                        <ul class='list-se'>
                            <p class="title"><i class="glyphicon glyphicon-user"></i> 用户管理</p>
                            <li><p id="userMessage">用户信息</p></li>
                            <li><p id="loginLog">登陆日志</p></li>
                            <li><p id="authorityManage">权限管理</p></li>
                        </ul>
                    </li>
                    <li>
                        <p class="title"><i class="glyphicon glyphicon-ok"></i> 权限管理</p>
                        <ul class='list-se'>
                            <p class="title"><i class="glyphicon glyphicon-ok"></i> 权限管理</p>
                            <li><p id="role">角色管理</p></li>
                            <li><p id="function">功能管理</p></li>
                        </ul>
                    </li>
                    <li>
                        <p class="title"><i class="glyphicon glyphicon-pencil"></i> 指令管理</p>
                        <ul class='list-se'>
                            <p class="title"><i class="glyphicon glyphicon-pencil"></i> 指令管理</p>
                            <li><p id="structMessage">任务信息</p></li>
                            <li><p id="structAdd">新建任务</p></li>
                        </ul>
                    </li>
                    <li>
                        <p class="title"><i class="glyphicon glyphicon-pencil"></i> 团体组织</p>
                        <ul class='list-se'>
                            <p class="title"><i class="glyphicon glyphicon-pencil"></i> 团体组织</p>
                            <li><p id="adminOrganiz">管理员组</p></li>
                            <li><p id="receiverOrganiz">网评员组</p></li>
                        </ul>
                    </li>
                    <li>
                        <p class="title"><i class="glyphicon glyphicon-briefcase"></i> 网评员管理</p>
                        <ul class='list-se'>
                            <p class="title"><i class="glyphicon glyphicon-home"></i> 网评员管理</p>
                            <li><p id="receiverMessage">网评员信息</p></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm-9" id="content"></div>
    </div>
</div>
</body>
</html>
