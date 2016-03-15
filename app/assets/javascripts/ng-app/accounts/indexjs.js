//Partial directive 
bank.directive('accountsindex', function(){
	return {
		restrict: 'E',
    	templateUrl:"partial/_accounts_index.html"
	};
});
