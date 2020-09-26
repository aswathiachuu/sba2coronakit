<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script><meta charset="ISO-8859-1">

<title>Your Cart</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<section class="container-fluid p-4">

<h3>Your Cart</h3>
	<br/>
	<c:choose>
	<c:when test="${cart==null || cart.isEmpty()}">
			<p class="alert alert-info p2 m2">No Products Found</p>
	</c:when>
		<c:otherwise>
		<div class="col-8">
		<table  class="table table-bordered table-hover">
				<tr align="center">
					
					<th>Product</th>
					<th>Quantity</th>
					<th>Amount</th>
					<th align="center">Action </th>
				</tr>
				<c:forEach items="${cart }" var="cart">
					<tr align="center">
					
					<td>Product #${cart.productId }</td>
					<td>${cart.quantity }</td>
					<td>${cart.amount }</td>
					<td align="center"><a class="btn btn-danger" href="${pageContext.request.contextPath}/user/delete/${cart.productId}">Remove</a></td>
		</c:forEach>
		</table>
		</div>
			<h5 class="alert alert-info p-2 m-2">Total value is ${sum }</h5><br/>
		</c:otherwise>
		</c:choose>
		
		

	
		
		<a class="btn btn-primary" href = "${pageContext.request.contextPath}/user/show-list"> Add More </a>
		<a class="btn btn-secondary" href = "${pageContext.request.contextPath}/user/checkout"> Check Out </a> 
</section>

</body>
</html>