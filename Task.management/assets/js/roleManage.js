
$(function () {
    //初始页面时加载角色数据
    getAllRole();
    //添加
    $("#addRole").click(function () {
        $("#content").load("RoleAdd.aspx");
    })
    
})
//初始页面时加载角色数据的函数
function getAllRole() {
    $.ajax({
        url: "RoleManage.aspx?method=send",
        //data:{"method":"send"},
        success: function (data) {
            //console.log(data);
            showData(JSON.parse(data))
        },
        error: function () {
            console.log("错误");
        }
    })
}
//将数据添加到表格上
function showData(data) {
    data.forEach(function (item) {
        var tr = $("<tr></tr>");
        for (var a in item) {
            var td = $("<td></td>");
            td.text(item[a]);
            tr.append(td);
        }
        var update = $("<td><span></span></td>");
        var del = $("<td><span></span></td>");
        update.find("span").text("编辑").click(function () {
            var id = $(this).parent().parent().find("td:eq(0)").text();
            $("#content").load("RoleEdit.aspx", {id:id})
        });
        //删除绑定方法
        del.find("span").text("删除").click(function () {
            if (confirm("确定删除？")) {
                var id = $(this).parent().parent().find("td:eq(0)").text();
                $.ajax({
                    url: "RoleManage.aspx",
                    method: "POST",
                    data: { "id": id },
                    success: function (data) {
                        if (+data > 0) {
                            $("#content").load("RoleManage.aspx");
                        }
                    }
                })
            }
        });
        tr.append(update);
        tr.append(del);
        $("tbody").append(tr);
    })
}