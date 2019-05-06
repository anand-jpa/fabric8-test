<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Admin Login</title>

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
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<c:url var="postLoginUrl"  value="/login/admin/" />
								<form:form id="login-form" action="${postLoginUrl}" method="post" role="form" style="display: block;"
								 commandName="user">
									<div class="form-group">
										<form:input type="text" name="name" id="name" path="name" tabindex="1" class="form-control" placeholder="Username 1" value=""/>
										<font color=red size=5><form:errors path="name"/></font>
									</div>
									<div class="form-group">
										<form:input type="password" name="password" id="password" path="password" tabindex="2" class="form-control" placeholder="Password"/>
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
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    
	<%@ include file="/WEB-INF/views/admin/footer.jsp" %>
    <script type="text/javascript">
	    $(function() {
	
	        $('#login-form-link').click(function(e) {
	    		$("#login-form").delay(100).fadeIn(100);
	     		$("#register-form").fadeOut(100);
	    		$('#register-form-link').removeClass('active');
	    		$(this).addClass('active');
	    		e.preventDefault();
	    	});
	
	    });
    </script>
  </body>
</html>