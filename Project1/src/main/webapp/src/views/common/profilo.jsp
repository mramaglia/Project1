<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mypackage.model.User" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profilo</title>
</head>

<%
    // Recupera la sessione
    HttpSession headerSession = request.getSession(false);
	User user = (headerSession != null) ? (User) headerSession.getAttribute("user") : null;
%>

<body>

	<h1>Area personale di <% out.println(user.getUsername()); %>!</h1>
	
	<h2>email: <% out.println(user.getEmail()); %></h2>

</body>
</html>