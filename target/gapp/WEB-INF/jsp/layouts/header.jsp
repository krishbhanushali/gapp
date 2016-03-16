<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
	<style>
		.alert
		{
			padding:10px;
			
		}
		.panel
		{
			margin-bottom:40px !important;
		}
		.navbar
		{
			margin-bottom:10px;
			margin-left:19%;
			width:46.5%;
		}
  </style>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="col-sm-9">
				<div class="navbar-inverse">
				      <a class="navbar-brand active" href="../student/index.html">Home</a>
			    </div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class=""><a href="../applications/index.html?id=${user.userID }">Applications</a></li>
						<li class=""><a href="../logout.html">Log Out</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>