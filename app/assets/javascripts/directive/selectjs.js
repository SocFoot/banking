//Module directive 
bank.directive('selectResource', function(){
	// define view select variable object
	function Select () {
		this.name = "";
		this.data_id_code = "";			
	}
	//create option element of select
	function selection(scope, element, attr, formResourceCtrl){		
		select = new Select;
		select.name = attr.selectResource;
		
		//set element template
		option = element.find('option');

		//Change attribute of element here
		element.attr('id', select.name + "_id");
		element.attr('name', select.name);
		element.attr("class","btn btn-secondary dropdown-toggle");
		element.attr("data-toggle","dropdown");

		optgroup = element.find('optgroup');
		optgroup.attr('label', select.name);

		//Done!
	};	
	return {
		scope: {
			ngModel: "=",
			//=ng data is define if exist in formResource in compile if not, there is no ng data
			view: "=ngViews",		
			content: "=ngData",
			getdata:"&"
		},
		link: selection,
		templateUrl: "directive/_select.html",
		controller:function($scope){		
			select = new Select;
			$scope.view.select = select;
			$scope.getdata({data_name :'conseilles', data_model: 'data.conseilles', data_id:$scope.view.select.data_id_code});

		}
	};
});