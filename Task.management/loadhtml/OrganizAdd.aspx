<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrganizAdd.aspx.cs" Inherits="loadhtml_OrganizAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     
    <script>
        $(function () {
            $("#addOneSubmit").click(function () {
                addSubmit();
            })
            $("#back").click(function () {
                $("#content").load("OrganizManage.aspx");
            })
        });
        function addSubmit() {
            //拿到所有值传递到后台
            $.ajax({
                url: "OrganizAdd.aspx",
                method: "POST",
                data: {
                    name: $("#name").val(),
                    desc: $("#desc").val(),
                    sortID: $("#sortID").val(),
                    secretKey: $("#secretKey").val(),
                    parentID: $("#parentID").val(),
                    parentCode: $("#parentCode").val(),
                    level: $("#level").val()
                },
                success: function (data) {
                    if (+data > 0) {
                        alert("添加成功");
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
             <input type="text" class="form-control" id="name">
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon">描述：</span>
             <input type="text" class="form-control" id="desc">
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon">排序：</span>
             <input type="text" class="form-control" id="sortID">
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon">唯一标识：</span>
             <input type="text" class="form-control" id="secretKey">
        </div> 
        <div class="input-group aaa">
             <span class="input-group-addon">父级ID：</span>
             <input type="text" class="form-control" id="parentID">
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon">父级代码：</span>
             <input type="text" class="form-control" id="parentCode">
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon">等级：</span>
             <input type="text" class="form-control" id="level">
        </div>
         <button type="button" id="addOneSubmit" class="btn btn-default btn-sm">确定：</button>
         <button type="button" id="back" class="btn btn-default btn-sm">返回</button>
    </div>
</body>
</html>
