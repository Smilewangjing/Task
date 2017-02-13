<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserEdit.aspx.cs" Inherits="loadhtml_UserEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../assets/js/UserEdit.js"></script>
</head>
<body>
    <div class="aa">
         <div class="input-group aaa">
             <span class="input-group-addon ">用户ID:</span>
             <input type="type" id="UserID" class="form-control" value="<%=User.Id %>" readonly="readonly" />
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">用户密码:</span>
             <input type="type" id="UserPassword" class="form-control" value="<%=User.Password %>"  />
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">用户昵称:</span>
             <input type="type" id="UserNickName" class="form-control" value="<%=User.NickName %>"  />
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">用户手机:</span>
             <input type="type" id="UserMobilePhone" class="form-control" value="<%=User.MobilePhone %>"  />
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">用户邮箱:</span>
             <input type="type" id="UserEmail" class="form-control" value="<%=User.Email %>"  />
        </div>
    </div>
 <button type="button" id="updateUserSubmit" class="btn btn-default btn-sm">确定</button>
         <button type="button" id="backToMessage" class="btn btn-default btn-sm">返回</button>
</body>
</html>
