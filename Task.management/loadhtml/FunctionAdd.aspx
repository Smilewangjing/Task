<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FunctionAdd.aspx.cs" Inherits="loadhtml_AddFunction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script>
        $(function () {
            $("#addOneSubmit").click(function () {
                $.ajax({
                    url: "FunctionAdd.aspx",
                    method: "POST",
                    data: {
                        name: $("#name").val(),
                        icon: $("#icon").val(),
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
                            alert("添加成功");
                            $("input").val("");
                        }
                    }
                });
            });
            $("#back").click(function () {
                $("#content").load("FunctionManage.aspx");
            });
        });
    </script>
</head>
<body>
    <div class="aa">
         <div class="input-group aaa">
             <span class="input-group-addon ">名称：</span>
             <input type="type" name="roleName" class="form-control" value=" " id="name"/>
        </div>
         <div class="input-group aaa">
             <span class="input-group-addon ">图片地址：</span>
             <input type="type" name="roleName" class="form-control" value=" " id="icon"/>
        </div>
         <div class="input-group aaa">
             <span class="input-group-addon ">详情地址：</span>
             <input type="type" name="roleName" class="form-control" value=" " id="url"/>
        </div>
         <div class="input-group aaa">
             <span class="input-group-addon ">排序ID：</span>
             <input type="type" name="roleName" class="form-control" value=" " id="sortID"/>
        </div>
         <div class="input-group aaa">
             <span class="input-group-addon ">父级ID：</span>
             <input type="type" name="roleName" class="form-control" value=" " id="fatherID"/>
        </div>
         <div class="input-group aaa">
             <span class="input-group-addon ">父级代码：</span>
             <input type="type" name="roleName" class="form-control" value=" " id="fatherCode"/>
        </div>
         <div class="input-group aaa">
             <span class="input-group-addon ">功能等级：</span>
             <input type="type" name="roleName" class="form-control" value=" " id="level"/>
        </div>
         <div class="input-group aaa">
             <span class="input-group-addon ">是否加载：</span>
             <input type="type" name="roleName" class="form-control" value=" " id="loaded"/>
        </div>
         <div class="input-group aaa">
             <span class="input-group-addon ">是否默认：</span>
             <input type="type" name="roleName" class="form-control" value=" " id="defaultLoad"/>
        </div>
         <button type="button" id="addOneSubmit" class="btn btn-default btn-sm">确定</button>
         <button type="button" id="back" class="btn btn-default btn-sm">返回</button>
    </div>
   
</body>
</html>
