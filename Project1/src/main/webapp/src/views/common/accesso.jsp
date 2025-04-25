<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mypackage.dao.UserDAOImpl" %>
<%@ page import="com.mypackage.model.User" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/loginStyle.css">
</head>
<body>


	    
	<div class="loginForm">
	    <h2>Login</h2>
	    <form action="<%= request.getContextPath() %>/servlets/LoginServlet" method="post">
	        <label for="email">Email:</label>
	        <input type="text" id="email" name="email" required>
	        
	        <label for="password">Password:</label>
	        <input type="password" id="password" name="password" required>
	        
	        <button type="submit">Sign in</button>
	    </form>
	    
	    <% if (request.getParameter("error") != null) { %>
	        <p style="color:red;">Invalid username or password!</p>
	    <% } %>
	    
	    
	    <div class="registerLink">
	        <a href="registrazione.jsp" class="registratiButton">Registrati</a>
	    </div>
    
	</div>

</body>
</html>