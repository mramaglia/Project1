<%@ include file="/src/views/fragments/header.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mypackage.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/global.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/styleguide.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/profiloStyle.css" /> 
    <title>Profilo</title>
    
    <!-- Includi il CSS per la homepage -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/style.css">
</head>

<body>

<%
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/src/views/common/accesso.jsp");
        return;
    }
	boolean isAdmin = user.isAdmin();
%>

<div class="container">
    <div class="sidebar">
        <h2>Profilo</h2>
        <a href="${pageContext.request.contextPath}/src/views/common/ordiniUtente.jsp">📦 Ordini</a>
        <a href="${pageContext.request.contextPath}/servlets/LogoutServlet">🚪 Logout</a>
        <% if (isAdmin) { %>
            <a href="${pageContext.request.contextPath}/src/views/admin/ordiniUtentiAdmin.jsp">📋 Ordini Utenti</a>
            <a href="${pageContext.request.contextPath}/src/views/admin/utentiAdmin.jsp">👤 Utenti</a>
        <% } %>
    </div>
    
    <div class="main-content">
        <h1>Benvenuto, <%= user.getUsername() %>!</h1>
        <p>Qui puoi gestire i tuoi ordini e le impostazioni dell'account.</p>
    </div>
</div>

</body>
</html>

<%@ include file="/src/views/fragments/footer.jsp" %>