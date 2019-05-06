<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Manage Category</title>

    <meta name="description" content="">
    <meta name="author" content="">
    
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
  </head>
  <body ng-app="addCatApp">
	
	<%@ include file="/WEB-INF/views/admin/header.jsp" %>
	
    <div class="container">
	  <h2>Manage Category</h2>
	  <ul class="nav nav-tabs" id="myTab">
        <li class="active"><a href="#sectionA">Add Category</a></li>
        <li><a href="#sectionB">Edit Category</a></li>
      </ul>
	  <div class="tab-content">
        <div id="sectionA" class="tab-pane fade in active">
            <h3>Add Category</h3>
            <form class="form-horizontal" ng-controller="validateCtrl" 
			name="addCategory" novalidate>
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="category name">Category Name:</label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="categoryName" placeholder="Category Name" name="categoryName" 
			         ng-model="category.categoryName" required>
			         <span style="color:red" ng-show="addCategory.categoryName.$dirty">
						<span ng-show="addCategory.categoryName.$error.required">Required</span>
					 </span>
			      </div>
			    </div>
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="pwd">Description:</label>
			      <div class="col-sm-10">          
			        <input type="text" class="form-control" id="description" placeholder="Enter Description....." name="description" 
			        ng-model="category.description" required>
			      	<span style="color:red" ng-show="addCategory.description.$dirty">
						<span ng-show="addCategory.description.$error.required">Required</span>
					</span>
			      </div>
			    </div>
			    <div class="form-group">        
			      <div class="col-sm-offset-2 col-sm-10">
					<p>
					<input type="submit"
					ng-disabled="addCategory.$invalid || !btnStatus" ng-click="addCatFunc()">
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
            <h3>Edit Category</h3>
            <form class="form-horizontal" ng-controller="editCtrl" 
			name="editCategory" novalidate>
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
			      <label class="control-label col-sm-2" for="category name">Category Name:</label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="editCategoryName" placeholder="Category Name" name="editCategoryName" 
			         ng-model="editCategoryName" required>
			         <span style="color:red" ng-show="editCategory.categoryName.$dirty">
						<span ng-show="editCategory.categoryName.$error.required">Required</span>
					 </span>
			      </div>
			    </div>
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="pwd">Description:</label>
			      <div class="col-sm-10">          
			        <input type="text" class="form-control" id="editDescription" placeholder="Enter Description....." name="editDescription" 
			        ng-model="editDescription" required>
			      	<span style="color:red" ng-show="editCategory.description.$dirty">
						<span ng-show="editCategory.description.$error.required">Required</span>
					</span>
			      </div>
			    </div>
			    <div class="form-group">        
			      <div class="col-sm-offset-2 col-sm-10">
					<p>
					<input type="submit"
					ng-disabled="editCategory.$invalid || !editBtnStatus" ng-click="editCatFunc()">
					</p>
			      </div>
			    </div>
			    <div class="alert alert-success" id="editSuccess" style="display:none;">
				  	<strong>Success!</strong> Category edited successfully.
				</div>
				<div class="alert alert-danger" id="editDanger" style="display:none;">
				  	<strong>Danger!</strong> Category couldn't be edited.
				</div>
			  </form>
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
		
		var app = angular.module('addCatApp', []);
		app.controller('validateCtrl', function($scope,$http, $location) {
			var path = $location.absUrl(); 
		    var pathArray = path.split('/');
		    var appContext = pathArray[3];
			
			 $scope.btnStatus = true;
			 
			 $scope.addCatFunc = function() {
				 //console.log($scope.category);
				 $http.post('/'+ appContext +"/rest/addCategory", $scope.category)
		          .then(function onSuccess(addResponse){
		            console.log("success");
		            $scope.btnStatus = true;
		            $scope.addCategory.$setPristine();
		            $scope.categoryName = '';
		            $scope.description = '';
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
		});
		
		var selectCatId = 0;
		app.controller('editCtrl', function($scope,$http,$location) {
			 var path = $location.absUrl(); 
		     var pathArray = path.split('/');
		     var appContext = pathArray[3];
			 init();
			 $scope.cats = [];
		     $scope.changeCat = function () {
		    	 selectCatId = $scope.selectedCat.id;
		    	 $scope.editCategoryName = $scope.selectedCat.categoryName;
		    	 $scope.editDescription = $scope.selectedCat.description;
		     };
		     
		     $scope.$watch('selectedCat', function(){
		    	 selectCatId = $scope.selectedCat.id;
		    	 $scope.editCategoryName = $scope.selectedCat.categoryName;
		    	 $scope.editDescription = $scope.selectedCat.description;
		     }, true);
		     
		     $scope.editCatFunc = function() {
				 var data = {};
				 data.id = selectCatId;
				 data.categoryName = $scope.editCategoryName;
				 data.description = $scope.editDescription;
		    	 
				 $http.post('/'+ appContext +"/rest/editCategory", data)
		          .then(function onSuccess(addResponse){
		            console.log("success");
		            $scope.editBtnStatus = true;
		            $scope.editCategory.$setPristine();
		            $scope.editCategoryName = '';
		            $scope.editDescription = '';
		            init();
		            $('#editSuccess').show();
		            setTimeout(function ()
	              	  {
	              		  $("#editSuccess").fadeOut("slow");
	              	  }, 2000);
		            return;
		          })
		          .catch(function onError(addResponse){
		            if (addResponse.status === 500) {
		              console.log("Failed");
		              $scope.editBtnStatus = true;
		              $('#editDanger').show();
		              setTimeout(function ()
	              	  {
	              		  $("#editDanger").fadeOut("slow");
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