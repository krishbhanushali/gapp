<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css">
  <script src="../webjars/jquery/2.1.1/jquery.min.js"></script>
  <script src="../webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js" type="text/javascript"></script>
  <style>
		.btn-success
		{
			margin-top:5px;
		}
		.modal-content
		{
			width:120%;
			margin-left:-10%;
		}
		.form-horizontal .has-feedback .form-control-feedback
		{
			top:25px;
		}
		#yes
		{
			display:none;
			color:#008900;
		}
		#no
		{
			display:none;
			color:#FF0000;
		}
		#error
		{
			display:none;
			color:#FF0000;
		}
  </style>
  <script>
  	$(document).ready(function(){
  		$("#emailID").on('input',function(){
  			$.ajax({
  				method:"POST",
  				url:"checkEmailId.html",
  				data:{emailID:$("#emailID").val()},
  				success:function(data)
  				{
  					if(data=="0" || $("#emailID").val()==null)
					{
  						$("#yes").show();
  						$("#no").hide();
  						$("#valid").val("1");
  						$("#error").hide();
  					}
  					else
  					if(data=="1")
  					{
  						$("#error").show();
  						$("#yes").hide();
  						$("#no").show();
  						$("#valid").val("0");
  					}
  				}
  			});
  		});
  		$("#registerForm").submit(function(e){
  			console.log($("#valid").val());
  			if($("#valid").val()=="0")
  			{
  				e.preventDefault();
  				$('#emailID').effect("shake");
  				$("#error").show();
  			}
  		});
  	});
  </script>
<title>Registration</title>
</head>
<<<<<<< HEAD
	<body>	
	    <div class="modal-content">
	    	<div class="modal-body"> 
	    		<div class="control-group">
					<c:if test="${error!=null }">
						<div class="alert alert-warning">
							<strong>Error! </strong>${error }
						</div>
					</c:if>
=======
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
>>>>>>> e124028ad8f4f43b28a92d3575f417d3a7050d51
				</div>
				<form id="registerForm" class="form-horizontal" role="form" action="user/register.html" method="POST">
					<fieldset>
						<h3>Registration</h3>
						<div class="control-group">
							<label class="control-label" for="firstName">First Name :<span style="color:red">*</span></label>
							<div class="controls">
								<input type="text" class="form-control" name="firstName" placeholder="Enter first name" required/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="lastName" >Last Name :<span style="color:red">*</span></label>
							<div class="controls">
								<input type="text" class="form-control" name="lastName" placeholder="Enter Last name" required/>
							</div>
						</div>
						<div class="control-group has-feedback">
							<label class="control-label" for="emailID">Email ID :<span style="color:red">*</span></label>
							<div class="controls">
								<input id="emailID" type="email" class="form-control" name="emailID" placeholder="Enter Email ID" required/>
								<span id="yes" class="glyphicon glyphicon-ok form-control-feedback"></span>
								<span id="no" class="glyphicon glyphicon-remove form-control-feedback"></span>
								<input type="hidden" id="valid" name="valid	">
								<span id="error">Email ID is already registered. Please try another Email ID.</span>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="password">Password :<span style="color:red">*</span></label>
							<div class="controls">
								<input type="password" class="form-control" name="password" placeholder="Enter Password" required/>
							</div>
						</div>
						<div class="control-group"> 
					    	<div class="controls">
					    		<center>
					      		<button type="submit" class="btn btn-success">Register</button>
					      		</center>
					    	</div>
			 			 </div>
			 		</fieldset>
				</form>
				<div class="modal-footer">
			      <center>
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        </center>
			      </div>
			    </div>
	    	 </div>
	    </div>
	</body>
</html>