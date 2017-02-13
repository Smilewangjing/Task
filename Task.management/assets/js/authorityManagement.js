$(function () {
            //$("#Tab").jqGrid({
            //    url: "../ashx/UserRole.ashx",
            //    datatype: "json",
            //    colNames: ['ID', "用户ID", '权限ID', '更新时间', '删除'],
            //    colModel: [
            //        { name: 'ID', index: 'id', width: 55 },
            //        { name: 'UserID', index: 'invdate', width: 90 },
            //        { name: 'RoleID', index: 'name asc, invdate', width: 100 },
            //        { name: 'UpdateTime', index: 'note', width: 150, sortable: true },
            //        { name: 'IsDel', index: 'note', width: 150, sortable: true },
            //    ],
            //    rowNum: 10,
            //    rowList: [10, 20, 30],
            //    sortname: 'CreateTime',//初始化的时候排序的字段
            //    pager: '#page',//表格页脚的占位符(一般是div)的id
            //    sortname: 'id',//初始化的时候排序的字段
            //    sortorder: "desc",//排序方式,可选desc,asc
            //    mtype: "post",//向后台请求数据的ajax的类型。可选post,get
            //    viewrecords: true,
            //    caption: "员工信息",//表格的标题名字
            //})
    //$("#Tab").jqGrid('navGrid', '#page', { edit: true, add: false, del: false })
    showData();
    $('#example').removeClass('display').addClass('table table-striped table-bordered');
    //编辑绑定事件
    $(document).on('click', '#updateRole', function () {
        var id = $(this).attr("val");
        $("#content").load("AuthorityEdit.aspx?id=" + id + "");
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
            url: "../ashx/UserRole.ashx",
            dataSrc: "Table1",
        },
        "columns": [
            { data: "ID", "orderable": false },
            { data: "UserID", "orderable": false },
            { data: "RoleID", "orderable": false },
            { data: "UpdateTime", "orderable": false },
            { data: "IsDel", "orderable": false },
            {
                data: "ID",
                orderable: false,
                "render": function (data, type, full, meta) {
                    return data = '<button id="updateRole" class="btn btn-default btn-sm" val=' + data + '>编辑</button>';
                }
            },
            
        ],
    });
}