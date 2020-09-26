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

<jsp:include page="header.jsp"></jsp:include>

<title>All Products List</title>
</head>
<body>

<section class="container-fluid p-4">
<h3>Choose Your Products</h3>

<c:choose>
		<c:when test="${products==null || products.isEmpty() }">
			<p class="alert alert-info p2 m2"> No Products Found</p>
		</c:when>
		<c:otherwise>
		<br/>
			<table class ="table table-stripped table-bordered table-hover">
				<tr align ="center">
					<th align ="center">ID</th>
					<th align ="center">Product Name</th>
					<th align ="center">Description</th>
					<th align ="center">Cost</th>
					<th align ="center"> Action </th>
				</tr>
				<c:forEach items="${products }" var="product">
					<tr>
					<td align ="center">${product.id }</td>
					<td>${product.productName }</td>
					<td>${product.productDescription }</td>
					<td align ="center">${product.cost }</td>
					<td align ="center"><a class="btn btn-primary" href="${pageContext.request.contextPath}/user/add-to-cart/${product.id}">Add to Cart</a></td>
				</tr>		
						
				</c:forEach>
			</table><br />
<%-- 					<a href = "${pageContext.request.contextPath}/user/checkout"> Check Out </a>  --%>
		</c:otherwise>
	</c:choose>
	
	
<!-- 	<h3> Cart:</h3> -->
<%-- 	<c:choose> --%>
<%-- 	<c:when test="${cart==null || cart.isEmpty() }"> --%>
<!-- 			<p>No Products Found</p> -->
<%-- 	</c:when> --%>
<%-- 		<c:otherwise> --%>
		
<!-- 		<table border="1" cellspacing="5px" cellpadding="5px"> -->
<!-- 				<tr> -->
<!-- 					<th> ID</th> -->
<!-- 					<th>Product ID</th> -->
<!-- 					<th>Quantity</th> -->
<!-- 					<th>Amount</th> -->
<!-- 					<th>Action </th> -->
<!-- 				</tr> -->
<%-- 				<c:forEach items="${cart }" var="cart"> --%>
<!-- 					<tr> -->
<%-- 					<td>${cart.id }</td> --%>
<%-- 					<td>${cart.productId }</td> --%>
<%-- 					<td>${cart.quantity }</td> --%>
<%-- 					<td>${cart.amount }</td> --%>
<%-- 					<td><a href="${pageContext.request.contextPath}/user/delete/${cart.productId}">Remove</a></td> --%>
<%-- 		</c:forEach> --%>
<!-- 		</table> -->
<%-- 		</c:otherwise> --%>
<%-- 		</c:choose> --%>
</section>

</body>
</html>