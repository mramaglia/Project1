<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.mypackage.model.User" %>


<%
    // Recupera la sessione
    HttpSession headerSession = request.getSession(false);
	User user = (headerSession != null) ? (User) headerSession.getAttribute("user") : null;
%>
<!-- Includi il CSS per l'header -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/global.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/styleguide.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/headerStyle.css">


<header class="header">
    <div class="logo">
        San Giuseppe Artigiano
    </div>

    <button class="menu-toggle" id="menu-toggle">☰</button>
    
    <nav>
        <ul class="menu" id="menu">
            <li><a href="${pageContext.request.contextPath}/src/views/home.jsp">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/src/views/common/about.jsp">About</a></li>
            <li><a href="<%= request.getContextPath() %>/servlets/StoresServlet">Store</a></li>
        </ul>
    </nav>
    
    <a href="${pageContext.request.contextPath}/src/views/common/carrello.jsp" class="cart-button">🛒</a>
 
    <div class="auth-buttons">
        <% if (user == null) { %>
            <!-- Mostra il pulsante di login se l'utente NON è loggato -->
            <a href="${pageContext.request.contextPath}/src/views/common/accesso.jsp" class="loginButton">Login</a>
        <% } else { %>
            <!-- Mostra il pulsante del profilo se l'utente È loggato -->
            <a href="${pageContext.request.contextPath}/src/views/common/profilo.jsp" class="profileButton">Profilo</a>
            <a href="${pageContext.request.contextPath}/servlets/LogoutServlet" class="logoutButton">Logout</a>
        <% } %>
    </div>

    
</header>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const menuToggle = document.getElementById("menu-toggle");
        const menu = document.getElementById("menu");

        menuToggle.addEventListener("click", function () {
            menu.classList.toggle("show");
        });
    });
</script>



