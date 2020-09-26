<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script><meta charset="ISO-8859-1">


<title>Product List - Admin</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<section class="container-fluid p-4">
<h2>All Products</h4>

<p align="right">
<a class="btn btn-primary" href = "${pageContext.request.contextPath}/admin/product-entry">Add New product</a>
</p>
<c:choose>
		<c:when test="${products==null || products.isEmpty() }">
			<p class ="alert alert-info p-2 m-2">No Products Found</p>
		</c:when>
		<c:otherwise>
			<table class ="table table-stripped table-bordered table-hover" >
				<tr>
					<th>Id</th>
					<th>Product Name</th>
					<th>Description</th>
					<th>Cost</th>
					<th>Action</th>
				</tr>
				<c:forEach items="${products }" var="product">
					<tr>
					<td>${product.id }</td>
					<td>${product.productName }</td>
					<td>${product.productDescription }</td>
					<td>${product.cost }</td>
					<td>
						<a class="btn btn-sm btn-danger" href="${pageContext.request.contextPath}/admin/product-delete/${product.id}"><strong>DELETE</strong></a>
					</td>
				</tr>				
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</section>

</body>
</html>