<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>New User Register here...</h2>
	<hr/>
	
	<spring:form action="${pageContext.request.contextPath}/register-save" method="POST" modelAttribute="userDetails">
		<br/>
		<br/>
		<spring:label path="userName">Enter user name</spring:label>
		<spring:input path="userName"/>
		<br/>
		<br/>
		<spring:label path="password">Enter password</spring:label>
		<spring:password  path="password"/>
		<br/>
		<br/>
		<spring:label path="confirmPassword">Confirm Password</spring:label>
		<spring:password path="confirmPassword"/>
		<br/>
		<br/>
		<spring:label path="email">Enter email</spring:label>
		<spring:input path="email"/>
		<br/>
		<br/>
		<spring:label path="contact">Enter Contact number</spring:label>
		<spring:input path="contact"/>
		<br/>
		<br/>
		<spring:label path="roles">Select Role</spring:label>
		<ul>
			<li> <spring:checkbox path="roles" value="ADMIN" label="ADMIN"/></li>
			<li> <spring:checkbox path="roles" value="USER" label="USER"/></li>
		</ul>
		<br/>
		<br/>
		<input type="submit" value="Register">

	</spring:form>
	
</body>
</html>