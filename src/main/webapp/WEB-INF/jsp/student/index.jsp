<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel='stylesheet' href='../webjars/bootstrap/3.2.0/css/bootstrap.min.css'></link>
	<script type="text/javascript" src="../webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../webjars/jquery/2.1.1/jquery.min.js"></script>
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
<title>Student ${user.firstName }</title>
</head>
<body>
	<%@include file="../layouts/header.jsp" %>
	<div class="container">
		<div class="row">	
			<div class="col-sm-9 assignBorder">
				
				<h3>Hello, ${user.firstName}!</h3>
			</div>
		</div>
	</div>
	<%@include file="../layouts/footer.jsp" %>
</body>
</html>