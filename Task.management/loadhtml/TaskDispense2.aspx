<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TaskDispense2.aspx.cs" Inherits="loadhtml_TaskDispense2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link href="/assets/framework/bootstrap-3.3.0-dist/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/assets/framework/DataTables-1.10.12/media/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <!--引入js-->
    <script src="/assets/framework/jquery-2.1.4/jquery.min.js"></script>
    <script src="/assets/framework/bootstrap-3.3.0-dist/dist/js/bootstrap.min.js"></script>
    <script src="/assets/framework/DataTables-1.10.12/media/js/jquery.dataTables.min.js"></script>
    <script src="/assets/framework/DataTables-1.10.12/media/js/dataTables.bootstrap.min.js"></script>
    <script src="/assets/framework/DataTables-1.10.12/media/js/jquery.dataTables.min.js"></script>
    <script src="/assets/framework/DataTables-1.10.12/media/js/dataTables.bootstrap.min.js"></script>
    <script>
        $(function () {
            //解绑
            $("#addTask").off("click");
            //选项卡
            $('#myTab a').click(function (e) {
                e.preventDefault();
                $(this).tab('show');
            })
            //加载执行员的数据
            loadData();
            //加载组织的数据
            $(".organiz").each(function (a, b) {
                $(b).removeClass('display').addClass('table table-striped table-bordered');
                showData($(b));

            })
            //分配任务
            //给选定人员分配任务
            var arr = new Array();
            $("#addTask").on('click', function () {
                console.log($("#example :checked"));
                console.log($(".organiz :checked"));
            })
        });
        //加载执行员的数据
        function loadData() {
            $("#example").removeClass('display').addClass('table table-striped table-bordered');
            $("#example").DataTable({
                display: "lightbox",
                dom: '<"top"i>rt<"bottom"flp><"clear">',
                searching: false,
                ording: false,
                aLengthMenu: [5, 10],
                ajax: {
                    url: "TaskDispense2.aspx?method2=send",
                    dataSrc: "Table1"
                },
                "columns": [
                    {
                        data: "ID",
                        orderable: false,
                        render: function (data, type, row, meta) {
                            return data = '<input type="checkbox" value=' + data + '>';
                        }
                    },
                    { data: "ID", "orderable": false },
                    { data: "NickName", "orderable": false },
                    { data: "Email", "orderable": false }
                ]
            })
        }
        //加载组织数据的函数
        function showData(table) {
            var id=table.attr("id").substr(7,1);
            table.DataTable({
                display: "lightbox",
                dom: '<"top"i>rt<"bottom"flp><"clear">',
                searching: false,
                ording: false,
                aLengthMenu: [5, 10],
                ajax: {
                    url: "TaskDispense2.aspx?method=send&&organiz="+id,
                    dataSrc: "Table1",
                    async :false
                },
                "columns": [
                    {
                        data: "ID",
                        orderable: false,
                        render: function (data, type, row, meta) {
                            return data = '<input type="checkbox" value=' + data + '>';
                        }
                    },
                    { data: "ID", "orderable": false },
                    { data: "NickName", "orderable": false },
                    { data: "Email", "orderable": false }
                ]
            });
        }
    </script>
</head>
<body>
    <!--选项卡-->
    <ul class="nav nav-tabs" role="tablist" id="myTab">
        <li role="presentation" class="active"><a href="#receivers" role="tab" data-toggle="tab">执行员</a></li>
        <li role="presentation"><a href="#organiz" role="tab" data-toggle="tab">组织团体</a></li>
    </ul>

    <!-- 面板内容 -->
    
    <div class="tab-content">
        <!--执行人员-->
        <div role="tabpanel" class="tab-pane active" id="receivers">
            <table id="example">
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" value=" " />
                            全选
                        </th>
                        <th>ID</th>
						<th>昵称</th>
						<th>邮箱</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
        <!--组织团体-->
        <div role="tabpanel" class="tab-pane" id="organiz">
            <div class="panel-group">
              <%foreach(var item in list){%>
              <!--折叠-->
                <!--折叠头-->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a href="#one<%=Convert.ToString(item.ID) %>" data-toggle="collapse" data-parent="#organiz"><%=item.Name %></a>
                        </h4>
                    </div>
                </div>
                <!--折叠体-->
                <div class="panel-collapse collapse in" id="one<%=Convert.ToString(item.ID) %>">
                    <div class="panel-body">
                        <table id="example<%=Convert.ToString(item.ID) %>" class="organiz" style="width:800px">
                            <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" value=" " />
                                        全选
                                    </th>
                                    <th>ID</th>
						            <th>昵称</th>
						            <th>邮箱</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
				       
			        </div>
                </div>
                
              <%} %>
                
            </div>
        </div>
    </div>
   
    <!--确认分配按钮-->
    <button type="button" class="btn btn-danger btn-sm" id="addTask">确认分配</button>
</body>
</html>
