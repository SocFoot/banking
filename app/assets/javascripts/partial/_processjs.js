bank.directive('process', function($timeout,$templateCache) {
	function refreshAccount(scope, element, attrs){	
		scope.$watch('loading',function() {     
			if (scope.loading == true) {
				scope.viewloading = true;
			}
			else{
				scope.viewloading = false;	
			}
		});
	}
  	return { 
		    restrict: 'E',
	    	link: refreshAccount,
	    	templateUrl:"partial/_process.html"
	};
});

