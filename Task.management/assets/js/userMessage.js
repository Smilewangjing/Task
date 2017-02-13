$(function () {
    //var account = window.location.search.substring(6);
    //$.post("../ashx/User.ashx", { "account": account }, function (data) {
    //    var data = JSON.parse(data);
    //    //用户ID
    //    var id = data[0].ID;
    //    $.post("../ashx/UserRole.ashx", { "id": id }, function (data) {
    //        var data = JSON.parse(data);
    //        //权限ID
    //        var ID = data[0].RoleID;
    //        $("#Tab").jqGrid({
    //            url: "../ashx/User.ashx?id="+id+"&limit="+ID+"",
    //            datatype: "json",
    //            colNames: ['ID', "账号", '密码', '昵称', '手机', '邮箱', '最近登陆时间', '最后在线时间', '创建时间', '更新时间', '删除'],
    //            colModel: [
    //                { name: 'ID', index: 'id', width: 55 },
    //                { name: 'Account', index: 'invdate', width: 90 },
    //                { name: 'password', index: 'name asc, invdate', width: 100 },
    //                { name: 'NickName', index: 'amount', width: 80, align: "right" },
    //                { name: 'MobilePhone', index: 'tax', width: 80, align: "right" },
    //                { name: 'Email', index: 'total', width: 80, align: "right" },
    //                { name: 'CurrentTime', index: 'note', width: 150, sortable: true },
    //                { name: 'LastTime', index: 'note', width: 150, sortable: true },
    //                { name: 'CreateTime', index: 'note', width: 150, sortable: true },
    //                { name: 'UpdateTime', index: 'note', width: 150, sortable: true },
    //                { name: 'IsDel', index: 'note', width: 150, sortable: true },
    //            ],
    //            rowNum: 10,
    //            rowList: [10, 20, 30],
    //            sortname: 'CreateTime',//初始化的时候排序的字段
    //            pager: '#page',//表格页脚的占位符(一般是div)的id
    //            sortname: 'id',//初始化的时候排序的字段
    //            sortorder: "desc",//排序方式,可选desc,asc
    //            mtype: "post",//向后台请求数据的ajax的类型。可选post,get
    //            viewrecords: true,
    //            caption: "员工信息",//表格的标题名字
    //        })
    //        $("#Tab").jqGrid('navGrid', '#page', { edit: true, add: false, del: false })
    //    })
    //})
    showData();
    $('#example').removeClass('display').addClass('table table-striped table-bordered');
    //跳转到添加页面
    $("#addUserBtn").click(function () {
        $("#content").load("UserAdd.aspx");
    })
    //编辑绑定事件
    $(document).on('click', '#updateUser', function () {
        var id = $(this).attr("val");
        $("#content").load("UserEdit.aspx?id=" + id + "");
    })
    //删除绑定事件
    $(document).on('click', '#deleteUser', function () {
        var id = $(this).attr("val");
        if (confirm("确认删除?")) {
            $.ajax({
                url: "../ashx/User.ashx",
                method: "POST",
                data: {
                    ID: id
                },
                success: function (data) {
                    console.log(data)
                    if (+data > 0) {
                        alert("删除成功");
                        $("#content").load("UserMessage.aspx");
                    }
                }
            })
        }
    });
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
            url: "../ashx/User.ashx",
            dataSrc: "Table1",
        },
        "columns": [
            { data: "ID", "orderable": false },
            { data: "Account", "orderable": false },
            { data: "NickName", "orderable": false },
            { data: "MobilePhone", "orderable": false },
            { data: "Email", "orderable": false },
            { data: "CurrentTime", "orderable": false },
            { data: "LastTime", "orderable": false },
            { data: "CreateTime", "orderable": false },
            { data: "UpdateTime", "orderable": false },
            { data: "IsDel", "orderable": false },
            {
                data: "ID",
                orderable: false,
                "render": function (data, type, full, meta) {
                    return data = '<button id="updateUser" class="btn btn-default btn-sm" val=' + data + '>编辑</button>';
                }
            },
            {
                data: "ID",
                orderable: false,
                "render": function (data, type, full, meta) {
                    return data = '<button id="deleteUser" class="btn btn-danger btn-sm" val=' + data + '>删除</button> ';
                }
            }
        ],
    });
}