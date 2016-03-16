<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>GAPP Login</title>
	<script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
	<link rel='stylesheet' href='webjars/bootstrap/3.2.0/css/bootstrap.min.css'>
	<script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
	<style>
		.alert
		{
			padding:10px;
			
		}
		.form-signin
		{
		    max-width: 330px;
		    padding: 15px;
		    margin: 0 auto;
		}
		.form-signin .form-signin-heading, .form-signin .checkbox
		{
		    margin-bottom: 10px;
		}
		.form-signin .checkbox
		{
		    font-weight: normal;
		}
		.form-signin .form-control
		{
		    position: relative;
		    font-size: 16px;
		    height: auto;
		    padding: 10px;
		    -webkit-box-sizing: border-box;
		    -moz-box-sizing: border-box;
		    box-sizing: border-box;
		}
		.form-signin .form-control:focus
		{
		    z-index: 2;
		}
		.form-signin input[type="text"]
		{
		    margin-bottom: -1px;
		    border-bottom-left-radius: 0;
		    border-bottom-right-radius: 0;
		}
		.form-signin input[type="password"]
		{
		    margin-bottom: 10px;
		    border-top-left-radius: 0;
		    border-top-right-radius: 0;
		}
		.account-wall
		{
		    margin-top: 20px;
		    padding: 40px 0px 20px 0px;
		    background-color: #f7f7f7;
		    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
		    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
		    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
		}
		.login-title
		{
		    color: #555;
		    font-size: 18px;
		    font-weight: 400;
		    display: block;
		}
		.profile-img
		{
		    width: 96px;
		    height: 96px;
		    margin: 0 auto 10px;
		    display: block;
		    -moz-border-radius: 50%;
		    -webkit-border-radius: 50%;
		    border-radius: 50%;
		}
		.need-help
		{
		    margin-top: 10px;
		}
		.new-account
		{
		    display: block;
		    margin-top: 10px;
		}
		.styling
		{
			margin-top:5px;
			margin-left:34%;
		}
		.prettyline {
		  height: 5px;
		  border-top: 0;
		  background: #c4e17f;
		  border-radius: 5px;
		  background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
		  background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
		  background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
		  background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
		}
		body
		{
			background-color: #D9D9D9;
		}
		.modal-content
		{
			width:120%;
			margin-left:-10%;
		}
	</style>
</head>
<body>
	<div class="container">
		
		 <div class="row">
		 	<hr class="prettyline">
	        <div class="col-sm-6 col-md-4 col-md-offset-4">
	            <h1 class="text-center login-title">Sign in to GAPP</h1>
	            <div class="account-wall">
	                <img class="profile-img" src="/gapp/CSULA.png"
	                    alt="">
	                <form class="form-signin" role="form" action="home.html" method="POST">
	                	<c:if test="${error!=null }">
								<div class="alert alert-warning">
									<strong>Error! </strong>${error }
								</div>
							</c:if>
		                <input type="email" class="form-control" name="emailID" placeholder="Enter email" required>
		                <input type="password" class="form-control" name="password" placeholder="Enter password" required>
		                <button class="btn btn-lg btn-primary btn-block" type="submit">
		                    Sign in</button>
	                </form>
	            </div>
	            <button class="btn btn-primary btn-lg styling" href="user/register.html" data-toggle="modal" data-target=".bs-modal-sm"  class="text-center new-account">Register </button>
	        </div>
	        
   		 </div>
   		 <hr class="prettyline">
    </div>
    <div class="modal fade bs-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		    	<div class="modal-body">
					<form class="form-horizontal" role="form" action="register.html" method="POST">
						<fieldset>
							
							<div class="control-group">
								<label class="control-label" for="firstName">First Name :</label>
								<div class="controls">
									<input type="text" class="form-control" name="firstName" placeholder="Enter first name" required/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="lastName" >Last Name :</label>
								<div class="controls">
									<input type="text" class="form-control" name="lastName" placeholder="Enter Last name" required/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="emailID">Email ID :</label>
								<div class="controls">
									<input type="email" class="form-control" name="emailID" placeholder="Enter Email ID" required/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label col-sm-4" for="password">Password :</label>
								<div class="controls">
									<input type="password" class="form-control" name="password" placeholder="Enter Password" required/>
								</div>
							</div>
							<div class="control-group"> 
						    	<div class="controls">
						      		<button type="submit" class="btn btn-success">Register</button>
						    	</div>
				 			 </div>
				 		</fieldset>
					</form>
		    	</div>
		    </div>
	    </div>
    </div>
</body>
</html>