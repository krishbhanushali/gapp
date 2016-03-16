<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>Add Additional Requirements</title>
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
				<h3>Additional Requirements</h3>
				<div class="alert alert-warning" role="alert">
 					<strong>Alert!</strong> Fields marked with <strong style="color:red">*</strong> are required.
				</div>
				<c:set var="length" value="${additionalFields.size() }"></c:set>
				<form method="post" enctype="multipart/form-data"> 
					<c:forEach items="${additionalFields}" varStatus="status" var="additionalField">
						<div class="form-group row">
							<label for="value" class="col-sm-4 form-control-label">${additionalField.getName() } <c:if test="${additionalField.isRequired()==true }"><strong style="color:red">*</strong></c:if></label>
							<div class="col-sm-5">
								<c:choose>
									<c:when test="${additionalField.getType()=='integer' }">
										<input type="number" name="integerValue" <c:if test="${additionalField.isRequired()==true }">required</c:if> class="form-control"></input>
										<input type="hidden" name="additionalFieldIDInteger" value="${additionalField.getAdditionalFieldID() }">
									</c:when>
									<c:when test="${additionalField.getType()=='string' }">
										<input type="text" name="stringValue" <c:if test="${additionalField.isRequired()==true }">required</c:if> class="form-control"></input>
										<input type="hidden" name="additionalFieldIDString" value="${additionalField.getAdditionalFieldID() }">
									</c:when>
									<c:when test="${additionalField.getType()=='file' }">
										<input type="file" name="fileValue" <c:if test="${additionalField.isRequired()==true }">required</c:if> class="form-control"></input>
										<input type="hidden" name="additionalFieldIDFile" value="${additionalField.getAdditionalFieldID() }">
									</c:when>
								</c:choose>
							</div>
							
						</div>
						<c:if test="${status.index==length-1 }">
							<div class="form-group row">
							<div class="col-sm-10">
									
									<input type="hidden" name="applicationID" value="${application.getApplicationID() }">
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
				</form>
			</div>
		</div>
	</div>
	<%@include file="../layouts/footer.jsp" %>
</body>
</html>