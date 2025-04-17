<%@ include file="/src/views/fragments/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.mypackage.model.Prodotto" %>
<%@ page import="com.mypackage.dao.ProductDAO" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/productOverlay.css" />
    <!-- mettere css per la pagina -->
    <title>Store</title>
    
    
</head>
<body>

	    <% if (user!=null && user.isAdmin()) { %>
	        <div class="add-product-button">
	            <a href="${pageContext.request.contextPath}/src/views/admin/aggiungiProdotto.jsp" class="btn">Aggiungi prodotto</a>
	        </div>
	    <% } %>

	<div class="store-container">
	
	    <form method="get" action="StoresServlet" class="filterBar">
	        <!-- Ricerca per nome -->
	        <div class="filter-group">
	            <label for="name">Nome prodotto:</label>
	            <input type="text" id="name" name="name" placeholder="Cerca...">
	        </div>
	
	        <!-- Filtro per categoria -->
	        <div class="filter-group">
	            <label for="category">Categoria:</label>
	            <select id="category" name="category">
	                <option value="">Tutte</option>
	                <option value="interni">Interni</option>
	                <option value="esterni">Esterni</option>
	                <option value="restauro">Restauro</option>
	                <!-- Aggiungi altre categorie -->
	            </select>
	        </div>
	
	        <!-- Filtro per prezzo -->
	        <div class="filter-group">
	            <label for="minPrice">Prezzo da:</label>
	            <input type="number" id="minPrice" name="minPrice" min="0" step="0.01">
	            
	            <label for="maxPrice">a:</label>
	            <input type="number" id="maxPrice" name="maxPrice" min="0" step="0.01">
	        </div>
	
	        <button type="submit" class="filter-btn">Filtra</button>
	    </form>
	

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

</div>

<!-- Overlay per mostrare i dettagli del prodotto -->
    <div id="product-overlay-background" class="product-overlay-background" style="display: none;"></div>

	<div id="product-overlay" class="product-overlay" style="display: none;">
	    <div class="product-overlay-content">
	        <button class="close-overlay" onclick="closeProductOverlay()">✖</button>
	        <div id="product-detail"></div> <!-- Questo è il contenitore per i dettagli del prodotto -->
	    </div>
	</div>
    

       
</body>
</html>



<%@ include file="/src/views/fragments/footer.jsp" %>