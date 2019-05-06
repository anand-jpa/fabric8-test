<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Cart Page</title>

    <meta name="description" content="">
    <meta name="author" content="">

    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet" >
	<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet" >
  </head>
  <body>

	<%@ include file="/WEB-INF/views/template/header.jsp" %>
	
	<div class="container" ng-app="cartApp" ng-init="fetchCartData('${cart.cartId}')" ng-controller="cartCtrl">
	    <div class="row" ng-show="cartFull">
	        <div class="col-sm-12 col-md-10 col-md-offset-1">
	            <table class="table table-hover">
	            	<input id="viewCartId" value="${cart.cartId}" type="hidden"/>
	                <thead>
	                    <tr>
	                        <th>Product</th>
	                        <th>Quantity</th>
	                        <th class="text-center">Price</th>
	                        <th class="text-center">Total</th>
	                        <th></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr ng-repeat = "cartItem in cart.cartItems">
	                        
<td class="col-sm-8 col-md-6">
                <div class="media">
                                <a class="thumbnail pull-left" href="#"> <img class="media-object" src="<c:url value="/resources/images/1.png"/>" style="width: 72px; height: 72px;"> </a>
                                <div class="media-body">
                                                <h4 class="media-heading"><a href="/eStore/product/viewProduct/{{cartItem.product.id}}">{{cartItem.product.name}}</a></h4>
                                </div>
                </div>
</td>
	                        <td class="col-sm-1 col-md-1" style="text-align: center">
	                        	<h4 class="media-heading">{{cartItem.quantity}}</h4>
	                        </td>
	                        <td class="col-sm-1 col-md-1 text-center"><strong>{{cartItem.product.price}}</strong></td>
	                        <td class="col-sm-1 col-md-1 text-center"><strong>{{cartItem.totalPrice}}</strong></td>
	                        <td class="col-sm-1 col-md-1">
	                        <button type="button" class="btn btn-danger" ng-click="removeFromCart(cartItem.product.id)">
	                            <span class="glyphicon glyphicon-remove"></span> Remove
	                        </button></td>
	                    </tr>
	                </tbody>
	                <tfoot>
	                    <tr>
	                        <td>  </td>
	                        <td>  </td>
	                        <td>  </td>
	                        <td><h3>Total</h3></td>
	                        <td class="text-right"><h3>{{cart.grandTotal}}</h3></td>
	                    </tr>
	                    <tr>
	                        <td>  </td>
	                        <td>  </td>
	                        <td>  </td>
	                        <td>
	                        	<!-- <a class="btn btn-danger pull-left" ng-click="clearCart()"> 
	                        		Clear Cart
	                        		<span class="glyphicon glyphicon-remove-sign"></span>
	                        	</a> -->
	                        </td>
	                        <td>
	                        	<a href="<spring:url value="/order/checkout/${cart.cartId}"/>" class="btn btn-success pull-right">
	                            	Checkout
	                            	<span class="glyphicon glyphicon-play"></span>
	                            </a>
	                        </td>
	                    </tr>
	                </tfoot>
	            </table>
	        </div>
	    </div>
		<div class="alert alert-danger" ng-show="cartEmpty">
		  <strong>Cart is Empty</strong>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/template/footer.jsp" %>
	<script src="<c:url value="/resources/js/cartController.js" />" ></script>
	
</html>
