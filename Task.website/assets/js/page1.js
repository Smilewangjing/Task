$(function () {
    //分页加载数据
    $(".tcdPageCode").createPage({
        pageCount: 15,
        current: 1,
        backFn: function (a) {
            console.log(a);
        }
    })
    $(".PageCode").createPage({
        pageCount: 16,
        current: 1,
        backFn: function (a) {
            console.log(a);
        }
    })
})