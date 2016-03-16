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
		.panel
		{
			margin-bottom:40px !important;
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
<title>View Applications</title>
</head>
<body>
	<%@include file="../layouts/header.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 assignBorder">
				<h3>View your applications</h3>
				<c:if test="${applications=='[]' }">
					You do not have any applications. Click to <a href="../applications/create.html">Apply</a>.
				</c:if>
				<c:if test="${applications!='[]'}">
					<div style="float:right;margin:5px;"><span class="glyphicon glyphicon-edit"></span> <a href="../applications/create.html">Apply New Application</a></div>
					<div class="table-responsive ">
						<table class="table table-bordered table-striped">
							<tr><th>Sr. No</th><th>Program Name</th><th>Department Name</th><th>Term</th><th>Last Submitted Date</th><th>Status</th><th>Operations</th></tr>
								<c:forEach varStatus="loop" items="${applications }" var="a">
									<tr>
										<c:set var="date" value="Not yet submitted"></c:set>
										<td>${loop.index + 1}</td>
										<td>${a.getProgram().getProgramName() }</td>
										<td>${a.getProgram().getDept().getDepartmentName() }</td>
										<td>${a.getTerm().getTermName() }</td>
										<td>
											<c:forEach items="${a.getApplicatonStatusHistory() }" var="history">
												<!--<c:out value="${history.getTimeChanged()}"></c:out>-->
												<c:set var="date" value="${history.getTimeChanged() }"></c:set>
											</c:forEach>
											<fmt:formatDate value="${date }" pattern="MM-dd-yyyy"></fmt:formatDate>
										</td>
										<td>${a.getStatus().getApplicationStatusName() }</td>
										
										<td>
											<c:if test="${a.getStatus().getApplicationID()==6 }">
												<a href="edit.html?id=<c:out value="${a.getApplicationID() }"></c:out>">Edit</a> | 
											</c:if> 
											<a href="view.html?applicationID=<c:out value="${a.getApplicationID()}"></c:out>">View</a>
										</td>
									</tr>
								</c:forEach>
						</table>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<%@include file="../layouts/footer.jsp" %>
</body>
</html>