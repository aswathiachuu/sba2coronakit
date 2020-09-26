<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script><meta charset="ISO-8859-1">

<jsp:include page="header.jsp"></jsp:include>
<title>Check Out</title>
</head>
<body>

<section class="container-fluid p-4">
<h3> Check Out</h3>
	<c:choose>
	<c:when test="${cart==null || cart.isEmpty() }">
			<p class="alert alert-danger p2 m2">No Products Added</p>
			<a class="btn btn-primary" href = "${pageContext.request.contextPath}/user/show-list"> Add Products </a>
	</c:when>
		<c:otherwise>
		<h4>You are one step away from placing your order. <br/>
	
		<br/>Your cart value is : ${sum }

		


		 <br/> </h4>

		<form action="${pageContext.request.contextPath}/user/finalize"><hr/>
		<div>
			<label><strong> Enter Your Delivery Address </strong></label><br />
			<textarea name="address" rows="3" cols="35"></textarea> <br/> <br/>
		</div>
		
		<a class="btn btn-secondary" href = "${pageContext.request.contextPath}/user/show-list"> Add More </a>
		<a class="btn btn-info" href = "${pageContext.request.contextPath}/user/show-kit"> View Cart </a>
		<button class="btn btn-primary">Confirm Order</button>		
		</form>
		</c:otherwise>
		</c:choose>
		
		
		

</section>
</body>
</html>