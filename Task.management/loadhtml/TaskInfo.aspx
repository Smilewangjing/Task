<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TaskInfo.aspx.cs" Inherits="TaskManageIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>指令基本信息管理</title>
    <script src="/assets/js/TaskInfo.js"></script>
</head>
<body>
    <table id="example" style="width:100%;margin:0 auto;">
        <thead>
            <tr>
                <th>ID</th><!--ID-->
                <th>用户名称</th>
                <th>任务编号</th><!--CommandNumber-->
                <th>任务内容</th><!--CommandContent-->
                <th>创建时间</th><!--CreateTime-->
                <th>任务状态</th>
                <th>逻辑删除</th><!---IsDel-->              
                <th>删除</th>              
            </tr>
        </thead>
        <tbody></tbody>
    </table>
    <div class="btn-group">
        <button type="button" id="addOneBtn" class="btn btn-default btn-sm">添加</button>
        <button type="button" class="btn btn-default btn-sm">批量删除</button>
    </div>
</body>
</html>
