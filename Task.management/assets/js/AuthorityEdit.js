$(function () {
    $("#backToMessage").click(function () {
        $("#content").load("userMessage.aspx");
    })
    $("#updateRoleSubmit").click(function (e) {
        $.ajax({
            url: "AuthorityEdit.aspx",
            method: "POST",
            data: {
                UserRoleID: $("#UserRoleID").val(),
                UserID: $("#UserID").val(),
                RoleID: $("#RoleID").val(),
            },
            success: function (data) {
                alert("修改成功");
                $("#content").load("UserMessage.aspx");
            }
        })
    })
})