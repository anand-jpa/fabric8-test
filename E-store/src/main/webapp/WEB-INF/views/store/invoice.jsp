<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Invoice</title>

    <meta name="description" content="">
    <meta name="author" content="">
	<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet" >
	<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet" >
  </head>
  <body>
  	
  	<%@ include file="/WEB-INF/views/template/header.jsp" %>
	
	<div class="container">
	    <div class="row">
	    	<div class="col-md-12">
	    		<div class="panel panel-default">
	    			<div class="panel-heading">
	    				<h3 class="panel-title"><strong>Order Id : ${order.orderGenId} placed on ${order.date }</strong></h3>
	    			</div>
	    			<div class="panel-body">
	    				<div class="table-responsive">
	    					<table class="table table-condensed">
	    						<thead>
	                                <tr>
	        							<td><strong>Product</strong></td>
	        							<td class="text-center"><strong>Quantity</strong></td>
	        							<td class="text-center"><strong>Price</strong></td>
	                                </tr>
	    						</thead>
	    						<tbody>
	    							<c:forEach var="cartItem" items="${cart.cartItems}">
	    							<tr>
	    								<td class="col-md-3">
	    								    <div class="media">
	    								         <a class="thumbnail pull-left" href="#"> 
	    								         	<img class="media-object" src="" style="width: 72px; height: 72px;"> 
	    								         </a>
	    								         <div class="media-body">
	    								             <h4 class="media-heading">${cartItem.product.name}</h4>
	    								             <h5 class="media-heading"><small>Unit Price:<span>${cartItem.product.price}</span></small></h5>
	    								         </div>
	    								    </div>
	    								</td>
	    								<td class="text-center">${cartItem.quantity}</td>
	    								<td class="text-center">${cartItem.totalPrice}</td>
	    							</tr>
	    							</c:forEach>
	    						</tbody>
	    					</table>
	    				</div>
	    			</div>
	    		</div>
	    	</div>
	    </div>
	    
	    <div class="row">
	         <div class="col-md-12">
	            <div class="col-md-4">
	            	<h3 class="text-center">Order Summary</h3><hr>
	            	<div class="pull-left"><h4>Order Total</h4> </div>
	            	<div class="pull-right"><h4 class="text-right">$ ${cart.grandTotal}</h4></div>
	            	<div class="clearfix"></div>
	        	</div>
	        	<div class="col-md-4 offset-md-1">
	            	<h3 class="text-center">Payment Type</h3><hr>
	            	<div class="text-center">
	            	    <strong>Paid by ${payment.cardType}</strong><br>
	            	 </div>
	        	</div>
	        	<div class="col-md-4 offset-md-2">
	            	<h3 class="text-center">Address</h3><hr>
	            	<address>
	            	    <strong>${user.name}:</strong><br>
	            	    ${address.streetName }<br>
	            	    ${address.city }<br>
	            	    ${address.state }<br>
	            	    ${address.city }<br>
	            	    ${address.country } - ${address.zipCode}
	            	    <br>
	            	    ${address.phoneNumber}
	            	 </address>
	        	</div>
	    	</div>
	    </div>
	</div>
	
	<%@ include file="/WEB-INF/views/template/footer.jsp" %>
  </body>
</html>