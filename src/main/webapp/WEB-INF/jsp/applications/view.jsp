<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		.assignBorder
		{
		   top: 0px;
		   margin:0px;  
		   padding: 0px 2px 2px 3px;    
		   border-width: 2px;
		   border-bottom: 2px #e9e9e9 solid;
		   width:75%;
		}
		.panel
		{
			margin-bottom:40px !important;
		}
		.navbar
		{
			margin-bottom:10px;
			margin-left:19%;
			width:46.5%;
		}
  </style>
<title>View Application</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container">
			<div class="col-sm-9">
				<div class="navbar-header">
				      <a class="navbar-brand" href="../student/index.html">Home</a>
			    </div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						
						<li class="navbar-right"><a href="../logout.html">Log Out</a></li>
						<li class="navbar-right"><a href="../applications/index.html?id=${user.userID }">Applications</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="panel panel-default col-sm-9 assignBorder">
				<div class="panel-heading">
					<strong style="font-size:16px;">Application Details</strong>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<tr>
							<th>Term :</th><td>${application.getProgram().getDept().getDepartmentName() }</td>
						</tr>
						<tr>
							<th>Program :</th><td>${application.getProgram().getProgramName()}</td>
						</tr>
						<tr>
							<th>Term :</th><td>${application.getTerm().getTermName() }</td>
						</tr>
					</table>
				</div>
			</div>
			
			<div class="panel panel-default col-sm-9 assignBorder">
				<div class="panel-heading">
				<strong style="font-size:16px;">Basic Student Information</strong>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<tr>
							<th>First Name :</th><td>${student.getUser().getFirstName() }</td>
						</tr>
						<tr>
							<th>Last Name :</th><td>${student.getUser().getLastName() }</td>
						</tr>
						<tr>
							<th>Email ID :</th><td>${student.getUser().getEmailID() }</td>
						</tr>
						<tr>
							<th>Phone Number :</th><td>${student.getPhone()}</td>
						</tr>
						<tr>
							<th>CIN :</th><td>${student.getCIN()}</td>
						</tr>
						<tr>
							<th>Date of Birth :</th><td><fmt:formatDate pattern="yyyy-MM-dd" value="${student.getDob() }"></fmt:formatDate></td>
						</tr>
						<tr>
							<th>Citizenship :</th><td>${student.getCitizenship() }</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="panel panel-default col-sm-9 assignBorder">
				<div class="panel-heading">
					<strong style="font-size:16px;">Educational Background</strong>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<tr><th>Sr. No</th><th>College Name</th><th>Degree Earned</th><th>Field of the Degree</th><th>Start Date</th><th>End Date</th></tr>
						<c:forEach items="${educationalCollege }" var="ec" varStatus="loop">
						 <tr>
						 	<td>${loop.index+1}</td>
						 	<td>${ec.getEducationCollegeName() }</td>
						 	<td>${ec.getEducationDegreeEarned() }</td>
						 	<td>${ec.getEducationFieldOfTheDegree() }</td>
						 	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ec.getEducationCollgeDegreeStartDate() }"></fmt:formatDate></td>
						 	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ec.getEducationCollegeDegreeEndDate() }"></fmt:formatDate></td>
						 </tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="panel panel-default col-sm-9 assignBorder">
				<div class="panel-heading">
					<strong style="font-size:16px;">Academic Record</strong>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<tr><th>TOEFL Score</th><th>GRE Score</th><th>GPA</th><th>Transcript</th></tr>
						<tr><td>${academicRecord.getToeflScore() }</td><td>${academicRecord.getGreScore() }</td>
							<td>${academicRecord.getGpa()}</td><td><a href="download.html?id=${student.getStudentID() }">${academicRecord.getTranscript()}</a></td>
						</tr>
					</table>
				</div>
			</div>
			<c:if test="${additionalFields!=null }">
				<div class="panel panel-default col-sm-9 assignBorder">
					<div class="panel-heading">
						<strong style="font-size:16px;">Additional Requirements</strong>
					</div>
					<div class="table-responsive">
						<table class="table table-bordered table-striped">
							<tr><th>Additional Requirement</th><th>Your submission</th></tr>
							<c:forEach items="${additionalFields }" var="af">
								<tr>
									<td>${af.getName() }</td>
									<td>
										<c:forEach items="${additionalFieldsValues }" var="afv">
												<c:if test="${afv.getAdditonalFields().getAdditionalFieldID()==af.getAdditionalFieldID() }">
													<c:choose>
														<c:when test="${af.getType()=='file' }">
															<a href="downloadRequirement.html?valueID=${afv.getAdditionalFieldsValuesId()}&studentID=${student.getStudentID()}">${afv.getValue()}</a>
														</c:when>
														<c:otherwise>
															${afv.getValue()}
														</c:otherwise>
													</c:choose>
												</c:if>
										</c:forEach>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	<%@include file="../layouts/footer.jsp" %>
</body>
</html>