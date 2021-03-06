﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrganizManage.aspx.cs" Inherits="loadhtml_OrganizManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
   
    
    <script>
        $(function () {
            //加载数据
            showData();
            $('#example').removeClass('display').addClass('table table-striped table-bordered');
            $(document).off('click');
            //跳转到添加页面
            $("#addOneBtn").click(function () {
                $("#content").load("OrganizAdd.aspx");
            })
            //编辑绑定事件
            $(document).on('click', '#updateOne', function () {
                //console.log($(this).attr("val"))
                var id = $(this).attr("val");
                $("#content").load("OrganizEdit.aspx", {id:id});
            })
            //删除绑定事件
            $(document).on('click', '#deleteOne', function () {
                var id = $(this).attr("val");
                //console.log($(this).attr("val"));
                
                if (confirm("确认删除?")) {
                    $.ajax({
                        url: "OrganizManage.aspx",
                        method: "POST",
                        data: {
                            id: id
                        },
                        success: function (data) {
                            if (+data > 0) {
                                alert("删除成功");
                                $("#content").load("OrganizManage.aspx");
                            }
                        }
                    })
                }
            });

        });
        //加载数据的函数
        function showData() {
            $("#example").DataTable({
                display:"lightbox",
                dom: '<"top"i>rt<"bottom"flp><"clear">',
                searching: false,
                ording: false,
                aLengthMenu: [5, 10],
                ajax: {
                    url: "OrganizManage.aspx?method=send&&flag=1",
                    dataSrc: "Table1",
                },
                "columns": [
                    { data: "ID", "orderable": false },
                    { data: "Name", "orderable": false },
                    { data: "Explanation", "orderable": false },
                    { data: "SortID", "orderable": false },
                    { data: "SecretKey", "orderable": false },
                    { data: "ParentID", "orderable": false },
                    { data: "ParentCode", "orderable": false },
                    { data: "MenuLevel", "orderable": false },
                    { data: "UpdateTime", "orderable": false },
                    {
                        data: "ID",
                        orderable: false,
                        "render": function (data, type, full, meta) {
                            return data = '<button id="updateOne" class="btn btn-default btn-sm" val=' + data + '>编辑</button>';
                        }
                    },
                    {
                        data: "ID",
                        orderable: false,
                        "render": function (data, type, full, meta) {
                            return data = '<button id="deleteOne" class="btn btn-danger btn-sm" val=' + data + '>删除</button> ';
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
						<th>名称</th>
						<th>描述</th>
						<th>排序</th>
						<th>唯一标识</th>
						<th>父级ID</th>
                        <th>父级代码</th>
                        <th>等级</th>
						<th>操作时间</th>
                  
                        <th>编辑</th>
                        <th>删除</th>
					</tr>
        </thead>
        <tbody></tbody>
    </table>
    <div class="btn-group">
        <button type="button" id="addOneBtn" class="btn btn-default btn-sm">添加</button>
        <button type="button" class="btn btn-default btn-sm">批量删除</button>
    </div>
    
</body>
</html>
