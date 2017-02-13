$(function () {
    $("#back").click(function () {
        $("#content").load("TaskInfo.aspx");
    })
    $("#updateOneSubmit").click(function () {
        $.ajax({
            url: "TaskInfoEdit.aspx",
            method: "POST",
            data: {
                CommandNumber: $("#CommandNumber:").val(),
                CommandContent: $("#UserPassword").val(),
            },
            success: function (data) {
                alert("修改成功");
                $("#content").load("UserMessage.aspx");
            }
        })
    })
})