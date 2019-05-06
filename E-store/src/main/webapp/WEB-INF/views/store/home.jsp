<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Eshop Store</title>

    <meta name="description" content="">
    <meta name="author" content="">
	<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet" >
	<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet" >
  </head>
  <body>
  	
  	<%@ include file="/WEB-INF/views/template/header.jsp" %>
  	
    <div class="container-fluid">
		<div class="row" style="margin-bottom: 20px;">
			<div class="col-md-12">
				
				<div class="carousel slide" id="carousel-203029">
					<ol class="carousel-indicators">
						<li class="active" data-slide-to="0" data-target="#carousel-203029">
						</li>
						<li data-slide-to="1" data-target="#carousel-203029">
						</li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
						
							<img alt="Carousel Bootstrap First" src="<c:url value="/resources/images/sports1-carousel.jpg"/>">
							<div class="carousel-caption">
								<h4>
									KINGS OF THE MOUNTAIN BIKES AND BICYCLES .. Fujitsu Application Automation
								</h4>
								<p>
									...mountain bike wheels have dominated the sport since their introduction
								</p>
							</div>
						</div>
						<div class="item">
							<img alt="Carousel Bootstrap Second" src="<c:url value="/resources/images/sports-carousel.jpg" /> " >
							<div class="carousel-caption">
								<h4>
									Surfer of Seas
								</h4>
								<p>
									...top of the line, custom made soft top surface surfboards
								</p>
							</div>
						</div>
					</div> <a class="left carousel-control" href="#carousel-203029" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-203029" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
			</div>
		</div>
		<div class="row">
			
			<c:forEach items="${products}" var="product">
                <div class="col-sm-12 col-xs-12 col-md-4 col-lg-3">
					<div class="thumbnail bootsnipp-thumb">
						<div class="box box-element" style="display: block; position: relative; opacity: 1; left: 0px; top: 0px;">
							<div class="view col-lg-6">
								<img alt="Image Preview" src="<c:url value="/resources/images/1.png"/>" class="img-rounded">
							</div>
							<div class="view col-lg-6">
								<h2>
									${product.name}
								</h2>
								<h3>
									USD ${product.price}
								</h3>
								<p>
									<a class="btn" href="<c:url value="/product/viewProduct/${product.id}" />">View details </a>
								</p>
							</div>
						</div>
						<!-- 
						<div class="btn-group" style="margin-top: 7px;">
							<button class="btn btn-default" type="button">
								<em class="glyphicon glyphicon-shopping-cart"></em> Add to Cart
							</button> 
							<button class="btn btn-default" type="button">
								<em class="glyphicon glyphicon-flash"></em> Buy Now
							</button>
						</div>
						 -->
					</div>
				</div>
            </c:forEach>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/template/footer.jsp" %>
  </body>
</html>