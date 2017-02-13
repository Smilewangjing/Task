$(function () {
    //向后台传递数据
    $("#addOneSubmit").click(function () {
        addData();
    })
    //返回
    $("#back").click(function () {
        $("#content").load("TaskInfo.aspx");
    })
})
var user=$("#userID").val(GetRequest());
    //向后台传递数据的函数

function addData() {
    $.ajax({
        url: "TaskInfoAdd.aspx",
        method: "POST",
        data: {
            //"commandLevelID":$("#commandLevelID").val(),
            "userID": $("#userID").val(user),
            //"themeID": $("#themeID").val(),
            //"commandSerialNumber": $("#commandSerialNumber").val(),
            "commandNumber": $("#commandNumber").val(),
            //"serverName": $("#serverName").val(),
            "commandContent": $("#commandContent").val(),
            "urgent": $("#urgent").val(),
            "vaildDate": $("#vaildDate").val(),
            "disableDate": $("#disableDate").val()
            //"isReview": $("#isReview").val(),
            //"organID": $("#organID").val(),
            //"commandEventID": $("#commandEventID").val(),
            //"possyURL": $("#possyURL").val(),
            //"isMessage": $("#isMessage").val(),
            //"feedbackCount": $("#feedbackCount").val()
        },
        success: function (data) {
            alert("添加成功");
            $("input").val("");
        },
        error:function(){
            console.log(data);
            alert("添加失败，请重试");
        }
    })
}
function GetRequest() {
    var url = window.location.href;
    var index = url.substring(url.lastIndexOf('=') + 1);
    return index;
}
