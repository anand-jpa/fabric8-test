var cartApp = angular.module('cartApp', []);
 
cartApp.controller('cartCtrl',  function ($scope, $http,$location) {
	  
	  var path = $location.absUrl(); 
      var pathArray = path.split('/');
      var appContext = pathArray[3];
	 
	
	  $scope.addToCart = function(productId) {
		  						$('.modal-backdrop').addClass(' fade in');
		  						$('.modal-backdrop').show();
		  						$('#processing-modal').show();
		  						$('#processing').show();
		  						
		  						$http.post('/'+ appContext +'/rest/cart/add/'+productId)
		  						 	 .then(function(data) {
		  						 		 	setTimeout(function(){ 
		  						 		 		$('#processing').hide();
		  						 		 		$('#closeModal').trigger('click');
		  						 		 		$('#cartSuccess').show();
		  						 		 	}, 2000);
		  						 	 	});
		  					};
	  $scope.removeFromCart = function(productId,cartId) {
			  						$http.post('/'+ appContext +'/rest/cart/remove/'+$scope.cartId+'/'+productId)
			  						 	 .then(function(data) {
			  						 		$scope.refreshCart();
			  						 	 });
			  					};
			  					
			  					
			  					$scope.refreshCart = function(){
			  					    $http.get('/'+ appContext +'/rest/cart/' + $scope.cartId).then(function (data){
			  					    	console.log(data.data);
			  					        $scope.cart = data.data;
			  					        if($scope.cart.grandTotal > 0){
			  					        	$scope.cartFull = true;
			  					        	$scope.cartEmpty = false;
			  					        } else {
			  					        	$scope.cartFull = false;
			  					        	$scope.cartEmpty = true;
			  					        }
			  					    });
			  					 };

			  					 $scope.fetchCartData = function(cartId){
			  					        $scope.cartId = cartId;
			  					        $scope.refreshCart(cartId);
			  					    };
			  					
			  					
	  });

	