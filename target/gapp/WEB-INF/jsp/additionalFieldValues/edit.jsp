<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>Edit Additional Requirements</title>
	<script type="text/javascript" src="../resources/jquery.min.js"></script>
	<script type="text/javascript" src="../webjars/jquery/2.1.1/jquery.min.js"></script>
	<link rel='stylesheet' href='../webjars/bootstrap/3.2.0/css/bootstrap.min.css'></link>
	<script type="text/javascript" src="../webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
	<style>
		.alert
		{
			padding:10px;
			width:102%;
			
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
			margin-left:20%;
		}
		#saveC
		{
			margin-left:10%;
			width:50%;	
		}
		.col-sm-5
		{
			width:66.667%;
		}
	</style>
</head>

<body>
	<%@include file="../layouts/header.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 assignBorder">
				<h3>Edit Additional Requirements</h3>
				<div class="alert alert-warning" role="alert">
 					<strong>Alert!</strong> Fields marked with <strong style="color:red">*</strong> are required.
				</div>
				<c:set var="length" value="${additionalFields.size() }"></c:set>
				<form:form method="post" modelAttribute="additionalFieldValues" enctype="multipart/form-data"> 
					<c:forEach items="${additionalFields}" varStatus="status" var="additionalField">
						<div class="form-group row">
							<c:forEach items="${additionalFieldValues }" var="afv">
							<label for="value" class="col-sm-4 form-control-label">${additionalField.getName() } <c:if test="${additionalField.isRequired()==true }"><strong style="color:red">*</strong></c:if></label>
							<div class="col-sm-5">
								<c:choose>
									<c:when test="${additionalField.getType()=='integer' }">
										<form:input type="number" path="afv.value" value="${afv.getValue() }" <c:if test="${additionalField.isRequired()==true }">required</c:if> cssClass="form-control"></form:input>
										<form:hidden type="hidden" path="afv.additionalFields.additionalFieldID" value="${afv.getAdditonalFields().getAdditionalFieldID() }"></form:hidden>
									</c:when>
									<c:when test="${additionalField.getType()=='string' }">
										<form:input type="text" path="afv.value" value="${afv.getValue() }" <c:if test="${additionalField.isRequired()==true }">required</c:if> cssClass="form-control"></form:input>
										<form:hidden path="afv.additionalFields.additionalFieldID" value="${afv.getAdditonalFields().getAdditionalFieldID() }"></form:hidden>
									</c:when>
									<c:when test="${additionalField.getType()=='file' }">
										<form:input type="file" path="afv.value" value="${afv.getValue() }" <c:if test="${additionalField.isRequired()==true }">required</c:if> cssClass="form-control"></form:input>
										<form:hidden path="afv.additionalFields.additionalFieldID" value="${afv.getAdditonalFields().getAdditionalFieldID() }"></form:hidden>
									</c:when>
								</c:choose>
							</div>
							 <form:hidden type="hidden" path="afv.application.applicationID" value="${application.getApplicationID() }"></form:hidden>
							</c:forEach>
						</div>
						<c:if test="${status.index==length-1 }">
							<div class="form-group row">
							<div class="col-sm-10">
									
								 
								  <button id="#save1" type="submit" name="save" class="btn btn-primary">
							      		Save Application
							      </button>
							      <button type="submit" name="submit" class="btn btn-danger">
							      		Submit Application
							      </button>
							      <strong><p style="color:#f90000;float:left;margin-top:-26px;">*Note : If you submit the application, you will not be able to edit it again.</p></strong>
							    </div>
					  		</div>
						</c:if>
					</c:forEach>
				</form:form>
			</div>
		</div>
	</div>
	<%@include file="../layouts/footer.jsp" %>
</body>
</html>