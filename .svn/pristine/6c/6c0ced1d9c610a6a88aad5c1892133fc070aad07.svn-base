<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>Create Application</title>
	<c:url var="home" value="/" scope="request"></c:url>
	<link rel='stylesheet' href='../webjars/bootstrap/3.2.0/css/bootstrap.min.css'></link>
	<script type="text/javascript" src="../webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../resources/jquery.min.js"></script>
	<script type="text/javascript" src="../webjars/jquery/2.1.1/jquery.min.js"></script>
	
	<script>
		$(document).ready(function(){
			$("#selectDept").change(function(){
				$.ajax({
					method:"POST",
					headers:"Accept=application/json",
					url:"/gapp/applications/getPrograms/"+$("#selectDept :selected").val()+".html",
					success:function(data)
					{
						$("#selectProgram").html("<label for='program' class='col-sm-4 form-control-label'>Choose Program : <strong style='color:red'>*</strong></label>");
						$("#selectProgram").append("<div class='col-sm-4'>"+data);
						$("#selectProgram").append("</div>");
					}
				});
			});
			$("#applicationForm").submit(function(e){
				if($("#selectDept").val()=="0")
				{
					e.preventDefault();
					$("#deptError").html("Please select the department.")
				}
				if($("#programID").val()=="0")
				{
					e.preventDefault();
					$("#deptError").html("Please select the program.")
				}
				if($("#selectTerm").val()=="0")
				{
					e.preventDefault();
					$("#termError").html("Please select the term.")
				}
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
				<h3>Add Application Details</h3>
				<div class="alert alert-warning" role="alert">
 					<strong>Alert!</strong> Fields marked with <strong style="color:red">*</strong> are required.
				</div>
				<form:form id="applicationForm" modelAttribute="applications">
					<div class="form-group row">
						<label for="departments" class="col-sm-4 form-control-label">Choose Department : <strong style="color:red">*</strong></label>
						<div class="col-sm-4">
							<form:select cssClass="form-control" id="selectDept" path="program.dept.departmentID" items="${allDepartments }" itemValue="departmentID" itemLabel="departmentName" required="true"></form:select>
							<div id="deptError" style="color:red"></div>
						</div>
					</div>
					<div id="selectProgram" class="form-group row">
					</div>
					<div class="form-group row">
						<label for="term" class="col-sm-4 form-control-label">Choose term : <strong style="color:red">*</strong></label>
						<div class="col-sm-4">
							<form:select cssClass="form-control" id="selectTerm" path="term.termID" items="${allTerms }" itemValue="termID" itemLabel="termName" required="true"></form:select>
							<div id="termError" style="color:red"></div>
						</div>
					</div>
					<form:hidden path="student.studentID" value="${student.getStudentID() }"/>
					<form:hidden path="status.applicationID" value="6"/>
					<div class="form-group row">
					    <div class="col-sm-10">
					      <button type="submit" class="btn btn-primary">Save and Continue to Personal Details >></button>
					    </div>
			  		</div>
				</form:form>
			</div>
		</div>
	</div>
	<%@include file="../layouts/footer.jsp" %>
</body>
</html>