<%@ include file="/src/views/fragments/header.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mypackage.model.User" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="global.css" />
    <link rel="stylesheet" href="styleguide.css" />
    <link rel="stylesheet" href="style.css" />
    <title>Profilo</title>
    
    <!-- Includi il CSS per la homepage -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/style.css">
</head>

<body>

	<h1>Area personale di <% out.println(user.getUsername()); %>!</h1>
	
	<h2>email: <% out.println(user.getEmail()); %></h2>

</body>
</html>

<%@ include file="/src/views/fragments/footer.jsp" %>