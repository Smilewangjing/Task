<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TaskInfoAdd.aspx.cs" Inherits="loadhtml_TaskInfoAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <%--<link rel="stylesheet" href="../assets/framework/jquery-ui-themes-1.12.1/themes/base/jquery-ui.css"/>
    <link rel="stylesheet" href="../assets/framework/jquery-ui-1.10.3.custom/css/smoothness/jquery-ui-1.10.3.custom.min.css"/>--%>
    <%--<script src="../assets/framework/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="../assets/framework/jquery-ui-1.10.3.custom/development-bundle/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script>
        //日期选择器
        $(function () {
            $('.date').datepicker();
        });
    </script>--%>

    <%--<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>--%>
    <link rel="stylesheet" href="../assets/framework/css_datepicker/bootstrap-datetimepicker.min.css"/>
    <%--<link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen"/>--%>
    <script type="text/javascript" src="../assets/framework/bootstrap_datepicker/js1/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="../assets/framework/bootstrap_datepicker/js1/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="../assets/js/TaskInfoAdd.js"></script>
   <script>
       $(function(){
           $('.form_datetime').datetimepicker({
               language: 'zh-CN',
               minView: 0,
               format: "yyyy-mm-dd hh:mm:ss",
               pickDate: true,
               pickTime: true,
               weekStart: 7,
               todayBtn: 1,
               autoclose: 1,
               todayHighlight: 1,
               startView: 2,
               forceParse: 0,
               showMeridian: 1
           })
       })
    </script>
</head>
<body>
        <div class="aa">
            <%--<div class="input-group  left">
                <span class="input-group-addon ">任务级别编号：</span>
                <input type="type" name="commandLevelID" class="form-control" value=" " id="commandLevelID"/>
            </div>--%>
            <div class="input-group aaa">
                <span class="input-group-addon ">创建用户：</span>
                <input type="type" name="userID" class="form-control" value=" " id="userID" disabled/>
            </div>
            <div class="input-group aaa">
                <span class="input-group-addon ">任务编号：</span>
                <input type="type" name="commandNumber" class="form-control" value=" " id="commandNumber"/>
            </div>
            <%--<div class="input-group left">
                <span class="input-group-addon ">任务来源编号：</span>
                <input type="type" name="themeID" class="form-control" value=" " id="themeID"/>
            </div>--%>
            <%--<div class="input-group left">
                <span class="input-group-addon ">任务流水号：</span>
                <input type="type" name="commandSerialNumber" class="form-control" value=" " id="commandSerialNumber"/>
            </div>--%>
            <%--<div class="input-group left">
                <span class="input-group-addon ">服务信息名称：</span>
                <input type="type" name="serverName" class="form-control" value=" " id="serverName"/>
            </div>--%>
            <div class="input-group aaa">
                <span class="input-group-addon ">任务内容：</span>
                <input type="type" name="commandContent" class="form-control" value=" " id="commandContent"/>
            </div>
           <%--<div class="input-group aaa ">
                <span class="input-group-addon ">有效日期：</span>
                <input type="type" name="vaildDate" class="form-control date" value=" " id="vaildDate"/>
           </div>--%>
            <div class="input-group aaa form-group">
                <div class="input-group date form_datetime" data-date="1979-09-16T05:25:07Z" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                    <span class="input-group-addon ">有效日期：</span>
                    <input type="type" name="vaildDate" class="form-control date" value=" " id="vaildDate"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				<input type="hidden" id="dtp_input1" value="" />
           </div>
            <div class="input-group aaa form-group">
                <div class="input-group date form_datetime" data-date="1979-09-16T05:25:07Z" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                    <span class="input-group-addon ">停用日期：</span>
                    <input type="type" name="vaildDate" class="form-control date" value=" " id="disableDate"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				<input type="hidden" id="dtp_input1" value="" />
           </div>
           <%--<div class="input-group aaa">
                <span class="input-group-addon ">停用日期：</span>
                <input type="type" name="disableDate" class="form-control date" value=" " id="disableDate"/>
            </div>--%>
            <div class="input-group aaa">
                <span class="input-group-addon ">引导分数：</span>
                <input type="type" name="urgent" class="form-control" value=" " id="urgent"/>
            </div>
            <%-- <div class="input-group left">
                <span class="input-group-addon ">审核：</span>
                <input type="type" name="isReview" class="form-control" value=" " id="isReview"/>
            </div>--%>
            <%--<div class="input-group left">
                <span class="input-group-addon ">机构编号：</span>
                <input type="type" name="organID" class="form-control" value=" " id="organID"/>
            </div>--%>
            <%--<div class="input-group left">
                <span class="input-group-addon ">所属事件编号：</span>
                <input type="type" name="commandEventID" class="form-control" value=" " id="commandEventID"/>
            </div>--%>
            <%-- <--div class="input-group left">
                <span class="input-group-addon ">目标URL：</span>
                <input type="type" name="possyURL" class="form-control" value=" " id="possyURL"/>
            </div>--%>
            <%--<div class="input-group aaa left">
                <span class="input-group-addon ">短信通知：</span>
                <input type="type" name="isMessage" class="form-control" value=" " id="isMessage"/>
            </div>--%>
            <%--<div class="input-group left">
                <span class="input-group-addon ">反馈条数限制：</span>
                <input type="type" name="feedbackCount" class="form-control" value=" " id="feedbackCount"/>
            </div>--%>
            <div style="margin:10px auto;width:100px">
                <button type="button" id="addOneSubmit" class="btn btn-default btn-sm">确定</button>
                <button type="button" id="back" class="btn btn-default btn-sm">返回</button>
            </div>
</body>
</html>
