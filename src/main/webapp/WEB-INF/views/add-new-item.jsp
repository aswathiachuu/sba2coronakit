<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script><meta charset="ISO-8859-1">


<title>Insert title here</title>
</head>
<body>


<jsp:include page="header.jsp" />

<section class="container-fluid p-4">

<h2>Add New Item</h2>

<div class="col-4">
<form:form class="form" action="${pageContext.request.contextPath}/admin/product-save" method="POST" modelAttribute="product">
		
		<div class ="form-group">
			<form:label class="form-label" path="productName">Product Name: </form:label>
			<form:input class="form-control" type="text" path="productName" />
			<form:errors class="alert alert-danger" path="productName"/>
		</div>
		
		<div class ="form-group">
			<form:label class="form-label" path="productDescription">Product Description: </form:label>
			<form:input class="form-control" type="text" path="productDescription" />
			<form:errors class="alert alert-danger" path="productDescription"/>
		</div>
		
		<div class ="form-group">
			<form:label class="form-label" path="cost">Cost </form:label>
			<form:input class="form-control"  type="number" path="cost" />
			<form:errors class="alert alert-danger" path="cost"/>
		</div>
		
	
	
		<button class="btn btn-primary">SAVE</button>		
	</form:form>
	</div>

</section>
</body>
</html>