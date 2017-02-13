<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserAdd.aspx.cs" Inherits="loadhtml_UserAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../assets/js/UserAdd.js"></script>
</head>
<body>
    <div class="aa">
        <div class="input-group aaa">
             <span class="input-group-addon ">用户名：</span>
             <input type="type" name="roleName" class="form-control" value=" " id="Account"/>
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">密码：</span>
             <input type="password" name="roleRemark" class="form-control" value="" id="Password"/>
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">昵称：</span>
             <input type="type" name="roleSortId" class="form-control" value=" " id="NickName"/>
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">手机：</span>
             <input type="type" name="roleSortId" class="form-control" value=" " id="MobilePhone"/>
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">邮箱：</span>
             <input type="type" name="roleSortId" class="form-control" value=" " id="Email"/>
        </div>
    </div>
    <button type="button" id="addUserSubmit" class="btn btn-default btn-sm">确定</button>
    <button type="button" id="backToUser" class="btn btn-default btn-sm">返回</button>
</body>
</html>
