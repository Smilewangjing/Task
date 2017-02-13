var url = window.location.href;
var index = url.substring(url.lastIndexOf('?') + 1);
console.log(index);
var app = angular.module("Menu", ["ng", "ngRoute"]);
app.controller("twoCtrl", ["$scope", "MenuService", function ($scope, MenuService) {
    $scope.title = "123";
    MenuService.getMenu(function (datas) {
        //获取全部
        $scope.datas = datas;
        console.log(datas);
    });
}]).factory("MenuService", function ($http) {
    return {
        getMenu: function (handler) {
            //$http.get("192.168.2.226:8083/receiverashx/ProcessReceiver.ashx")
            $http({
                method: "get",
                url: "../../ashx/Login.ashx",
                cache: false,
                params: {
                    "account": index
                }
            }).then(function (result) {
                handler(result.data);
            });
        }
    }
})