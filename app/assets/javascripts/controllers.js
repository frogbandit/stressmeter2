var reviewApp = angular.module('reviewApp', []);

reviewApp.controller('ReviewListCtrl', function ReviewListCtrl($scope) {
	$scope.reviews = [
		{'name': 'Lit Hum',
		'snippet': "great"},
		{'name': 'Science of Psych',
		'snippet': "great"},
		{'name': 'Calc 3',
		'snippet': "great"}	
	];
});