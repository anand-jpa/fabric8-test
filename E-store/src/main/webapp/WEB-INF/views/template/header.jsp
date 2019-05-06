<%@page import="com.eshop.util.SessionManager" %>
<%@page import="com.eshop.model.User" %>
<nav class="navbar navbar-default" role="navigation">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			 <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
		</button> <a class="navbar-brand" href="/">Brand</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li class="active">
				<a href="<c:url value="/home"/>">Home</a>
			</li>
			<!-- <li>
				<a href="#">Products</a>
			</li>
			<li class="dropdown">
				 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Categories<strong class="caret"></strong></a>
				<ul class="dropdown-menu">
					<li>
						<a href="#">Action</a>
					</li>
					<li>
						<a href="#">Another action</a>
					</li>
					<li>
						<a href="#">Something else here</a>
					</li>
					<li class="divider">
					</li>
					<li>
						<a href="#">Separated link</a>
					</li>
					<li class="divider">
					</li>
					<li>
						<a href="#">One more separated link</a>
					</li>
				</ul>
			</li>
			-->
		</ul>
		
		<%
			User user = SessionManager.getUserFromSession(request);
		%>
		
		<ul class="nav navbar-nav navbar-right">
			<%if(user != null && user.getRole().equals("USER")) { %>
				<li class="dropdown">
					 <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=user.getName() %><strong class="caret"></strong></a>
					 <ul class="dropdown-menu">
						<li>
							<a href="#">My Account</a>
						</li>
						<li>
							<a href="#">Change Password</a>
						</li>
						<li class="divider">
						</li>
						<li>
							<a href="<c:url value="/logout"/>">Logout</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="<c:url value="/logout"/>">Logout</a>
				</li>
			<%} else { %>
				<li>
					<a id="login_url" href="<c:url value="/login" />">Login</a>
				</li>
			<%} %>
		</ul>
	</div>
</nav>