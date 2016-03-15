//Module directive 
bank.directive('selectApi', function($compile){
	//create option element of select
	option = angular.element(    '<select '+
      'ng-options="conseille.id for conseille in view.select()"
      >'+'</select>');
	
	// text in option
	conseille_text = '{{output.nom}} {{output.prenom}}';
	account_text = '{{account["libelle"]}}';
	litige_text = '{{litige["identifiant"]}} {{litige.prenom}}';
	transaction_text = '{{transaction["libelle"]}} {{transaction.prenom}}';
	epargne_text = '{{epargne["llibelle"]}}';
	user_text = '{{user["nom"]}} {{user.prenom}}';
	
	function selection(scope, element, attr){		
		//load stuff
		scope["my" + attr.selectApi + "s"]();
		
		//Functions call in selectApi
		scope.view.select = function(){
			return scope.data[attr.selectApi + "s"];	
		};
		
		//Change attribute of element here
		attr.$set("name","account[" + attr.selectApi + "_id]");
		attr.$set("class","btn btn-secondary dropdown-toggle");
		attr.$set("data-toggle","dropdown");

		option.attr("value","{{output.id}}");
		option.text(eval(attr.selectApi + "_text"));

		//Done!
		element.append($compile(option)(scope));
	};	
	return {
		link: selection,
		 replace: true,
        scope: {
            ngOption : '=',
        }
	};
});