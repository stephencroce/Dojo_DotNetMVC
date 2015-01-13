var appModule = angular.module('stupidapp', []);

//NOTE*** check out how the dashes translate from view to model....

//appModule.directive('ngbkFocusdTestWhatTheHell', function () { return { link: function (scope, element, attrs, //controller) { element[0].focus(); } }; });

appModule.directive('thisCamelCaseDirectiveIsForcingThisButtonToHaveTheFocus', function () {
    window.alert('ouch');
    return {
        link: function (scope, element) {
            element[0].focus();
        }
    };
});



function SomeController($scope) {
    $scope.message = { text: 'nothing clicked yet' };
    $scope.clickUnfocused = function () { $scope.message.text = 'unfocused button clicked'; };
    $scope.clickFocused = function () { $scope.message.text = 'focus button clicked' };
}
function FormValidController($scope) {
    //$scope.message = 'nothing to see here';    this doesn't look necessary.
    //$scope.message = '';
      $scope.addUser = function () {    
          // TODO for the reader: actually save user to database...    
          $scope.message2 = 'Thanks, ' + $scope.user.first + ', we added you!'; 
      };
}