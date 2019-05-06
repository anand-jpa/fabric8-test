<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>View Product</title>

    <meta name="description" content="">
    <meta name="author" content="">
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet" >
	<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet" >
  </head>
  <body>
  	
  	<%@ include file="/WEB-INF/views/template/header.jsp" %>
	<section class="container" ng-app="cartApp">
		<div class="row">
		<div class="col-md-5">
			<img src="<c:url value="/resources/images/1.png"></c:url>" alt="image"  style = "width:100%"/>
		</div>
			<div class="col-md-5">
				<h3>${product.name}</h3>
				<p>${product.description}</p>
				<p>
					<strong>Item Code : </strong><span class="label label-warning">${product.id}</span>
				</p>
				<p>
					<strong>manufacturer</strong> : ${product.manufacturer}
				</p>
				<p>
					<strong>category</strong> : ${category.categoryName}
				</p>
				<p>
					<strong>Condition</strong> : ${product.status}
				</p>
				<p>
					<strong>Availble units in stock </strong> : ${product.unitInStock}
				</p>
				<h4>${product.price} USD</h4>
				<p ng-controller="cartCtrl">
					<a href="#" class="btn btn-warning btn-large" ng-click="addToCart('${product.id}')"> 
						<span class="glyphicon-shopping-cart glyphicon"></span> Order Now 
					</a>
					<a href="<spring:url value="/cart/view" />" class="btn btn-default">
						<span class="glyphicon-hand-right glyphicon"></span> View Cart
					</a>
				</p>
				<div class="alert alert-success" id="cartSuccess" style="display: none;">
				  	<strong>Success!</strong> Product added to cart successfully.
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/template/footer.jsp" %>
	<script src="<c:url value="/resources/js/cartController.js" />" ></script>
	<%@ include file="/WEB-INF/views/template/processing.jsp" %>
  </body>
</html>
