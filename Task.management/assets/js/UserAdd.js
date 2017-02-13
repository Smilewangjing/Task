$(function () {
    $("#addUserSubmit").click(function (e) {
        addData();
    })
    $("#backToUser").click(function (e) {
        $("#content").load("UserMessage.aspx");
    })
})
function addData() {
    $.ajax({
        url: "../ashx/user.ashx",
        method: "POST",
        data: {
            "Account": $("#Account").val(),
            "Password": $("#Password").val(),
            "NickName": $("#NickName").val(),
            "MobilePhone": $("#MobilePhone").val(),
            "Email": $("#Email").val(),
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