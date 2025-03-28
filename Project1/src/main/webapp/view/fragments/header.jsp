<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- Includi il CSS per l'header -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/headerStyle.css">

<header class="header">
    <div class="logo">
        San Giuseppe Artigiano
    </div>

    <button class="menu-toggle" id="menu-toggle">☰</button>
    
    <nav>
        <ul class="menu" id="menu">
            <li><a href="home.jsp">Home</a></li>
            <li><a href="services.jsp">Services</a></li>
            <li><a href="about.jsp">About</a></li>
        </ul>
    </nav>

    <a href="contact.jsp" class="contactButton">Contact</a>
</header>

<script src="${pageContext.request.contextPath}/assets/headerScript.js"></script>

