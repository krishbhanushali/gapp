<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
  
<title>Programs</title>
</head>
<body>
	<div class="container">
		<div class='btn-group btn-group-justified'>
			<div class="btn-group"></div>
			<div class='btn-group'>
				<h3>Admin ${user.firstName}!</h3>
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
				<div style="float:right;margin:5px;"><span class="glyphicon glyphicon-edit"></span> <a href="../programs/create.html">Create Program</a></div>
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<tr><th>Program Name</th><th>Department</th><th>Operation</th></tr>
						<c:forEach items="${programs }" var="program">
							<c:set var="count" value="0"></c:set>
							<tr>
								<td>
									${program.getProgramName() }
								</td>
								<td>
									${program.getDept().getDepartmentName() }
								</td>
								<td>
									<a href="delete.html?id=${program.getProgramID() }">Delete</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>