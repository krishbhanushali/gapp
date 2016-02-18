<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Edit Department</title>
	<link rel='stylesheet' href='../webjars/bootstrap/3.2.0/css/bootstrap.min.css'></link>
	<script type="text/javascript" src="../webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../webjars/jquery/2.1.1/jquery.min.js"></script>
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
				<h3>Edit Department</h3>
			</div>
			<div class='btn-group'><a href="../logout.html">Log Out</a></div>
		</div>
		<div class="row">
			<div class="col-sm-3">
				<ul class="nav nav-pills nav-stacked border">
					<li><a href="../admin/index.html">Home</a></li>
				</ul>
				<ul class="nav nav-pills nav-stacked border">
					<li class="active"><a href="../admin/department.html">Departments</a></li>
				</ul>
				<ul class="nav nav-pills nav-stacked border">
					<li><a href="../programs/index.html">Programs</a></li>
				</ul>
				<ul class="nav nav-pills nav-stacked border">
					<li><a href="../additionalFields/index.html">Additional Requirements</a></li>
				</ul>
			</div>
			<div class="col-sm-9">
				<form:form method="post" modelAttribute="department">
					<div class="form-group row">
						<label for="departmentID" class="col-sm-2 form-control-label">Department ID :</label>
						<div class="col-sm-4">
							<form:input path="departmentID" cssClass="form-control" disabled="true"/>
						</div>
					</div>
					<div class="form-group row">
						<label for="departmentName" class="col-sm-2 form-control-label">Department Name:</label>
						<div class="col-sm-4">
							<form:input path="departmentName" cssClass="form-control" required="true"/>
						</div>
					</div>
					<div class="form-group row">
					    <div class="col-sm-offset-3 col-sm-10">
					      <button type="submit" class="btn btn-primary">Save Changes</button>
					    </div>
				  	</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>