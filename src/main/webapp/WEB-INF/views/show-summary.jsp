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

<title>Order Summary</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section class="container-fluid p-4">
<p class="alert alert-info">Your Order Has been Accepted<p>




<div class="jumbotron ">
<h3><strong> Order Summary: </strong></h3>
<h4> Your Bill Amount is: ${ck.totalAmount }</h4>
<h4> Your Order Will be Delivered to ${ck.deliveryAddress }</h4>
</div>
<hr/>
	<h3>Your Corona Kit</h3>
<br/>
	<c:choose>
	<c:when test="${cart==null || cart.isEmpty() }">
			<p class="alert alert-info p2 m2">No Products Found</p>
	</c:when>
		<c:otherwise>
		<div class="col-8">
		<table  class="table table-bordered table-hover">
				<tr align="center">
					
					<th>Product</th>
					<th>Quantity</th>
					
				</tr>
				<c:forEach items="${cart }" var="cart">
					<tr align="center">
					
					<td>Product #${cart.productId }</td>
					<td>${cart.quantity }</td>
					
		</c:forEach>
		</table>
		</div>
		</c:otherwise>
		</c:choose>
		</section>
</body>
</html>