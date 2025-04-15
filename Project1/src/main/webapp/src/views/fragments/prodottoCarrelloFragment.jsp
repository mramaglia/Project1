<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mypackage.model.Prodotto" %>
<%@ page import="com.mypackage.model.ProdottoCarrello" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/global.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/styleguide.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/prodottoCarrelloStyle.css" />
<meta charset="UTF-8">
<title>Prodotto nel carrello</title>
</head>
<body>

<%
    ProdottoCarrello item = (ProdottoCarrello) request.getAttribute("item");// Recuperi item passato dalla pagina principale
	Prodotto prodotto = item.getProdotto();
%>

<div class="cart-item">
    <img src="${pageContext.request.contextPath}/${item.getProdotto().getImmagine()}" alt="${item.getProdotto().getNome()}" class="cart-item-image">
    
    <div class="cart-item-details">
        <h3>${item.getProdotto().getNome()}</h3>
        <p>Prezzo unitario: € ${item.getProdotto().getPrezzo()}</p>
        <p>Quantità:${item.getQuantita()}</p>
        <p>Totale: € <%= item.getProdotto().getPrezzo() * item.getQuantita() %></p>
        
        <form method="post" action="${pageContext.request.contextPath}/servlets/RemoveFromCartServlet">
            <input type="hidden" name="productId" value="${item.getProdotto().getId()}">
            <button type="submit" class="remove-btn">Rimuovi</button>
        </form>
    </div>
</div>

</body>
</html>