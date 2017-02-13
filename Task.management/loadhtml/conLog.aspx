<%@ Page Language="C#" AutoEventWireup="true" CodeFile="conLog.aspx.cs" Inherits="loadHtml_conLog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台管理系统</title>
   
    <%--<script src="/assets/js/conLog.js"></script>--%>
</head>
<body>
    <table id="example">
        <thead>
            <tr>
                <th>ID</th>
                <th>名称</th>
                <th>备注</th>
                <th>排序</th>
                <th>操作时间</th>
                <th>逻辑删除</th>
                <th>编辑</th>
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
