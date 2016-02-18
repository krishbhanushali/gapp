<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css">
  <script src="../webjars/jquery/2.1.1/jquery.min.js"></script>
  <script src="../webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <style>
		.alert
		{
			padding:10px;
			
		}
		body
		{
			background-color: #D9D9D9;
		}
  </style>
<title>Registration</title>
</head>
	<body>
		<h1>This is registration </h1>
		<div class='btn-group btn-group-justified'>
			<div class='btn-group'><a href="../home.html">Back</a></div>
			<div class='btn-group'>
				<h3>Registration</h3>
			</div>
		</div>
		<c:if test="${error!=null }">
			<div class="alert alert-warning col-md-offset-4 col-md-8">
				<strong>Error! </strong>${error }
			</div>
		</c:if>
		<div class="container">
			<form class="form-horizontal" role="form" action="register.html" method="POST">
				<div class="form-group row">
					<label class="control-label col-sm-4" for="firstName">First Name :</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="firstName" placeholder="Enter first name" required/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-4" for="lastName" >Last Name :</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="lastName" placeholder="Enter Last name" required/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-4" for="emailID">Email ID :</label>
					<div class="col-sm-8">
						<input type="email" class="form-control" name="emailID" placeholder="Enter Email ID" required/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-4" for="password">Password :</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" name="password" placeholder="Enter Password" required/>
					</div>
				</div>
				<div class="form-group"> 
			    	<div class="col-sm-offset-4 col-sm-8">
			      		<button type="submit" class="btn btn-default">Register</button>
			    	</div>
	 			 </div>
			</form>
		</div>
	</body>
</html>