<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/global.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/styleguide.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/productCardStyle.css" />
<meta charset="UTF-8">
<title>Header</title>
</head>
<body>

<div class="product-card">
    <img src="${pageContext.request.contextPath}/${product.getImmagine()}" alt="${product.getNome()}" class="product-image">
    <h3>${product.getNome()}</h3>
    <p>${product.getDescrizione()}</p>
    <p class="price">€ ${product.getPrezzo()}</p>
    <p class="quantity">Quantita: ${product.getQuantita()}</p>
    
    <form action="${pageContext.request.contextPath}/servlets/AddToCartServlet" method="post">
        <input type="hidden" name="productId" value="${product.getId()}">
         <input type="number" name="quantita" min="1" max="${product.getQuantita()}" value="1" required>
        <button type="submit" class="add-to-cart-button">Aggiungi al carrello</button>
    </form>
</div>

</body>
</html>