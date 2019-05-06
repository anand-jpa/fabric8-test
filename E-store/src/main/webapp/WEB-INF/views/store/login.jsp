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
	<link href="<c:url value="/resources/css/login.css"/>" rel="stylesheet" >
  </head>
  <body>
    <div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Login</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">Register</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<c:url var="postLoginUrl"  value="/login/store/" />
								<form:form id="login-form" action="${postLoginUrl}" method="post" role="form" style="display: block;"
								 commandName="user">
									<div class="form-group">
										<form:input type="text" name="name" id="name" path="name" tabindex="1" class="form-control" placeholder="Username" value=""/>
										<br/>
										<font color=red size=5><form:errors path="name"/></font>
									</div>
									<div class="form-group">
										<form:input type="password" name="password" id="password" path="password" tabindex="2" class="form-control" placeholder="Password"/>
										<br/>
										<font color=red size=5><form:errors path="password"/></font>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
											</div>
										</div>
									</div>
								</form:form>
								<c:url var="postRegisterUrl"  value="/register" />
								<form:form id="register-form" action="${postRegisterUrl}" method="post" role="form" style="display: none;" 
									commandName="registerUser">
									<div class="form-group">
										<form:input type="text" name="name" id="name" path="name" tabindex="1" class="form-control" placeholder="Username" value=""/>
									</div>
									<div class="form-group">
										<form:input type="email" name="emailAddress" id="emailAddress" path="emailAddress" tabindex="1" class="form-control" placeholder="Email Address" value=""/>
									</div>
									<div class="form-group">
										<form:input type="password" name="password" id="password" path="password" tabindex="2" class="form-control" placeholder="Password"/>
									</div>
									<div class="form-group">
										<form:input type="password" name="confirmPassword" id="confirmPassword" path="confirmPassword" tabindex="2" class="form-control" placeholder="Confirm Password"/>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
											</div>
										</div>
									</div>
								</form:form> 
							</div>
						</div>
						<div class="row" style="display: none;">
							<div class="col-md-12">
								<div class="panel panel-danger">
							        <div class="panel-heading">
							          <h3 class="text-center">
							          <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> Oops:
							          </h3>
							        </div>
							        <div class="panel-body">
							            <ul class="list-group">
							            	<li class="list-group-item"
							            		 id="name.errors" class="error">username is required!
							            	</li>
						                	<li class="list-group-item">
						                	
						                	</li>
						              	</ul>
						          	</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    
	<%@ include file="/WEB-INF/views/template/footer.jsp" %>
    <script type="text/javascript">
    
	    $(function() {
	
	        $('#login-form-link').click(function(e) {
	    		$("#login-form").delay(100).fadeIn(100);
	     		$("#register-form").fadeOut(100);
	    		$('#register-form-link').removeClass('active');
	    		$(this).addClass('active');
	    		e.preventDefault();
	    	});
	    	$('#register-form-link').click(function(e) {
	    		$("#register-form").delay(100).fadeIn(100);
	     		$("#login-form").fadeOut(100);
	    		$('#login-form-link').removeClass('active');
	    		$(this).addClass('active');
	    		e.preventDefault();
	    	});
	
	    });
	    
	    
		<%if(request.getAttribute("register")!=null){ %>	
			$(document).ready(function(){ 
			    $('#register-form-link').trigger('click');
			});
		<%} %>
    </script>
  </body>
</html>