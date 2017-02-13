<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AuthorityEdit.aspx.cs" Inherits="loadhtml_AuthorityEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../assets/js/AuthorityEdit.js"></script>
</head>
<body>
    <div class="aa">
         <div class="input-group aaa">
             <span class="input-group-addon ">ID:</span>
             <input type="type" id="UserRoleID" class="form-control" value="<%=UserRole.ID %>" readonly="readonly" />
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">用户ID:</span>
             <input type="type" id="UserID" class="form-control" value="<%=UserRole.UserID %>"  />
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">权限ID:</span>
             <input type="type" id="RoleID" class="form-control" value="<%=UserRole.RoleID %>"  />
        </div>
    </div>
 <button type="button" id="updateRoleSubmit" class="btn btn-default btn-sm">确定</button>
         <button type="button" id="backToManagement" class="btn btn-default btn-sm">返回</button>
</body>
</html>
