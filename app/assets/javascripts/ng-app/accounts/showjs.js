//Partial directive 
bank.directive('showaccount', function($filter,$stateParams){
	return {
    	controller: ['$scope', function($scope) {
    		$scope.account = $filter('filter')($scope.data.accounts,{fake_id:$stateParams.account_fake_id,})[0];
    	}],
    	templateUrl:"ng-app/accounts/_account.html"	
	};
});

