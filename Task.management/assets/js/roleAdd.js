$(function () {
    
   
    //向后台传递数据
    $("#okRoleAdd").click(function () {
        addData();
    })
    //返回
    $("#back").click(function () {
        $("#content").load("RoleManage.aspx");
    })
})
//向后台传递数据的函数
function addData() {
    $.ajax({
        url: "RoleAdd.aspx",
        method: "POST",
        data: {
            "roleName": $("#roleName").val(),
            "roleRemark": $("#roleRemark").val(),
            "roleSortId": $("#roleSortId").val()
        },
        success: function (data) {
            if (+data > 0) {
                alert("添加成功");
                $("input").val("");
            } else {
                alert("添加失败，请重试");
            }
        }
    })
}