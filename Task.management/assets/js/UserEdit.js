$(function () {
    $("#backToMessage").click(function () {
        $("#content").load("userMessage.aspx");
    })
    $("#updateUserSubmit").click(function () {
        $.ajax({
            url: "UserEdit.aspx",
            method: "POST",
            data: {
                UserID: $("#UserID").val(),
                Password: $("#UserPassword").val(),
                NickName:$("#UserNickName").val(),
                MobilePhone: $("#UserMobilePhone").val(),
                Email:$("#UserEmail").val(),
            },
            success: function (data) {
                alert("修改成功");
                $("#content").load("UserMessage.aspx");
            }
        })
    })
})