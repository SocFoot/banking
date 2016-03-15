//Partial directive 
bank.directive('formaccount', function($filter,$stateParams){
	function new_edit_form(scope, element, attrs){
		//= if edit put content by looking in fake_id in if not data.account empty
		scope.$watch('data.accounts',function() {   
			scope.data.account = $filter('filter')(scope.data.accounts,{fake_id:$stateParams.account_fake_id})[0];
		});
	}
	return {
		link: new_edit_form,
    	templateUrl:"ng-app/accounts/_form.html",
	};
});