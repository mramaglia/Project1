<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mypackage.model.User" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/global.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/styleguide.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/productCardStyle.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/productOverlay.css" />
    <script src="${pageContext.request.contextPath}/assets/script/productOverlay.js" defer></script>
<meta charset="UTF-8">
<title>Header</title>
</head>
<body>

<% 
//Recupera la sessione
HttpSession headerSession = request.getSession(false);
User user = (headerSession != null) ? (User) headerSession.getAttribute("user") : null;
%>

<div class="product-card" onclick="showProductOverlay(${product.getId()})">
    <img src="${pageContext.request.contextPath}/${product.getImmagine()}" alt="${product.getNome()}" class="product-image">
    <h3>${product.getNome()}</h3>
    <p>${product.getDescrizione()}</p>
    <p class="price">€ ${product.getPrezzo()}</p>
    <p class="quantity">Quantita: ${product.getQuantita()}</p>
    
    
         <%
         if(user!=null && user.isAdmin()){
         %>
         <div class="admin-buttons">
            <form method="get" action="${pageContext.request.contextPath}/src/views/admin/modificaProdotto.jsp" onclick="event.stopPropagation();">
                <input type="hidden" name="id" value="${product.getId()}" />
                <button type="submit" class="edit-button">✏️ Modifica</button>
            </form>
            <form method="post" action="${pageContext.request.contextPath}/servlets/DeleteProductServlet" 
            	onsubmit="return confirm('Sei sicuro di voler eliminare questo prodotto?');" onclick="event.stopPropagation();">
                <input type="hidden" name="id" value="${product.getId()}" />
                <button type="submit" class="delete-button">🗑️ Elimina</button>
            </form>
        </div>
        <%} else{ %>
        
        <form action="${pageContext.request.contextPath}/servlets/AddToCartServlet" method="post" class="user-cart-form" onclick="event.stopPropagation();">
            <input type="hidden" name="productId" value="${product.getId()}">
            <input type="number" name="quantita" min="1" max="${product.getQuantita()}" value="1" required>
            <button type="submit" class="add-to-cart-button">🛒 Aggiungi al carrello</button>
        </form>
        
        <% } %>
    
</div>

</body>

</html>