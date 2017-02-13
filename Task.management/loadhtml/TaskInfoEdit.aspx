<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TaskInfoEdit.aspx.cs" Inherits="loadhtml_TaskInfoEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div class="aa">
         <div class="input-group aaa">
             <span class="input-group-addon ">任务编号:</span>
             <input type="type" id="commandNumber" class="form-control" value="<%=task.CommandNumber %>" " />
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">任务内容:</span>
             <input type="type" id="commandContent" class="form-control" value="<%=task.CommandContent %>" " />
        </div>
    </div>
    <button type="button" id="updateOneSubmit" class="btn btn-default btn-sm">确定：</button>
    <button type="button" id="back" class="btn btn-default btn-sm">返回</button>

</body>
</html>
