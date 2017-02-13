$(function () {
    showData();
    $('#example').removeClass('display').addClass('table table-striped table-bordered');
    $(document).off('click');
    function showData() {
        $("#example").DataTable({
            display: "lightbox",
            dom: '<"top"i>rt<"bottom"flp><"clear">',
            searching: false,
            ording: false,
            aLengthMenu: [5, 10],
            ajax: {
                url: "TaskReply.aspx?method=send",
                dataSrc: "Table1",
            },
            "columns": [
                { data: "ID", "orderable": false },
                { data: "CommandID", "orderable": false },
                { data: "CommandContent", "orderable": false },
                { data: "ReplyUserID", "orderable": false },
                { data: "NickName", "orderable": false },
                { data: "ReplyContent", "orderable": false },
                { data: "ReplyTime", "orderable": false },
                { data: "IsDel", "orderable": false }
            ]
        })
    }
})