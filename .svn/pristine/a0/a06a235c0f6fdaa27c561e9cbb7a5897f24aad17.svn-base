<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Create Additional Requirement</title>
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
				<h3>Create Additional Requirement</h3>
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
					<li><a href="../programs/index.html">Programs</a></li>
				</ul>
				<ul class="nav nav-pills nav-stacked border">
					<li class="active"><a href="../additionalFields/index.html">Additional Requirements</a></li>
				</ul>
			</div>
			<div class="col-sm-9">
				<form method="post" action="create.html">
					<div class="form-group row">
						<label for="name" class="col-sm-4 form-control-label">Additional Fields Name:</label>
						<div class="col-sm-5">
							<input type="text" name="name" class="form-control" required/>
						</div>
					</div>
					<div class="form-group row">
						<label for="required" class="col-sm-4 form-control-label">Required:</label>
						<div class="col-sm-5">
							<input type="radio" class="input-group" value="true" name="required" required>Yes <br/>
							<input type="radio" class="input-group" value="false" name="required" required>No <br/>
						</div>
					</div>
					<div class="form-group row">
						<label for="required" class="col-sm-4 form-control-label">Choose type :</label>
						<div class="col-sm-5">
							<select class="form-control" name="type" required>
								<option value="">Select type...</option>
								<option value="string">String</option>
								<option value="integer">Integer</option>
								<option value="file">File</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label for="departments" class="col-sm-4 form-control-label">Choose Department (You can choose multiple) :</label>
						<div class="col-sm-5">
							<select class="form-control" name="departments" required multiple>
								<c:forEach items="${allDepartments }" var="ad">
									<option value="${ad.getDepartmentID() }"><c:out value="${ad.getDepartmentName()}"/></option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group row">
					    <div class="col-sm-10">
					      <button type="submit" class="btn btn-primary">Create Additional Requirement</button>
					    </div>
				  	</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>