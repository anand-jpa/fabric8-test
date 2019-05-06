<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Manage Product</title>

    <meta name="description" content="">
    <meta name="author" content="">

    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
  </head>
  <body ng-app="addProApp">
	
	<%@ include file="/WEB-INF/views/admin/header.jsp" %>
	
    <div class="container">
	  <h2>Manage Product</h2>
	  <ul class="nav nav-tabs" id="myTab">
        <li class="active"><a href="#sectionA">Add Product</a></li>
        <li><a href="#sectionB">Edit Product</a></li>
      </ul>
	  <div class="tab-content">
        <div id="sectionA" class="tab-pane fade in active">
            <h3>Add Product</h3>
            <form class="form-horizontal" ng-controller="validateCtrl" 
			name="addProduct" id="addProduct" novalidate>
				
				<div class="form-group">
			      <label class="control-label col-sm-2" for="category name">Choose Category Name:</label>
			      <div class="col-sm-10">
			      
			      	<select ng-model="selectedCat" ng-options="x.categoryName for x in cats" 
			      		class="form-control">
						<option value="" class="" selected="selected">Select</option>
					</select>
			      </div>
			    </div>
				
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="category name">Product Name:</label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="productName" placeholder="Enter Product Name" name="productName" 
			         ng-model="product.name" required>
			         <span style="color:red" ng-show="addProduct.productName.$dirty">
						<span ng-show="addProduct.productName.$error.required">Required</span>
					 </span>
			      </div>
			    </div>
			    
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="category name">Price:</label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="price" placeholder="Enter Price" name="price" 
			         ng-model="product.price" required>
			         <span style="color:red" ng-show="addProduct.price.$dirty">
						<span ng-show="addProduct.price.$error.required">Required</span>
					 </span>
			      </div>
			    </div>
			    
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="category name">Description:</label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="description" placeholder="Enter Description" name="description" 
			         ng-model="product.productDescription" required>
			         <span style="color:red" ng-show="addProduct.description.$dirty">
						<span ng-show="addProduct.description.$error.required">Required</span>
					 </span>
			      </div>
			    </div>	
			    
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="category name">Manufacturer:</label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="manufacturer" placeholder="Enter Manufacturer" name="manufacturer" 
			         ng-model="product.productManufacturer" required>
			         <span style="color:red" ng-show="addProduct.manufacturer.$dirty">
						<span ng-show="addProduct.manufacturer.$error.required">Required</span>
					 </span>
			      </div>
			    </div>		    
			    
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="category name">Status:</label>
			      <div class="col-sm-10">
					 <input type="radio" name="status" value="true" ng-model="product.productStatus"> Enable<br>
  					 <input type="radio" name="status" value="false" ng-model="product.productStatus"> Disable<br>
			         <span style="color:red" ng-show="addProduct.status.$dirty">
						<span ng-show="addProduct.status.$error.required">Required</span>
					 </span>
					 
			      </div>
			    </div>
			    
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="category name">Stock:</label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="stock" placeholder="Enter Stock" name="stock" 
			         ng-model="product.unitInStock" required>
			         <span style="color:red" ng-show="addProduct.stock.$dirty">
						<span ng-show="addProduct.stock.$error.required">Required</span>
					 </span>
			      </div>
			    </div>	
			    
			    <div class="form-group">
	                <label class="control-label col-sm-2" for="productImage">Upload Picture</label>
	                <!-- <input id="productImage" path="productImage" ng-model="product.productImage" type="file" class="form:input-large" /> -->
	                <input type="file" demo-file-model="myFile" class="form-control" id="productImage" path="productImage" ng-model="product.productImage"/>
	            </div>		    
			    
			    <div class="form-group">        
			      <div class="col-sm-offset-2 col-sm-10">
					<p>
					<input type="submit"
					ng-disabled="addProduct.$invalid || !btnStatus" ng-click="addProFunc()">
					</p>
			      </div>
			    </div>
			    
			    <div class="alert alert-success" id="addSuccess" style="display:none;">
				  	<strong>Success!</strong> Category added successfully.
				</div>
				<div class="alert alert-danger" id="addDanger" style="display:none;">
				  	<strong>Danger!</strong> Category couldn't be added.
				</div>
			  </form>
        </div>
        
        <div id="sectionB" class="tab-pane fade">
            <h3>Edit Product</h3>
        </div>
      </div>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/footer.jsp" %>
	
    <script type="text/javascript">
		$(document).ready(function(){ 
		    $("#myTab a").click(function(e){
		    	e.preventDefault();
		    	$(this).tab('show');
		    });
		});
		
		var app = angular.module('addProApp', []);
		
		/*
	     A directive to enable two way binding of file field
	     */
	    app.directive('demoFileModel', function ($parse) {
	        return {
	            restrict: 'A', //the directive can be used as an attribute only

	            /*
	             link is a function that defines functionality of directive
	             scope: scope associated with the element
	             element: element on which this directive used
	             attrs: key value pair of element attributes
	             */
	            link: function (scope, element, attrs) {
	                var model = $parse(attrs.demoFileModel),
	                    modelSetter = model.assign; //define a setter for demoFileModel

	                //Bind change event on the element
	                element.bind('change', function () {
	                    //Call apply on scope, it checks for value changes and reflect them on UI
	                    scope.$apply(function () {
	                        //set the model value
	                        modelSetter(scope, element[0].files[0]);
	                    });
	                });
	            }
	        };
	    });
		
		
		app.controller('validateCtrl', function($scope,$http,$location) {
			var path = $location.absUrl(); 
		    var pathArray = path.split('/');
		    var appContext = pathArray[3];
			
			 init();
			
			 $scope.btnStatus = true;
			 
			 $scope.addProFunc = function() {
				 			 
				 var data = $scope.product;
				 data.categoryId = $scope.selectedCat.id;
				 console.log(data);
				 $http.post('/'+ appContext +"/rest/addProduct", data)
		          .then(function onSuccess(addResponse){
		            console.log("success");
		            $scope.btnStatus = true;
		            $scope.addProduct.$setPristine();
		            $('#addSuccess').show();
		            setTimeout(function ()
            		{
            		    $("#addSuccess").fadeOut("slow");
            		}, 2000);
		            return;
		          })
		          .catch(function onError(addResponse){
		            if (addResponse.status === 500) {
		              console.log("Failed");
		              $scope.btnStatus = true;
		              $('#addDanger').show();
		              setTimeout(function ()
	              	  {
	              		  $("#addDanger").fadeOut("slow");
	              	  }, 2000);
		              return;
		            } 
		          });
			 }
			 
			 function init() {
		    	 selectCatId = 0;
		    	 $scope.editBtnStatus = true;
				 $http.get('/'+ appContext +"/rest/categoriesList")
		          .then(function onSuccess(sailsResponse){
		        	  $scope.cats = sailsResponse.data;
		          });
			 }
		});
	</script>
  </body>
</html>