//Module controller
bank.controller('dataController', function($scope, $parse,$element,$compile){
	$scope.getdata = function(data_name, data_model, data_id){

		$scope["my" + data_name](data_id).then(function(el){
			// Get the model
			var model = $parse(data_model);
			// Assigns a value to it
			model.assign($scope,el);
		});
	};
});