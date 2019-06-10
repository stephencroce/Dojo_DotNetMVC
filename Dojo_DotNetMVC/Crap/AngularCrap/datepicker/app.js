var app = angular.module('myApp', ['myApp.directives']);

app.controller('MainCtrl', function($scope) {
    $scope.myText = 'Not Selected';
    $scope.currentDate = '';
    //$scope.currentDate = '12/11/2014';
    //$scope.currentDate = Date();
    $scope.updateMyText = function(date) {
    $scope.myText = 'Selected';
  };
});
