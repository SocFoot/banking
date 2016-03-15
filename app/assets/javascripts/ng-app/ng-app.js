var bank = angular.module('bank',['ui.router','templates','ngResource']);
bank.config(['$stateProvider','$urlRouterProvider', function($stateProvider,$urlRouterProvider) {
   $stateProvider.
    state('account_dir', {
      url: '/account_dir',
      templateUrl: 'ng-app/home/_account_dir.html'
   });
     $stateProvider
    .state('home', {
      url: '/home',
      templateUrl: 'ng-app/home/_home.html'
    });
    $stateProvider
	.state('new_account', {
      url: '/accounts/new',
      templateUrl: 'ng-app/accounts/new.html'
    });
	$stateProvider
	.state('edit_account', {
    	url: '/accounts/:account_fake_id/edit',
    	templateUrl: 'ng-app/accounts/new.html'	
    });
    $stateProvider
	.state('index_account', {
    	url: '/accounts',
    	templateUrl: 'ng-app/accounts/index.html' 
    });
    $stateProvider
	.state('show_account', {
    	url: '/accounts/:account_fake_id',
    	templateUrl: 'ng-app/accounts/show.html'	
    });
    $stateProvider
	.state('new_account_modal', {
    	url: '/accounts/new',
    	templateUrl: 'partial/_new_account_modal.html'	
    });
    $stateProvider
	.state('user', {
    	url: '/users/:user_fake_id',
    	views:{
    		"": {templateUrl: 'ng-app/users/show.html'},
    		'accounts_index@user':{templateUrl: 'partial/_accounts_index.html'},
    		'users_index@user':{templateUrl: 'partial/_users_index.html'}
    	}		
    });
 }])
.factory('dataCache', function($cacheFactory) {
	return $cacheFactory('data');
}) 
.factory('Api', ['$resource', '$cacheFactory', 'dataCache', function($resource, $cacheFactory, dataCache) {
	var data = dataCache;
	return { 
		account: $resource('/accounts.json', {}, {'query': { method: 'GET', cache: true, isArray: true}}),
	  	conseille: $resource('http://localhost:3000/conseilles.json')
	};
}])
.controller("userController", function($http, $scope, $timeout, Api, $cacheFactory, dataCache) {
	var account_length = 0;
  	$scope.data = {};
  	$scope.data.users = [];
  	$scope.data.users_empty = false;
  	$scope.data.transactions = [];
  	$scope.data.transactions_empty = false;
  	$scope.data.conseilles = [];
  	$scope.data.conseilles_empty = false;
  	$scope.data.epargnes = [];
  	$scope.data.epargnes_empty = false;
  	$scope.data.accounts = [];
  	$scope.data.account = {};
  	$scope.data.accounts_empty = false;
  	$scope.view = {};
  	$scope.view.conseille = {};
  	$scope.value = "some value";
	$scope.myusers = function(){		
		$http.get("http://localhost:3000/users.json")
	    .success(function(el) {	
	    	$scope.data.users = $scope.data.users.concat(el); 
	    	$scope.data.users_empty = true;
	    }).error(function(error) {
			$scope.data.error = "error";
		});  
	};
	$scope.mytransactions = function(){	
		$http.get("http://localhost:3000/transactions.json")
	    .success(function(el) {	
        	$scope.data.transactions = $scope.data.transactions.concat(el); 
        	$scope.data.transactions_empty = true;
        }).error(function(error) {
			$scope.data.error = "error";
		});  
	};
	$scope.myconseilles = function(data_id){	
		$scope.loading = true;
		$scope.viewloading = false;
		return Api.conseille.query({json_id:account_length, data_id:data_id},
	    function(el) {	
	    	$scope.data.conseilles_empty = true;
	    	conseille_length = account_length + 5;
			$timeout(function(){$scope.loading = false;},2000);
			$scope.view.conseille.public_methods = getMethods($scope.data.conseilles);
	    },
	    function(error) {
			$scope.data.error = "error";
		}).$promise.finally(function(){
			return $scope.data.conseilles;
		});
	};
	$scope.myepargnes = function(){	
	$http.query("http://localhost:3000/epargnes.json")
    .success(function(el) {	
	    	$scope.data.epargnes = $scope.data.epargnes.concat(el); 
	    	$scope.data.epargnes_empty = true;
    	}).error(function(error) {
			$scope.data.error = "error";
		});  
	};
	$scope.myaccounts = function(data_id){	
		$scope.loading = true;
		$scope.viewloading = false;
		Api.account.query({json_id:account_length,data_id:data_id},
	    function(el) {
	    	$scope.test = $cacheFactory.get('$http').get("/accounts.json");

	    	$scope.data.accounts = $scope.data.accounts.concat(el); 
	    	$scope.data.accounts_empty = true;
	    	account_length = account_length + 5;
			$timeout(function(){$scope.loading = false;},2000);
	    },
	    function(error) {
			$scope.data.error = "error";
		});  
	};
	$scope.postaccount = function(data){	
		$scope.loading = true;
		$scope.viewloading = false;
		account = new Api.account(data);
		console.log($scope.data.account);
		account.$save();
	};
    
	function getMethods(obj) {
	  var result = [];
	  for (var attr in obj[0]) {
	  	if (typeof obj[0][attr] == "function"){
	  		
	  	}
	  	else{
	  		result.push(attr);
	  	}
	  }
	  return result;
	};
});
