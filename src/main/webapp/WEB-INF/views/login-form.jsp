<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring-form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>    
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script><meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<section class="container-fluid p-4">
<h1>Welcome to Corona-Kit Portal Home...</h1>
<hr/>


<core:if test="${param.error != null}">
	<p class="alert alert-info p-2 m-2"><i>Invalid Credentials!!!</i></p>
</core:if>


<div class="col-3">
<spring-form:form class="form" action="${pageContext.request.contextPath}/validate" method="POST">
	<div class ="form-group">
	<label class="form-label">Enter User Name</label>
	<input class="form-control" type="text" name="username" />
	</div>
	<div class ="form-group">
	
	<label class="form-label">Enter Password</label>
	<input class="form-control" type="password" name="password" />
	</div>
	<div class ="form-group">
	<input class="btn btn-primary" type="submit" value="Login" />
	</div>
	
</spring-form:form>
</div>
<core:if test="${param.logout != null}">
	<i>You have been logged out successfully!!!</i>
</core:if>

</section>
</body>
</html>