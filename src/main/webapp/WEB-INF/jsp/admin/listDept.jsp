
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Departments</title>
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
				<h3>Admin ${user.firstName}!</h3>
			</div>
			<div class='btn-group'><a href="../logout.html">Log Out</a></div>
		</div>
		<div class="row">
			<div class="col-sm-offset-1 col-sm-2">
				<ul class="nav nav-pills nav-stacked border">
					<li><a href="index.html">Home</a></li>
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
			<div class="col-sm-6">
				<div style="float:right;margin:5px;"><span class="glyphicon glyphicon-edit"></span> <a href="../department/create.html">Create Department</a></div>
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<tr><th>Department ID</th><th>Department Name</th><th>Number of Programs</th><th>Operation</th></tr>
						<c:forEach items="${DEPARTMENTS }" var="dept">
							<c:set var="count" value="0"></c:set>
							<tr>
								<td>
									${dept.getDepartmentID() }
								</td>
								<td>
									${dept.getDepartmentName() }
								</td>
								<c:forEach items="${PROGRAMS }" var="programs">
									<c:if test="${programs.getDept().getDepartmentID() == dept.getDepartmentID() }">
										<c:set var="count" value="${count+1 }"></c:set>
									</c:if>
								</c:forEach>
								<td>
									${count }
								</td>
								<td>
									<a href="../department/edit.html?id=${dept.getDepartmentID() }">Edit</a>
									| <a href="../department/view.html?id=${dept.getDepartmentID() }">View</a>
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