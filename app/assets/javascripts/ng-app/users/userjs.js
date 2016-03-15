//Partial directive 
bank.directive('user',function(){
	return {
       link: function (scope, element, attrs) {
			scope.new_account = function(){
				angular.element(document.querySelector("#accountModal")).modal('show');	
			};
        }
	};
});