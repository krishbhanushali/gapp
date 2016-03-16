<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>Academic Records</title>
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
			width:43%;
			
		}
		.border
		{
			-moz-box-shadow: 0 0 2px black;
		    -webkit-box-shadow: 0 0 2px black;
		    box-shadow: 0 0 4px black;
		}
		.oneLine
		{
			float:left;
			text-align:right;
			clear:both;
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
		.btn-danger
		{
			float:right;
			margin-right:50%;
			margin-top:3px;
			width:20%;	
			margin-bottom:40px;
		}
		#save1
		{
			margin-left:10%;
		}
		#saveC
		{
			margin-left:10%;
			width:50%;	
		}
	</style>
</head>

<body>
	<%@include file="../layouts/header.jsp" %>
	<div class="container">
		<div class="row">	
			<div class="col-sm-9 assignBorder">
				<h3>Edit Academic Record</h3>
				<div class="alert alert-warning" role="alert">
 					<strong>Alert!</strong> Fields marked with <strong style="color:red">*</strong> are required.
				</div>
				<form method="post" enctype="multipart/form-data"> 
					<div class="form-group row">
						<label for="toeflScore" class="col-sm-3 form-control-label">TOEFL Score : <strong style="color:red">*</strong></label>
						<div class="col-sm-4">
							<input type="number" name="toeflScore" value="${academicRecord.toeflScore }" required class="form-control"></input>
						</div>
					</div>
					<div class="form-group row">
						<label for="greScore" class="col-sm-3 form-control-label">GRE Score : <strong style="color:red">*</strong></label>
						<div class="col-sm-4">
							<input type="number" name="greScore" required value="${academicRecord.greScore }" class="form-control"></input>
						</div>
					</div>
					<div class="form-group row">
						<label for="gpa" class="col-sm-3 form-control-label">GPA : <strong style="color:red">*</strong></label>
						<div class="col-sm-4">
							<input name="gpa" step="0.01" required value="${academicRecord.gpa }" class="form-control"></input>
						</div>
					</div>
					<div class="form-group row">
						<label for="transcript" class="col-sm-3 form-control-label">Transcript (pdf,docx,jpg): <strong style="color:red">*</strong></label>
						<div class="col-sm-4">
							<input type="file" name="transcript" value="${academicRecord.transcript }" <c:if test="${academicRecord.transcript eq null }">required</c:if> class="form-control"></input><strong><span class="oneLine">${academicRecord.transcript}</strong></span>
						</div>
					</div>
					<c:forEach items="${additionalFields }" var="af" varStatus="loop">
						<c:if test="${loop.index+1 == 1 }">
							<input type="hidden" name="additionalFieldID" value="${af.getAdditionalFieldID()}"/>
						</c:if>
					</c:forEach>
					<input type="hidden" name="studentID" value="${student.studentID}"/>
					<div class="form-group row">
						<div class="col-sm-10">
							<c:if test="${additionalFields=='[]' }">
						      <button id="#save1" type="submit" name="save" class="btn btn-primary">
						      		Save Application
						      </button>
						      <button type="submit" name="submit" class="btn btn-danger">
						      		Submit Application
						      </button>
						   </c:if> 
						   <c:if test="${additionalFields!='[]' }">
						   		<button id="#saveC" type="submit" class="btn btn-primary">
						   			 Save and Continue to Additional Requirements >>
						   		</button>
						   </c:if> 
					      
					    </div>
			  		</div>
				</form>
			</div>
		</div>
	</div>
	<%@include file="../layouts/footer.jsp" %>
</body>
</html>