<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReceiverMessage.aspx.cs" Inherits="loadhtml_receiverMessage" %>

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
            $(document).on("click", "#addTask", function () {
                var id = $(this).attr("val");
                $("#content").load("AddTask.aspx", {id:id});
            })
        })
        //加载数据的函数
        function showData() {
            $("#example").DataTable({
                display: "lightbox",
                dom: '<"top"i>rt<"bottom"flp><"clear">',
                searching: false,
                ording: false,
                aLengthMenu: [5, 10],
                ajax: {
                    url: "ReceiverMessage.aspx?method=send",
                    dataSrc: "Table1",
                },
                "columns": [
                    { data: "ID", "orderable": false },
                    { data: "NickName", "orderable": false },
                    { data: "Email", "orderable": false },
                    { data: "UserState", "orderable": false },
                    { data: "CreateTime", "orderable": false },
                    {
                        data: "ID",
                        orderable: false,
                        "render": function (data, type, full, meta) {
                            return data = '<button id="addTask" class="btn btn-danger btn-sm" val=' + data + '>添加任务</button> ';
                        }
                    }
                ],
            });
        }
    </script>
</head>
<body>
    <table id="example">
        <thead>
            <tr>
                <th>ID</th>
                <th>昵称</th>
                <th>邮箱</th>
                <th>状态</th>
                <th>创建时间</th>
                <th>任务</th>
            </tr>
        </thead>
    </table>
        <button type="button" class="btn btn-default btn-sm">批量删除</button>
</body>
</html>
