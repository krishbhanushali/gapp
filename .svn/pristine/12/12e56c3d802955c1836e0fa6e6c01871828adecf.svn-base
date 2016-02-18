<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		.border
		{
			-moz-box-shadow: 0 0 2px black;
		    -webkit-box-shadow: 0 0 2px black;
		    box-shadow: 0 0 4px black;
		}
  </style>
  
<title>Create Program</title>
</head>
<body>
	<div class="container">
		<div class='btn-group btn-group-justified'>
			<div class="btn-group"></div>
			<div class='btn-group'>
				<h3>Create Program</h3>
			</div>
			<div class='btn-group'><a href="../logout.html">Log Out</a></div>
		</div>
		<div class="row">
			<div class="col-sm-3">
				<ul class="nav nav-pills nav-stacked border">
					<li><a href="../admin/index.html">Home</a></li>
				</ul>
				<ul class="nav nav-pills nav-stacked border">
					<li><a href="../admin/department.html">Departments</a></li>
				</ul>
				<ul class="nav nav-pills nav-stacked border">
					<li class="active"><a href="../programs/index.html">Programs</a></li>
				</ul>
				<ul class="nav nav-pills nav-stacked border">
					<li><a href="../additionalFields/index.html">Additional Requirements</a></li>
				</ul>
			</div>
			<div class="col-sm-9">
				<form:form modelAttribute="programs">
				<div class="form-group row">
					<label for="programName" class="col-sm-2 form-control-label">Program Name:</label>
					<div class="col-sm-4">
						<form:input path="programName" cssClass="form-control" required="true"/>
					</div>
				</div>
				<div class="form-group row">
					<label for="departments" class="col-sm-2 form-control-label">Choose Department</label>
					<div class="col-sm-4">
					
						<form:select path="dept.departmentID" items="${allDepartments }" itemValue="departmentID" itemLabel="departmentName">
						</form:select>
					</div>
				</div>
				<div class="form-group row">
				    <div class="col-sm-10">
				      <button type="submit" class="btn btn-primary">Create Program</button>
				    </div>
			  	</div>
			</form:form>
			</div>
		</div>
	</div>
</body>
</html>