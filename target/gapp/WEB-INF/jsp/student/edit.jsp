<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>Add Personal Details</title>
	<script type="text/javascript" src="../resources/jquery.min.js"></script>
	<script type="text/javascript" src="../webjars/jquery/2.1.1/jquery.min.js"></script>
	<link rel='stylesheet' href='../webjars/bootstrap/3.2.0/css/bootstrap.min.css'></link>
	<script type="text/javascript" src="../webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
	<script>
    $(document).ready(function() {
        $(function() {
        	$("#dob").datepicker({dateFormat:'yy-mm-dd',changeYear:true,yearRange:'1950:2017'});
        });
    });
		
	</script>
	<style>
		.alert
		{
			padding:10px;
			
		}
		.border
		{
			-moz-box-shadow: 0 0 2px black;
		    -webkit-box-shadow: 0 0 2px black;
		    box-shadow: 0 0 4px black;
		}
		.assignBorder
		{
		   top: 0px;
		   margin:0px;  
		   padding: 0px 2px 2px 3px;    
		   border-width: 2px;
		   border-bottom: 2px #e9e9e9 solid;
		   width:75%;
		}
	</style>
</head>

<body>
	<%@include file="../layouts/header.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 assignBorder">
				<h3>Personal Details</h3>
				<div class="alert alert-warning" role="alert">
 					<strong>Alert!</strong> Fields marked with <strong style="color:red">*</strong> are required.
				</div>
				<form method="post">
					<div class="form-group row">
						<label for="CIN" class="col-sm-2 form-control-label">CIN :</label>
						<div class="col-sm-4">
							<input type="hidden" name="studentID" value="${students.studentID }"></input>
							<input name="CIN" class="form-control" value="${students.CIN }"></input>
						</div>
					</div>
					<div class="form-group row">
						<label for="phone" class="col-sm-2 form-control-label">Phone :<strong style="color:red">*</strong></label>
						<div class="col-sm-4">
							<input name="phone" value="${students.phone }" class="form-control" required></input>
						</div>
					</div>
					<div class="form-group row">
						<label for="dob" class="col-sm-2 form-control-label">Date of Birth :<strong style="color:red">*</strong></label>
						<div class="col-sm-4">
							<input type="date" id="dob" name="dob" value="${students.dob }" required class="form-control"></input>
						</div>
					</div>
					<div class="form-group row">
						<label for="citizenship" class="col-sm-2 form-control-label">Citizenship :<strong style="color:red">*</strong></label>
						<div class="col-sm-4">
							<input name="citizenship" class="form-control" value="${students.citizenship }" required></input>
						</div>
					</div>
					<div class="form-group row">
					    <div class="col-sm-10">
					      <button type="submit" class="btn btn-primary">Save and Continue to Educational Background >></button>
					    </div>
			  		</div>
				</form>
			</div>
		</div>
	</div>
	<%@include file="../layouts/footer.jsp" %>
</body>
</html>