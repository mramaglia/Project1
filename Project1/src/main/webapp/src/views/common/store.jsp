<%@ include file="/src/views/fragments/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mypackage.model.Prodotto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/global.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/styleguide.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/storeStyle.css" /> 
    <!-- mettere css per la pagina -->
    <title>Store</title>
    
    <!-- Includi il CSS per la homepage -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/style.css">
</head>
<body>
	<div class="store-container">
	    <% if (user!=null && user.isAdmin()) { %>
	        <div class="add-product-button">
	            <a href="${pageContext.request.contextPath}/src/views/admin/aggiungiProdotto.jsp" class="btn">Aggiungi prodotto</a>
	        </div>
	    <% } %>
	</div>
	
	<div class="product-grid">
	    <!-- Itera sulla lista di prodotti -->
	    <% 
	        List<Prodotto> products = (List<Prodotto>) request.getAttribute("products");
	        for (Prodotto product : products) {
	            request.setAttribute("product", product);  // Imposta il prodotto come attributo
	    %>
	        <!-- Includi il fragment per ogni prodotto -->
	        <jsp:include page="/src/views/fragments/productCard.jsp"/>
	    <% } %>
	</div>
       
</body>
</html>

<%@ include file="/src/views/fragments/footer.jsp" %>