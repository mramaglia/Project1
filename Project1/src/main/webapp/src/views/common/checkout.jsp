<%@ include file="/src/views/fragments/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.mypackage.model.Prodotto" %>
<%@ page import="com.mypackage.model.ProdottoCarrello" %>
<%@ page import="com.mypackage.dao.ProductDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/global.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/styleguide.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/checkoutStyle.css" />
<meta charset="UTF-8">
<title>Checkout</title>
</head>
<body>

<div class="checkout-container">

    <h2>Checkout</h2>

    <%
    List<ProdottoCarrello> cart = (List<ProdottoCarrello>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
%>
    <p>Il tuo carrello è vuoto.</p>
<%
    } else {
        for (ProdottoCarrello item : cart) {
            request.setAttribute("item", item); // Passi l'oggetto al fragment
%>
            <jsp:include page="/src/views/fragments/prodottoCarrelloFragment.jsp">
            	<jsp:param name="item" value="<%= item %>" />
            </jsp:include>
<%
        }
    }
%>

<%
    double totaleCarrello = 0.0;
    
	if(cart!=null){
		for (ProdottoCarrello item : cart) {
	        totaleCarrello += item.getProdotto().getPrezzo() * item.getQuantita();
	    }
	}
%>

	<div class="cart-summary">
    	<h2>Totale carrello: <%= String.format("%.2f", totaleCarrello) %> euro</h2>
    </div>
    <!-- Dati cliente -->
    <form class="checkout-form" method="post" action="<%= request.getContextPath() %>/servlets/ConfermaOrdineServlet">
        <h3>Dati di spedizione</h3>
        <input type="text" name="nome" placeholder="Nome" required>
        <input type="text" name="cognome" placeholder="Cognome" required>
        <input type="text" name="indirizzo" placeholder="Indirizzo" required>
        <input type="email" name="email" placeholder="Email" required>
        
        <!-- Metodo di pagamento (mock) -->
        <select name="pagamento" required>
            <option value="">Seleziona metodo di pagamento</option>
            <option value="carta">Carta di credito</option>
            <option value="paypal">PayPal</option>
        </select>

        <button type="submit" class="checkout-btn">Conferma Ordine</button>
    </form>

</div>


</body>
</html>

<%@ include file="/src/views/fragments/footer.jsp" %>