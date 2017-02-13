$(function () {
    $.ajax({
        url: "TaskInfo.aspx?method=send",
        success: function (data) {
            var b = JSON.parse(data);
        },
        error: function (data) {
            console.log("error!");
        }
    })
    //加载数据
    showData();
    $('#example').removeClass('display').addClass('table table-striped table-bordered');
    $(document).off('click');
    //跳转到添加页面
    $("#addOneBtn").click(function () {
        $("#content").load("TaskInfoAdd.aspx");
    })
    //编辑绑定事件
    $(document).on('click', '#updateOne', function () {
        console.log($(this).attr("val"))
        var id = $(this).attr("val");
        $("#content").load("RoleEdit.aspx", { id: id });
    })
    //删除绑定事件
    $(document).on('click', '#deleteOne', function () {
        var id = $(this).attr("val");
        console.log($(this).attr("val"));
        if (confirm("确认删除?")) {
            $.ajax({
                url: "TaskInfo.aspx",
                method: "POST",
                data: {
                    id: id
                },
                success: function (data) {
                    if (+data > 0) {
                        alert("删除成功");
                        $("#content").load("TaskInfo.aspx");
                    }
                }
            })
        }
    });

});
//加载数据的函数
function showData() {
    $("#example").DataTable({
        display: "lightbox",
        dom: '<"top"i>rt<"bottom"flp><"clear">',
        searching: false,
        ording: false,
        aLengthMenu: [5, 10],
        ajax: {
            url: "TaskInfo.aspx?method=send",
            dataSrc: "Table1",
        },
        "columns": [
            { data: "ID", "orderable": false },
            { data: "NickName", "orderable": false },
            { data: "CommandNumber", "orderable": false },
            { data: "CommandContent", "orderable": false },
            { data: "Column1", "orderable": false },
            {data:"State","orderable":false},
            { data: "IsDel", "orderable": false },
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