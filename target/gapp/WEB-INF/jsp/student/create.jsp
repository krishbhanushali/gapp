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
	</style>
</head>

<body>
	<div class="container-fluid">
		<div class='btn-group btn-group-justified'>
			<div class="btn-group"></div>
			<div class='btn-group'>
				<h3>Personal Details</h3>
			</div>
			<div class='btn-group'><a href="../logout.html">Log Out</a></div>
		</div>
		<div class="row">
			<div class="col-sm-3">
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="../applications/index.html?id=${user.userID }">Applications</a></li>
				</ul>
			</div>
			<div class="col-sm-9">
				<h3>Personal Details</h3>
				<h3>first name is : <c:out value="${user.firstName }"></c:out></h3>
				<form:form method="post" modelAttribute="students">
					<div class="form-group row">
						<label for="CIN" class="col-sm-2 form-control-label">CIN :</label>
						<div class="col-sm-4">
							<form:input path="CIN" cssClass="form-control" required="true"></form:input>
						</div>
					</div>
					<div class="form-group row">
						<label for="phone" class="col-sm-2 form-control-label">Phone :</label>
						<div class="col-sm-4">
							<form:input path="phone" cssClass="form-control" required="true"></form:input>
						</div>
					</div>
					<div class="form-group row">
						<label for="dob" class="col-sm-2 form-control-label">Date of Birth :</label>
						<div class="col-sm-4">
							<form:input type="date" id="dob" path="dob" required="true" cssClass="form-control"></form:input>
						</div>
					</div>
					<div class="form-group row">
						<label for="citizenship" class="col-sm-2 form-control-label">Citizenship :</label>
						<div class="col-sm-4">
							<form:input path="citizenship" cssClass="form-control" required="true"></form:input>
						</div>
					</div>
					
					<form:hidden path="user.userID" value="${user.userID }"/>
					<div class="form-group row">
					    <div class="col-sm-10">
					      <button type="submit" class="btn btn-primary">Educational Background >></button>
					    </div>
			  		</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>