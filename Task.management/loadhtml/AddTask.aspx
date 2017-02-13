<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddTask.aspx.cs" Inherits="loadhtml_AddTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script>
        $(function () {
            //加载数据
            showData();
            $('#example').removeClass('display').addClass('table table-striped table-bordered');
            $(document).off('click');
            //返回
            $("#back").click(function () {
                $("#content").load("ReceiverMessage.aspx");
            })
            //添加指定的指令
            $(document).on("click", "#addTaskSubmit", function () {
                if (confirm("确认添加？")) {
                    var tID = $(this).attr("val");
                    var rID = $("#receiverID").val();
                    //console.log(tID);
                    //console.log(rID);
                    $.ajax({
                        url: "AddTask.aspx",
                        method: "POST",
                        data: {
                            reID: rID,
                            taID: tID
                        },
                        success: function (data) {
                            //console.log(data);
                            if (+data > 0) {
                                alert("分配成功");
                            }
                        }
                    })
                }
            })
        })
        //加载数据的函数
        function showData() {
            var id=$("#receiverID").val();
            $("#example").DataTable({
                display: "lightbox",
                dom: '<"top"i>rt<"bottom"flp><"clear">',
                searching: false,
                ording: false,
                aLengthMenu: [5, 10],
                ajax: {
                    url: "AddTask.aspx?method=send&receiverID="+id,
                    dataSrc: "Table1",
                },
                "columns": [
                    { data: "ID", "orderable": false },
                    { data: "ServerName", "orderable": false },
                    { data: "CommandContent", "orderable": false },
                    {
                        data: "ID",
                        orderable: false,
                        "render": function (data, type, full, meta) {
                            return data = '<button id="addTaskSubmit" class="btn btn-danger btn-sm" val=' + data + '>添加</button> ';
                        }
                    }
                ],
            });
        }
    </script>
</head>
<body>
    <div class="aa">
        <div class="input-group aaa">
             <span class="input-group-addon ">ID:</span>
             <input type="text" class="form-control" id="receiverID" value="<%=login.ID %>"/>
        </div>
        <div class="input-group aaa">
             <span class="input-group-addon ">网评员:</span>
             <input type="text" class="form-control" id="name" value="<%=login.NickName %>"/>
        </div>
        <table id="example">
            <thead>
                <tr>
                     <th>指令ID</th>
                     <th>创建人</th>
                     <th>指令内容</th>
                     <th>操作</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
        <button type="button" id="back" class="btn btn-default btn-sm">返回</button>
    </div>
</body>
</html>
