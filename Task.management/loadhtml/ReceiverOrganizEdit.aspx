<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReceiverOrganizEdit.aspx.cs" Inherits="loadhtml_ReceiverOrganizEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../assets/css/main.css" rel="stylesheet" />
     <script>
         $(function () {
             $("#hidden").hide();
            $('#example').removeClass('display').addClass('table table-striped table-bordered');
            $('#example1').removeClass('display').addClass('table table-striped table-bordered');
            $('#example3').removeClass('display').addClass('table table-striped table-bordered');
            $(document).off('click');
            //保存修改
            $("#updateOneSubmit").click(updateSubmit)
            //返回
            $("#back").click(function () {
                $("#content").load("ReceiverOrganiz.aspx");
            });
            //加载组内已经存在的用户
            var table = $("#example");
            var table1=$("#example1")
            loadGroupPerson(table, 1);
            loadGroupPerson(table1, 2);
            //给选定人员分配任务
            var arr = new Array();
            $("#addTaskToOrganiz").on('click', function () {
                
                if ($("#example :checked").length==0) {
                    alert("请先选择");
                }
                else {
                    $("#example :checked").each(function (a, b) {
                        arr.push($(b).val());
                    });
                    $("#hidden").show();
                }
                
            })
            //加载该组还没有别分配的任务
            loadGroupTask()
            //给组分配任务
            $(document).on("click", "#addTaskSubmit", function () {
                $.ajax({
                    url: "ReceiverOrganizEdit.aspx",
                    method: "POST",
                    data: {
                        id:$(this).attr("val"),
                        arr:JSON.stringify(arr)
                    },
                    success: function (data) {
                        if (data == "right") {
                            alert("添加成功");
                        } else {
                            alert("添加失败");
                        }
                    }

                })
            })
            $(".organiz").off("click");
            $(".organiz").click(function () {
                $(this).css("background", "#337AB7").siblings().css("background", "");
                $(this).css("color", "#ffffff").siblings().css("color", "#000000");
                $(".tb").show();
                $(".tb").next().hide();
            })
            
            $(".organizp").click(function () {
                $(this).css("background", "#337AB7").siblings().css("background", "");
                $(this).css("color", "#ffffff").siblings().css("color", "#000000");
                $(".tb").hide();
                $(".tb").next().show();
            })
            console.log($(".organizp"));
            $(".organiz").trigger("click");
        });
         //加载该组还没有别分配的任务的函数
        function loadGroupTask() {
            //组ID
            var id = $("#id").val();
            $("#example3").DataTable({
                display: "lightbox",
                dom: '<"top"i>rt<"bottom"flp><"clear">',
                searching: false,
                ording: false,
                aLengthMenu: [5, 10],
                ajax: {
                    url: "ReceiverOrganizEdit.aspx?OrganizID=" + id,
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
         //加载组内已经存在的用户的函数
        function loadGroupPerson(table,flag) {
            var id = $("#id").val();
            table.DataTable({
               
                display: "lightbox",
                dom: '<"top"i>rt<"bottom"flp><"clear">',
                searching: false,
                ording: false,
                aLengthMenu: [5, 10],
                ajax: {
                    url: "ReceiverOrganizEdit.aspx?method=send&&id="+id+"&&flag="+flag,
                    dataSrc: "Table1",
                },
                "columns": [
                    {
                        data: "ID",
                        orderable: false,
                        render: function (data, type, row, meta) {
                            return data = '<input type="checkbox" value='+data+'>';
                        }
                    },
                    { data: "ID", "orderable": false },
                    { data: "NickName", "orderable": false },
                    { data: "Email", "orderable": false },
                    {
                        data: "ID",
                        orderable: false,
                        "render": function (data, type, row, meta) {
                            if (flag == 1) {
                                return data = '<button id="delOne" class="btn btn-danger btn-sm" val=' + data + '>删除</button> ';

                            }
                            else {
                                return data = '<button id="joinOrganiz" class="btn btn-danger btn-sm" val=' + data + '>加入组内</button> ';

                            }
                        }
                    }
                ],
            });
        }
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
            
        }
     </script>
</head>
<body>
    <ul class="nav nav-tabs" style="margin-top:10px;">
      <li class="organiz" style="border-radius:5px;">
        <a  href="#" style="color:#ffffff;">
          组织信息 
        </a>
      </li>
       <li class="organizp" style="border-radius:5px;">
        <a  href="#" style="color:#000000;" >
          组员信息 
        </a>
      </li>
    </ul>
    <div class="tb" style="width:50%;margin:0 auto;">
        <fieldset>
            <legend>组织基本信息</legend>
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
        </fieldset>
       
    </div>
    <div style="display:none;">
        <form>
            <fieldset>
            <legend>添加组员</legend>
            <div style="width:45%;display:inline-block">
            <!--组内的人员-->
                <table id="example">
                    <caption>组内人员</caption>
                    <thead>
                        <tr>
                           <th>选择</th>
                          <th>ID</th>
                          <th>姓名</th>
                          <th>邮箱</th>
                          <th>删除</th>
                      </tr>  
                    </thead>
                    <tbody></tbody>      
                </table>
                <button type="button" id="addTaskToOrganiz" class="btn btn-danger btn-sm">给选定人员分配任务</button>
            </div>
            <div style="width:45%;display:inline-block">
                <!--组外的人员-->
               <table id="example1">
                    <caption>添加进组内</caption>
                    <thead>
                        <tr>
                            <th>选择</th>
                          <th>ID</th>
                          <th>姓名</th>
                          <th>邮箱</th>
                          <th>加入组</th>
                      </tr>  
                    </thead>
                    <tbody></tbody>      
                </table>
            </div>
            <div id="hidden" style="width:50%">
                <table id="example3" style="width:100% !important">
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
            </div>
        </fieldset>
        </form>
        
    </div>
    <div>
        <div>
            <div></div>
        </div>
    </div>
</body>
</html>
