var app = angular.module("AngularAppCrap", []);

function HelloWorldController($scope) { $scope.greeting = { text: 'Hello Stupid Idiot' }; }

function CartController($scope) {
	$scope.things =
	[
		{
			thingname: 'pants',
			thingcost: '25',
			thingquantity: 2
		},
		{
			thingname: 'shirt',
			thingcost: '5',
			thingquantity: 6
		},
		{
		    thingname: 'shoes',
		    thingcost: '35',
		    thingquantity: 7
		}
			];
	$scope.DeleteThisThang = function (indexXX) {
		//window.alert('I will DeleteThisThang...');
		$scope.things.splice(indexXX, 1);
	}
}
function StartUpController($scope) {
	$scope.funding = { startingEstimate: 0 };
	//$scope.funding = { endingEstimate: 1000 };
	computeNeeded = function () { $scope.funding.endingEstimate = $scope.funding.startingEstimate * 10; };
	$scope.$watch('funding.startingEstimate', computeNeeded);
}
function ImageController($scope) {
	//$scope.faveImage = 'kubota.jpg';
	$scope.faveImage = 'sharkeatingshark.jpg';
	$scope.selectImage = function (index)
	{
		$scope.faveImage = 'kubota.jpg';
		//$scope.faveImage = index;
	}
	$scope.pageRef = 'http://www.zombo.com';
}
function ShoppingController($scope, $http) {
    //window.alert('hello');
    //$http.get('/product').success(function (data, status, headers, config) { $scope.items = data; });
    $http.get('/product').success(function (data) { $scope.items = data; });
    $scope.test = 'this is a test from Angular ShoppingController';

    $scope.things =
[
    {
        title: 'santa claus',
        description: 'ho ho ho',
        price: 2
    }

];
}
//function W3SCountryController($scope, $http) {
//    window.alert('hello');
//    $http.get("http://www.w3schools.com/website/Customers_JSON.php")
//    .success(function (response) { $scope.names = response; });
//    $scope.test = 'this is a test from Angular W3SCountryController';
//}
