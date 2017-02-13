/***/
/*/ 个人中心页面的angular JS代码
/***/

//个人中心模块index-person
var app = angular.module("index-person", ["ng", "ngRoute"]);

//个人中心模块的控制器，用作数据的绑定
app.controller("personCtrl", ["$scope", "personService", function ($scope, personService) {

    //从localStorage中获取登录的用户名
    $scope.userName = localStorage.getItem('Name');
    console.log($scope.userName);

    //调用服务，获取user对应的ID等信息
    personService.getUserInformation($scope.userName, function (data) {
        //将个人信息获取到赋给information
        $scope.information = data[0];
    });

    $scope.userID = localStorage.getItem('Id');

    console.log($scope.userID);
    //查询所有任务（全部）
    personService.getAllTask($scope.userID, "all", 7, function (data) {
        $scope.datas = data;
    });

    //查询所有任务（全部）方法
    $scope.AllTask = function () {
        personService.getAllTask($scope.userID, "all", 7, function (data) {
            $scope.datas = data;
        });
    };

    //查询所有任务（今天）
    $scope.todayAllTask = function () {
        personService.getAllTask($scope.userID, "all", 1, function (data) {
            $scope.datas = data;
        });
    }

    //查询所有任务（近三天）
    $scope.threeAllTask = function () {
        personService.getAllTask($scope.userID, "all", 3, function (data) {
            $scope.datas = data;
        });
    }

    //查询未完成的（全部）
    $scope.unfinshedAllTask = function () {
        personService.getAllTask($scope.userID, "unfinshed", 7, function (data) {
            $scope.datas = data;
        });
    }

    //查询未完成的（今天）
    $scope.unfinshedTodayTask = function () {
        personService.getAllTask($scope.userID, "unfinshed", 1, function (data) {
            $scope.datas = data;
        });
    }

    //查询未完成的（近三天）
    $scope.unfinshedThreeTask = function () {
        personService.getAllTask($scope.userID, "unfinshed", 3, function (data) {
            $scope.datas = data;
        });
    }

    //查询已完成的（全部）
    $scope.finshedAllTask = function () {
        personService.getAllTask($scope.userID, "finshed", 7, function (data) {
            $scope.datas = data;
        });
    }

    //查询已完成的（今天）
    $scope.finshedTodayTask = function () {
        personService.getAllTask($scope.userID, "finshed", 1, function (data) {
            $scope.datas = data;
        });
    }

    //查询已完成的（近三天）
    $scope.finshedThreeTask = function () {
        personService.getAllTask($scope.userID, "finshed", 3, function (data) {
            $scope.datas = data;
        });
    }

}])
//服务查询的服务；
.factory("personService", ["$http", function ($http) {
    return {
        //查询任务的方法
        getAllTask: function (id, type, time, handler) {
            $http({
                method: "get",
                url: "../../receiverashx/ProcessReceiver.ashx",
                cache: false,
                params: {
                    userID: id,
                    flag: type,
                    duration: time
                }
            }).then(function (result) {
                handler(result.data);
            });
        },

        //获取用户信息
        getUserInformation: function (userName, handler) {
            $http({
                method: "get",
                url: "../../receiverashx/Login.ashx",
                cache: false,
                params: {
                    Account: userName
                }
            }).then(function (result) {
                handler(result.data);
            });
        }
    };
}])
//用于获取任务ID并保存在localStorage中的指令
.directive("setId", function () {
    return {
        restrict: "AE",
        compile: function compile() {
            return {
                post: function postLink(scope, element) {
                    element.next().click(function () {
                        var id = element.attr("class");
                        if (!id == '') {
                            localStorage.setItem("id", id);
                            $.post("../../receiverashx/TaskStateChange.ashx", {
                                state: 2,
                                id: id
                            }, function (data) {
                                console.log(data);
                            });
                            location.href = 'task.aspx';
                        } else {
                            alert("任务已失效～");
                        }                        
                    });
                }
            }
        }
    }
});
