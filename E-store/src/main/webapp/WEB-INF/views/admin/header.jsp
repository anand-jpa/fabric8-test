<nav class="navbar navbar-default" role="navigation">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			 <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
		</button> <a class="navbar-brand" href="#">Admin</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li class="active">
				<a href="<c:url value="/admin" />">Home</a>
			</li>
			<li>
				<a href="<c:url value="/admin/manageCategory" />">Manage Categories</a>
			</li>
			<li>
				<a href="<c:url value="/admin/manageProduct" />">Manage Products</a>
			</li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li>
				<a href="<c:url value="/admin/logout" />">Logout</a>
			</li>
		</ul>
	</div>
</nav>