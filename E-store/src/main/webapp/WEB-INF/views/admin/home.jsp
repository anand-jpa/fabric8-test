<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Eshop Store</title>

    <meta name="description" content="">
    <meta name="author" content="">

    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
  </head>
  <body>
  	
  	<%@ include file="/WEB-INF/views/admin/header.jsp" %>
  
 	<div class="container">
	    <div class="row">
	        <div class="col-md-6">
	            <div class="panel panel-primary">
	                <div class="panel-heading">
	                    <h3 class="panel-title">
	                        <span class="glyphicon glyphicon-bookmark"></span> Admin Dashboard</h3>
	                </div>
	                <div class="panel-body">
	                    <div class="row">
	                        <div class="col-xs-6 col-md-6">
	                          <a href="<c:url value="/admin/manageCategory" />" class="btn btn-danger btn-lg" role="button"><span class="glyphicon glyphicon-list-alt"></span> <br/>Manage Categories</a>
	                        </div>
	                        <div class="col-xs-6 col-md-6">
	                          <a href="<c:url value="/admin/manageProduct" />" class="btn btn-info btn-lg" role="button"><span class="glyphicon glyphicon-file"></span> <br/>Manage Products</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/footer.jsp" %>
	
  </body>
</html>