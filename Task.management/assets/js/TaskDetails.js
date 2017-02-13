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
                url: "TaskDetails.aspx?method=send",
                dataSrc: "Table1",
            },
            "columns": [
                { data: "ID", "orderable": false },
                { data: "CommandLevelID", "orderable": false },
                { data: "UserID", "orderable": false },
                { data: "ThemeID", "orderable": false },
                { data: "CommandSerialNumber", "orderable": false },
                { data: "ServerName", "orderable": false },
                { data: "CommandContent", "orderable": false },
                { data: "ValidDate", "orderable": false },
                { data: "DisableDate", "orderable": false },
                { data: "Urgent", "orderable": false },
                { data: "CommandState", "orderable": false },
                { data: "IsReview", "orderable": false },
                { data: "SendState", "orderable": false },
                { data: "IsReview", "orderable": false },
                { data: "SendState", "orderable": false },
                { data: "OrganID", "orderable": false },
                { data: "CommandEventID", "orderable": false },
                { data: "PossyURL", "orderable": false },
                { data: "IsMesage", "orderable": false },
                { data: "FeedbackCount", "orderable": false },
                { data: "CreateTime", "orderable": false },
                { data: "UpdateTime", "orderable": false },
                { data: "isDel", "orderable": false }
            ]
        })
    }
})