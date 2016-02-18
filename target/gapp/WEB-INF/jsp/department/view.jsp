<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel='stylesheet' href='../webjars/bootstrap/3.2.0/css/bootstrap.min.css'></link>
	<script type="text/javascript" src="../webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../webjars/jquery/2.1.1/jquery.min.js"></script>
  <style>
		<style>
		.alert
		{
			padding:10px;
			
		}
  </style>
<title>View Department</title>
</head>
<body>
	<div class="container">
		<div class='btn-group btn-group-justified'>
			<div class="btn-group"></div>
			<div class='btn-group'>
				<h3>Admin ${user.firstName}! View ${department.getDepartmentName() }</h3>
			</div>
			<div class='btn-group'><a href="../logout.html">Log Out</a></div>
		</div>
		
		<div class="row">
			<div class="col-sm-3">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="../admin/index.html">Home</a></li>
				</ul>
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="../admin/department.html">Departments</a></li>
				</ul>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="../programs/index.html">Programs</a></li>
				</ul>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="../additionalFields/index.html">Additional Requirements</a></li>
				</ul>
			</div>
			<div class="col-sm-9">
				<div class="table-responsive ">
					<table class="table table-bordered table-striped">
						<tr>
							<th>Department ID </th><td>${department.getDepartmentID() }</td>
						</tr>
						<tr>
							<th>Department Name</th><td>${department.getDepartmentName() }</td>
						</tr>
						<tr>
							<th>Programs</th>
							<td>
								<c:forEach items="${programs }" var="p">
									<li><c:out value="${p.getProgramName() }"></c:out></li>	
								</c:forEach>
							</td>
						</tr>
						<tr>
							<th>Additional Requirements</th>
							<td>
								
								<c:forEach items="${additionalFields }" var="a">
									<c:forEach items="${a.getAdditionalFields()}" var="additionalField">
										<li>${additionalField.getName() }</li>
									</c:forEach>
								</c:forEach>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>