var bank = angular.module('bank',['ng']);

bank.controller("userController", function($http, $scope, $timeout) {
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
  	$scope.data.accounts_empty = false;
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
	$scope.myconseilles = function(){	
	$http.get("http://localhost:3000/conseilles.json")
    .success(function(el) {	
	    	$scope.data.conseilles = $scope.data.conseilles.concat(el); 
	    	$scope.data.conseilles_empty = true;
	    }).error(function(error) {
			$scope.data.error = "error";
		});  
	};
		$scope.myepargnes = function(){	
	$http.get("http://localhost:3000/epargnes.json")
    .success(function(el) {	
    	$scope.data.epargnes = $scope.data.epargnes.concat(el); 
    	$scope.data.epargnes_empty = true;
    		}).error(function(error) {
				$scope.data.error = "error";
		});  
	};
	$scope.myaccounts = function(){	
		$scope.loading = true;
		$http({method:"GET", url:"http://localhost:3000/accounts.json", params:{json_id:account_length}})
	    .success(function(el) {	
	    	$scope.data.accounts = $scope.data.accounts.concat(el); 
	    	$scope.data.accounts_empty = true;
	    	account_length = account_length + 5;
		$timeout(function(){$scope.loading = false;},2500);
	    }).error(function(error) {
			$scope.data.error = "error";
		});  
	};

});

bank.directive('jsonviews', function($timeout) {
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
		    	templateUrl: 'app/views/_process.html'
		};
	});
bank.directive('process', function($timeout) {
	  	return { 
			    restrict: 'E',
		    	templateUrl: 'app/views/_accounts_index.html'
		};
	});
describe('test controller', function () {
 beforeEach(angular.mock.module('bank'));
    var $controller;
    beforeEach(inject(function(_$controller_, _$rootScope_,_$httpBackend_){
    	$httpBackend = _$httpBackend_;
		$rootScope = _$rootScope_;
		mockscope = $rootScope.$new();
        $controller = _$controller_;
		$controller("userController",{$scope: mockscope});
    }));
    
    afterEach(function(){
    	$httpBackend.verifyNoOutstandingExpectation();
    	$httpBackend.verifyNoOutstandingRequest();
    });

	it('should demonstrate using when (200 status)', function() {
		mockscope.myaccounts();
		$httpBackend.expect('GET', 'http://localhost:3000/accounts.json?json_id=0')
		.respond(200,{'zip': '6714080086927334'});
		
		$httpBackend.flush();
		expect(mockscope.data.accounts[0].zip).toEqual('6714080086927334');
	});
});

describe('Directive: jsonviews', function () {
  var element;

  beforeEach(function() {
  	
    // Create a new dependency injector using the 'bank' module
    angular.mock.module('bank');
	module('app/views/_accounts_index.html');
	module('app/views/_process.html');	
	
    inject(function(_$rootScope_, _$compile_,_$templateCache_,_$timeout_,_$controller_) {
      $compile = _$compile_;
      $rootScope = _$rootScope_;
      $templateCache = _$templateCache_;
      $timeout = _$timeout_;
      $controller = _$controller_;
	// Get a new scope
    $scope = $rootScope.$new();
	// Create the controller instance.
	var userController = $controller('userController', { $scope: $scope});
      
	  elm1 = '<jsonviews></jsonviews>';
	  elm2 = '<process></process>';
	  elm = elm1 + elm2;

      // Compile some HTML that uses the directive
      element = $compile(elm)($scope);

      $scope.$digest();
    });
  });

  it('should show process when clicked', function() {

	// We make use of Jasmine's createSpy functionality
	var myaccounts = spyOn($scope, 'myaccounts');
	
	var button = angular.element(element.find('div')[3]);
	var alert = element.find('span');
	
	expect(button.text()).toBe("json index");
	expect(alert.text()).toBe("PROCESSING");
	expect(alert.hasClass('ng-hide')).toBe(true);
	
	element.find('div').triggerHandler('click');	
		expect($scope.myaccounts).toHaveBeenCalled();
	
	//stub myaccountsController call effect
	$scope.$apply(function(){
		$scope.loading = true;
	});
	
	expect(alert.hasClass('ng-hide')).toBe(false);
    expect(alert.text()).toBe("PROCESSING");
  });
});
