<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrganizEdit.aspx.cs" Inherits="loadhtml_OrganizEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script>
        $(function () {
            //保存修改
            $("#updateOneSubmit").click(updateSubmit)
            //返回
            $("#back").click(function () {
                $("#content").load("OrganizManage.aspx");
            })
        });
        function updateSubmit() {
            //拿到值并传给后台
            $.ajax({
                url: "OrganizEdit.aspx",
                method: "POST",
                data: {
                    id: $("#id").val(),
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
                        alert("修改成功");
                        $("#content").load("OrganizManage.aspx");
                    }
                }

            })
            //$.ajax({
            //    url: "OrganizEdit.aspx",
            //    method: "POST",
            //    data: {
            //        id: $("#id").val(),
            //        name: $("#name").val(),
            //        desc: $("#desc").val(),
            //        sortID: $("#sortID").val(),
            //        secretKey: $("#secretKey").val(),
            //        parentID: $("#parentID").val(),
            //        parentCode: $("#parentCode").val(),
            //        level: $("#level").val()
            //    },
            //    success: function (data) {
            //        console.log(data);
            //    }
            //})
        }
    </script>
</head>
<body>
    <div style="width:50%;margin:0 auto;">
        <div class="input-group aaa">
             <span class="input-group-addon ">ID：</span>
             <input type="text" class="form-control" id="id" value="<%=org.ID %>">
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">名称：</span>
             <input type="text" class="form-control" id="name" value="<%=org.Name %>">
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon">描述：</span>
             <input type="text" class="form-control" id="desc" value="<%=org.Explanation %>">
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon">排序：</span>
             <input type="text" class="form-control" id="sortID" value="<%=org.SortID %>">
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon">唯一标识：</span>
             <input type="text" class="form-control" id="secretKey" value="<%=org.SecretKey %>">
        </div> 
        <div class="input-group aaa">
             <span class="input-group-addon">父级ID：</span>
             <input type="text" class="form-control" id="parentID" value="<%=org.ParentID %>">
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon">父级代码：</span>
             <input type="text" class="form-control" id="parentCode" value="<%=org.ParentCode %>">
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon">等级：</span>
             <input type="text" class="form-control" id="level" value="<%=org.MenuLevel %>">
        </div>
         <button type="button" id="updateOneSubmit" class="btn btn-default btn-sm">确定</button>
         <button type="button" id="back" class="btn btn-default btn-sm">返回</button>
    </div>
</body>
</html>
