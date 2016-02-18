<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Gapp</title>
	<link rel='stylesheet' href='webjars/bootstrap/3.2.0/css/bootstrap.min.css'>
	<script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
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
</head>
<body bgcolor="#D9D9D9">
	<div class="container">
		<div class="col-md-offset-6 col-md-6" >
			<h3>GAPP</h3>
		</div>
		<c:if test="${error!=null }">
			<div class="alert alert-warning col-md-offset-4 col-md-8">
				<strong>Error! </strong>${error }
			</div>
		</c:if>
		<form class="form-horizontal" role="form" action="home.html" method="POST">
			<div class="form-group">
				<label class="control-label col-md-4" for="emailID">Email ID :</label>
				<div class="col-md-8">
					<input type="email" class="form-control" name="emailID" placeholder="Enter email" required> 
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-md-4" for="password">Password :</label>
				<div class="col-md-8">
					<input type="password" class="form-control" name="password" placeholder="Enter password" required> 
				</div>
			</div>
			
			 <div class="form-group">        
			      <div class="col-md-offset-6 col-md-6">
			        <button type="submit" class="btn btn-default">Submit</button>
			      </div>
		    </div>
		</form>
		
		<div class="col-md-offset-6 col-md-6" >
			<a href="user/register.html">Register</a>
		</div>
	</div>
</body>
</html>