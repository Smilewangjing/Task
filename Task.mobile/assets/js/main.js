
angular.module("app", ["ng", "ngRoute", "app.index"])
       //核心模块控制器
       .controller("mainCtrl", ["$scope", function ($scope) {

       }])
       //路由器的配置
       .config(["$routeProvider", function ($routeProvider) {
           $routeProvider.when("/index-task/a/:a/b/:b", {
               templateUrl: "../../index-task.aspx",
               controller: "mainController"
           })
       }]);