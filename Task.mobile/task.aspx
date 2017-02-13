<%@ Page Title="任务详情页" Language="C#" MasterPageFile="~/master/main-drawer.master" AutoEventWireup="true" CodeFile="task.aspx.cs" Inherits="task" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <script>
       //$.post("receiverashx/TaskDetail.ashx", {
       //    id:3
       //}, function (datas) {
       //    console.log(datas);
       //})
       var app = angular.module("app", ["ng", "ngRoute"]);
       app.controller("threeCtrl", ["$scope", "idService", function ($scope, idService) {
           $scope.Id = localStorage.getItem("Id");
           console.log($scope.Id)
           $scope.id = localStorage.getItem("id");
           console.log($scope.id);
           $scope.ids = localStorage.getItem("ids");
           console.log($scope.ids);
           idService.getAllId(function (datas) {
               //获取全部
               datas.Table1.forEach(function (item) {
                   $scope.item = item;
                   console.log(item);
               })
           }, $scope.id);
           $scope.getAccept = function () {
               idService.getState(function (datas) {
                   if (datas == "true") {
                       $(".btn").addClass("disabled").empty().html("已接收");
                       $.ajax({
                           url: "receiverashx/TaskStateChange.ashx",
                           async: false,
                           data: {
                               "id": $scope.ids,
                               "state":3
                           }
                       }, function (datas) {
                           console.log(datas);
                       })
                   }
               }, $scope.ids);

           };
       }])
           app.factory("idService", ["$http", function ($http) {
               return {
                   getAllId: function (handler,id) {
                       //$http.get("192.168.2.226:8083/receiverashx/ProcessReceiver.ashx")
                       $http({
                           method: "get",
                           url: "receiverashx/TaskDetail.ashx",
                           params: {
                               "id": id
                           }
                       }).then(function (result) {
                           handler(result.data);
                       });
                   },
                   getState: function (handler, ids) {
                       $http({
                           method: "get",
                           url: "receiverashx/TaskStateChange.ashx",
                           params: {
                               "id": ids
                           }
                       }).then(function (result) {
                           handler(result.data);
                       });
                   }
               };
           }])
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <%--<inmost:Navbarsub ID="Navbarsub1" runat="server" />--%>

    <div class="container" ng-app="app" ng-controller="threeCtrl">
        <div class="row one">  
            <div class=" margin-bottom-0 border-none  inmost-tools min-height-40">
                <div class="media-one text-center">
                    <a href="#"><img src="assets/images/user.png" /></a>
                </div>
                <div class="media">
                    <div class="media-body">
                        <h5>发布人：{{item.ServerName}} <i>| </i><span> 发布时间：{{item.CreateTime}}</span></h5>
                        <p style="text-indent:2em">任务详情：{{item.CommandContent}}<span class="directive-url"><a href="#">{{item.PossyURL}}</a></span></p>
                        <div class="media-body-date"><h5 class="pull-right">完成日期：{{item.DisableDate}}</h5></div>
                        <div class="media-body-submit"><a class="btn" ng-click="getAccept()">接收</a></div>
                    </div>
                </div>
            </div>
        </div> 
    </div>
</asp:Content>



