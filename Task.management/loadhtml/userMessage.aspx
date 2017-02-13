<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userMessage.aspx.cs" Inherits="loadHtml_userMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   
    <title>后台管理页面</title>
    <script src="/assets/js/userMessage.js"></script>
    
</head>
<body>
    <table id="example">
        <thead>
            <tr>
                <th>ID</th>
                <th>账号</th>
                <th>昵称</th>
                <th>手机</th>
                <th>邮箱</th>
                <th>最近登陆时间</th>
                <th>最近在线时间</th>
                <th>创建时间</th>
                <th>更新时间</th>
                <th>逻辑删除</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>
    <div class="btn-group">
        <button type="button" id="addUserBtn" class="btn btn-default btn-sm">添加</button>
        <button type="button" class="btn btn-default btn-sm">批量删除</button>
    </div>
</body>
</html>
