//Module directive 
bank.directive('formResource', function($compile, $timeout){
	//create option element of select

	
	// text in option
	conseille_text = '{{output.nom}} {{output.prenom}}';
	account_text = '{{account["libelle"]}}';
	litige_text = '{{litige["identifiant"]}} {{litige.prenom}}';
	transaction_text = '{{transaction["libelle"]}} {{transaction.prenom}}';
	epargne_text = '{{epargne["llibelle"]}}';
	user_text = '{{user["nom"]}} {{user.prenom}}';
	
	function compile(scope,element){
		angular.forEach(["select", "input"], function(name){
			el = element.find(name);
			el.attr("ng-data","data.conseilles");
			el.attr("ng-views","view.form");
			//delete the copy of what have been done in the child

			delete scope["view"]["select"];
			el = $compile(el)(scope);
			el.replaceWith(el);
   		});
	};

	function selection(scope, element, attr){		

		//recompile child of form like select after adding isolated scope attributes like data 
		$timeout(function(){
			compile(scope,element);
		},200);

		//Done!
	};	
	return {
	
		link: selection,
		scope: {
			data: "=ngData",
			view: "=ngViews",
			post: "&"
		},
		controller:function($scope){
			$scope.view.form = {};
		},
	};
});