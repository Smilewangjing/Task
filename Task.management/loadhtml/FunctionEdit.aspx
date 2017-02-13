<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FunctionEdit.aspx.cs" Inherits="loadhtml_FunctionEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script>
        $(function () {
            $("#back").click(function () {
                $("#content").load("FunctionManage.aspx");
            })
            $("#updateOneSubmit").click(function () {
                $.ajax({
                    url: "FunctionEdit.aspx",
                    method: "POST",
                    data: {
                        id:$("#id").val(),
                        name:$("#name").val(),
                        icon:$("#icon").val(),
                        url: $("#url").val(),
                        sortID: $("#sortID").val(),
                        fatherID: $("#fatherID").val(),
                        fatherCode: $("#fatherCode").val(),
                        level: $("#level").val(),
                        loaded: $("#loaded").val(),
                        defaultLoad: $("#defaultLoad").val()
                    },
                    success: function (data) {
                        if (+data > 0) {
                            alert("修改成功");
                            $("#content").load("FunctionManage.aspx");
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
    <div class="aa">
         <div class="input-group aaa">
             <span class="input-group-addon ">ID:：</span>
            <input type="type"  class="form-control" id="id" value="<%=fun.Id %>" " />
         </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">名称:：</span>
             <input type="type" class="form-control"  id="name" value=" <%=fun.Name %>" />
         </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">图片地址:：</span>
             <input type="type" class="form-control"  id="icon" value="<%=fun.Icon %>" " />
         </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">详情地址:：</span>
             <input type="type" class="form-control"  id="url" value="<%=fun.Url %>" " />
         </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">排序ID:：</span>
             <input type="type"  class="form-control" id="sortID" value="<%=fun.SortID %>" " />
         </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">父级ID:：</span>
             <input type="type"  class="form-control" id="fatherID" value="<%=fun.ParentID %>" " />
         </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">父级代码:：</span>
             <input type="type" class="form-control"  id="fatherCode" value="<%=fun.ParentCode %>" " />
         </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">功能等级:：</span>
            <input type="type"  class="form-control" id="level" value="<%=fun.Level %>" " />
         </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">是否加载:：</span>
             <input type="type"  class="form-control" id="loaded" value="<%=fun.Loaded %>" " />
         </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">是否默认:：</span>
             <input type="type"  class="form-control" id="defaultLoad" value="<%=fun.Defaulted %>" " />
         </div>
         <button type="button" id="updateOneSubmit" class="btn btn-default btn-sm">确定</button>
         <button type="button" id="back" class="btn btn-default btn-sm">返回</button>
    </div>
</body>
</html>
