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
                url: "TaskDispense.aspx?method=send",
                dataSrc: "Table1",
            },
            "columns": [
                { data: "ID", "orderable": false },
                { data: "CommandID", "orderable": false },
                { data: "NickName", "orderable": false },
                { data: "ServerName", "orderable": false },
                { data: "CommandContent", "orderable": false },
                { data: "State", "orderable": false },
                { data: "CreateTime", "orderable": false }
            ]
        })
    }
})