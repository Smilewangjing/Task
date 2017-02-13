<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RoleAdd.aspx.cs" Inherits="loadhtml_AddRole" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../css/table.css" rel="stylesheet" />
    <%--<script src="/assets/js/roleadd.js"></script>--%>
    <script>
        $(function () {


            //向后台传递数据
            $("#addOneSubmit").click(function () {
                addData();
            })
            //返回
            $("#back").click(function () {
                $("#content").load("RoleManage.aspx");
            })
        })
        //向后台传递数据的函数
        function addData() {
            $.ajax({
                url: "RoleAdd.aspx",
                method: "POST",
                data: {
                    "roleName": $("#roleName").val(),
                    "roleRemark": $("#roleRemark").val(),
                    "roleSortId": $("#roleSortId").val()
                },
                success: function (data) {
                    if (+data > 0) {
                        alert("添加成功");
                        $("input").val("");
                    } else {
                        alert("添加失败，请重试");
                    }
                }
            })
        }
    </script>
</head>
<body>
    <div class="aa">
        <div class="input-group aaa">
             <span class="input-group-addon ">名称：</span>
             <input type="type" name="roleName" class="form-control" value=" " id="roleName"/>
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">备注：</span>
             <input type="type" name="roleRemark" class="form-control" value=" " id="roleRemark"/>
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">排序：</span>
             <input type="type" name="roleSortId" class="form-control" value=" " id="roleSortId"/>
        </div>
    </div>
    <button type="button" id="addOneSubmit" class="btn btn-default btn-sm">确定</button>
    <button type="button" id="back" class="btn btn-default btn-sm">返回</button>
</body>
</html>
