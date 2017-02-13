$(function () {
    buttonClick();
    loginClick();
    asideClick();
})
function loginClick() {
    $(".nav p span").click(function (e) {
        $(".hidden-login").fadeIn();
    })
}
//权限ID
var id = 0;
//用户ID
var userID = 0;
function buttonClick() {
    $("#isLogin").click(function (e) {
        //$.ajax({
        //    url: "ashx/Login.ashx",
        //    method: "POST",
        //    data: {
        //        "account": $("input").eq(1).val(),
        //        "password": $("input").eq(2).val()
        //    }
        //});
        $.post("ashx/Login.ashx", { "account": $("input").eq(1).val(), "password": $("input").eq(2).val() }, function (data) {
            if (data != "]") {
                    $(".hidden-login").fadeOut();
                    //window.location.href = "loadHtml/Index.aspx"
                    data = JSON.parse(data)
                    //$(".nav p").html("welcome! " + data[0].NickName + "");
                    var name = data[0].Account
                    window.location.href = "loadHtml/Index.aspx?nick=" + name + "";
                }
                else {
                    alert("ERROR Incorrect username or password")
                }
            })
    })
}
function asideClick() {
    $(".aside p").eq(0).click(function (e) {
        var tabName = $(e.target).attr("value");
        if (id == 0) { alert("plz login") }
        else {
            $("#Tab").jqGrid({
                url: "ashx/User.ashx?tabN=" + tabName + "&ID=" + id + "&UsID=" + userID + "",
                datatype: "json",
                colNames: ['ID', "账号", '密码', '昵称', '手机', '邮箱', '最近登陆时间', '最后在线时间', '创建时间', '更新时间', '删除'],
                colModel: [
				             { name: 'ID', index: 'id', width: 55 },
				             { name: 'Account', index: 'invdate', width: 90 },
				             { name: 'password', index: 'name asc, invdate', width: 100 },
				             { name: 'NickName', index: 'amount', width: 80, align: "right" },
				             { name: 'MobilePhone', index: 'tax', width: 80, align: "right" },
				             { name: 'Email', index: 'total', width: 80, align: "right" },
				             { name: 'CurrentTime', index: 'note', width: 150, sortable: true },
                             { name: 'LastTime', index: 'note', width: 150, sortable: true },
                             { name: 'CreateTime', index: 'note', width: 150, sortable: true },
                             { name: 'UpdateTime', index: 'note', width: 150, sortable: true },
                             { name: 'IsDel', index: 'note', width: 150, sortable: true },
                ],
                rowNum: 10,
                rowList: [10, 20, 30],
                sortname: 'CreateTime',//初始化的时候排序的字段
                pager: '#page',//表格页脚的占位符(一般是div)的id
                sortname: 'id',//初始化的时候排序的字段
                sortorder: "desc",//排序方式,可选desc,asc
                mtype: "post",//向后台请求数据的ajax的类型。可选post,get
                viewrecords: true,
                caption: "员工信息",//表格的标题名字
            })
            $("#Tab").jqGrid('navGrid', '#page', { edit: true, add: false, del: false })
            //$.jgrid = { defaults : { recordtext: "View {0} - {1} of {2}", emptyrecords: "No records to view", loadtext: "Loading...", pgtext : "Page {0} of {1}" }}
        }
    })
    $(".aside p").eq(1).click(function (e) {
        var tabName = $(e.target).attr("val");
        if (id == 0) { alert("plz login") }
        else {$("#Tab").jqGrid({});}
    })
    $(".aside p").eq(2).click(function (e) {
        if (id == 0) { alert("plz login") }
        else if (id == 1) {
            $("#Tab").jqGrid({
                url: "ashx/UserRole.ashx",
                datatype: "json",
                colNames: ['ID', "账号ID", '权限ID', '更新时间', '删除'],
                colModel: [ //jqGrid每一列的配置信息。包括名字，索引，宽度,对齐方式.....
                             { name: 'ID', index: 'id', width: 55 },
                             { name: 'UserID', index: 'invdate', width: 90 },
                             { name: 'RoleID', index: 'name asc, invdate', width: 100 },
                             { name: 'UpdateTime', index: 'note', width: 150, sortable: true },
                             { name: 'IsDel', index: 'note', width: 150, sortable: true },
                ],
                rowNum: 10,
                rowList: [10, 20, 30],
                pager: '#page',//表格页脚的占位符(一般是div)的id
                sortname: 'CreateTime',//初始化的时候排序的字段
                sortorder: "desc",//排序方式,可选desc,asc
                mtype: "post",//向后台请求数据的ajax的类型。可选post,get
                viewrecords: true,
                caption: "权限管理",//表格的标题名字 
            })
            $("#Tab").jqGrid('navGrid', '#page', { edit: false, add: false, del: false })
        }
        else { alert("no") }
    })
}
