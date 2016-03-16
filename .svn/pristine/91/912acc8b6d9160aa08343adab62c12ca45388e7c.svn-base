<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>Education Details</title>
	<c:url var="home" value="/" scope="request"></c:url>
	<link rel='stylesheet' href='../webjars/bootstrap/3.2.0/css/bootstrap.min.css'></link>
	<script type="text/javascript" src="../webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../resources/jquery.min.js"></script>
	<script type="text/javascript" src="../webjars/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
	<script>
		$(document).ready(function(){
			$("#academicRecords").click(function(){
				$.get("/gapp/academicRecords/create.html",function(data){});
			});
		});
	</script>
	<style>
		.alert
		{
			padding:10px;
			width:98%;
			
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
		   width:100%;
		}
		.assignBorder1
		{
		   top: 0px;
		   margin:0px;  
		   padding: 0px 2px 2px 3px;    
		   border-width: 2px;
		   border-bottom: 2px #e9e9e9 solid;
		   width:75%;
		}
		.nextButton
		{
			float:right;
			margin-right:35%;
			margin-top:3px;
			width:40%;	
			margin-bottom:40px;
		}
		.btn-primary
		{
			margin-left:25%;
			width:20%;
		}
		.right
		{
			color:#fff;
			top:-10%;
			float:right;
			width:20%;
		}
		.glyphicon-remove
		{
			padding:3px;
			font-size:16px;
			top:3px;
		}
	</style>
</head>

<body>
	<c:set scope="session" var="number" value="0"></c:set>
	<%@include file="../layouts/header.jsp" %>
	<div class="container ">
		<div class="row">
			<div class="col-sm-9 assignBorder1">
				<h3>Educational Background</h3>
				<h3>Add new Education</h3>
				<div class="alert alert-warning" role="alert">
 					<strong>Alert!</strong> Fields marked with <strong style="color:red">*</strong> are required.
				</div>
				<div id="collegeDiv" class="assignBorder">
				<form:form method="post" modelAttribute="education" action="create.html">
					<div class="form-group row">
						<label for="educationCollegeName" class="col-sm-4 form-control-label">College Name : <strong style="color:red">*</strong></label>
						<div class="col-sm-5">
							<form:input path="educationCollegeName" required="true" cssClass="form-control"></form:input>
						</div>
					</div>
					<div class="form-group row">
						<label for="educationDegreeEarned" class="col-sm-4 form-control-label">Degree Earned : <strong style="color:red">*</strong></label>
						<div class="col-sm-5">
							<form:input path="educationDegreeEarned" required="true" cssClass="form-control"></form:input>
						</div>
					</div>
					<div class="form-group row">
						<label for="educationFieldOfTheDegree" class="col-sm-4 form-control-label">Field of the degree : <strong style="color:red">*</strong></label>
						<div class="col-sm-5">
							<form:input path="educationFieldOfTheDegree" required="true" cssClass="form-control"></form:input>
						</div>
					</div>
					<div class="form-group row">
						<label for="educationCollgeDegreeStartDate" class="col-sm-4 form-control-label">Degree Start Date (yyyy-MM-dd) : <strong style="color:red">*</strong></label>
						<div class="col-sm-5">
							<form:input cssClass="datepicker form-control" path="educationCollgeDegreeStartDate" required="true" ></form:input>
						</div>
					</div>
					<div class="form-group row">
						<label for="educationCollegeDegreeEndDate" class="col-sm-4 form-control-label">Degree End Date (yyyy-MM-dd) : <strong style="color:red">*</strong></label>
						<div class="col-sm-5">
							<form:input cssClass="datepicker form-control" path="educationCollegeDegreeEndDate" required="true"></form:input>
						</div>
					</div>
					<form:hidden path="student.studentID" value="${student.getStudentID() }"/>
					<div class="form-group row">
					    <div class="col-sm-10">
					      <button type="submit" class="btn btn-primary">Add Education</button>
					    </div>
			  		</div>
				</form:form>
				</div>
				<c:if test="${educationalCollege !=null}">
	  				<c:forEach items="${educationalCollege }" var="ec" varStatus="loop">
	  					<div class="assignBorder">
	  					<h3>Education No. <c:out value="${loop.index +1}"></c:out></h3><a class="btn btn-danger right" href="removeEducation.html?id=${ec.educationCollegeId }"><i class="glyphicon glyphicon-remove"></i>Remove Education</a>
	  					
	  					<c:set scope="session" var="number" value="${loop.index+1 }"></c:set>
	  					<form:form method="post" modelAttribute="education" action="edit.html">
							<div class="form-group row">
								<form:label path="educationCollegeName" cssClass="col-sm-3 form-control-label">College Name : <strong style="color:red">*</strong></form:label>
								<div class="col-sm-4">
									<form:hidden path="educationCollegeId" value="${ec.educationCollegeId }"></form:hidden>
									<form:input path="educationCollegeName" value="${ec.educationCollegeName }" required="true" cssClass="form-control"></form:input>
								</div>
							</div>
							<div class="form-group row">
								<form:label path="educationDegreeEarned" class="col-sm-3 form-control-label">Degree Earned : <strong style="color:red">*</strong></form:label>
								<div class="col-sm-4">
									<form:input path="educationDegreeEarned" value="${ec.educationDegreeEarned }" required="true" cssClass="form-control"></form:input>
								</div>
							</div>
							<div class="form-group row">
								<form:label path="educationFieldOfTheDegree" class="col-sm-3 form-control-label">Field of the degree : <strong style="color:red">*</strong></form:label>
								<div class="col-sm-4">
									<form:input path="educationFieldOfTheDegree" value="${ec.educationFieldOfTheDegree }" required="true" cssClass="form-control"></form:input>
								</div>
							</div>
							<div class="form-group row">
								<form:label path="educationCollgeDegreeStartDate" class="col-sm-3 form-control-label">Degree Start Date (yyyy-MM-dd) : <strong style="color:red">*</strong></form:label>
								<div class="col-sm-4">
									<fmt:formatDate value="${ec.educationCollgeDegreeStartDate}" pattern="yyyy-MM-dd" var="myDate"/>
									<form:input type="date" id="startDate" path="educationCollgeDegreeStartDate" value="${myDate}" required="true" cssClass="datepicker form-control"></form:input>
								</div>
							</div>
							<div class="form-group row">
								<form:label path="educationCollegeDegreeEndDate" class="col-sm-3 form-control-label">Degree End Date (yyyy-MM-dd): <strong style="color:red">*</strong></form:label>
								<div class="col-sm-4">
									<fmt:formatDate value="${ec.educationCollegeDegreeEndDate}" pattern="yyyy-MM-dd" var="myDate"/>
									<form:input type="date" id="endDate" path="educationCollegeDegreeEndDate" 
									value="${myDate }" required="true" cssClass="datepicker form-control"></form:input>
								</div>
							</div>
							<form:hidden path="student.studentID" value="${student.getStudentID() }"/>
							<div class="form-group row">
							    <div class="col-sm-10">
							      <button type="submit" class="btn btn-primary">Update Education</button>
							    </div>
					  		</div>
				  		</form:form>
				  		</div>
	  				</c:forEach>
			  	</c:if>
			  	<form action="redirectToAcademicRecords.html" method="POST">
			  		<input type="hidden" name="studentID" value="${student.studentID }"/>
			  		<input type="hidden" name="edit" value="${edit }">
			  		<button type="submit" id="academicRecords" class="btn btn-danger nextButton">Save and Continue to Academic Record>></button>
			  	</form>
			  	
			</div>
			
		</div>
	</div>
	<%@include file="../layouts/footer.jsp" %>
</body>
</html>