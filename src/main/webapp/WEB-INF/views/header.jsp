<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring-form" %>

<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>    
        
  <html>
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <!-- Brand -->
  <a class="navbar-brand" href="#">Corona Kit Portal</a>

  <!-- Toggler/collapsibe Button -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>

  <!-- Navbar links -->
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/home">Home</a>
      </li>
      <security:authorize access="hasRole('ADMIN')">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/product-list">Items List</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/product-entry">Add New Item</a>
      </li>
      </security:authorize>
       <security:authorize access="hasRole('USER')">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/user/show-list">Product List</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/user/show-kit">View Cart</a>
      </li>
      </security:authorize>
    </ul>
    
  </div>
  
  <div>
  
  
  <spring-form:form action="${pageContext.request.contextPath}/logout" method="POST">
<input type="submit" value="Logout">
</spring-form:form></div>
</nav>


</html>