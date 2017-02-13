<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RoleEdit.aspx.cs" Inherits="loadhtml_EditRole" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script>
        $(function () {
            $("#back").click(function () {
                $("#content").load("RoleManage.aspx");
            })
            $("#updateOneSubmit").click(function () {
                //alert();
                $.ajax({
                    url: "RoleEdit.aspx",
                    method: "POST",
                    data:{
                        roleId: $("#roleId").val(),
                        roleName: $("#roleName").val(),
                        roleRemark: $("#roleRemark").val()
                    },
                    success: function () {
                        alert("修改成功");
                        $("#content").load("RoleManage.aspx");
                    }
                })
            })
        })
    </script>
</head>
<body>
    <div class="aa">
         <div class="input-group aaa">
             <span class="input-group-addon ">用户ID:：</span>
             <input type="type" id="roleId" class="form-control" value="<%=role.Id %>" " />
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">用户名称:：</span>
             <input type="type" id="roleName" class="form-control" value="<%=role.Name %>" " />
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">用户备注:：</span>
             <input type="type" id="roleRemark" class="form-control" value="<%=role.Remark %>" " />
        </div>
    </div>
 <button type="button" id="updateOneSubmit" class="btn btn-default btn-sm">确定：</button>
         <button type="button" id="back" class="btn btn-default btn-sm">返回</button>
</body>
</html>
