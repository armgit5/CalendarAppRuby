'use strict';

alert('test');
var app = angular.module('Timesheet', [])
app.controller('TimesheetCtrl', ['$scope', '$http', function($scope, $http) {
  // // console.log($scope.timeSheet.jobNo);
  // $scope.timeSheet.jobNo = "fdsa";

  $scope.deselect = function() {
    console.log($scope.jobno);
    console.log('test');
    $scope.jobno = "test123";
  }
}]);
