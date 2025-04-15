<%@ include file="/src/views/fragments/header.jsp" %>
<%@ page import="com.mypackage.model.Prodotto" %>
<%@ page import="com.mypackage.model.ProdottoCarrello" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Carrello</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/global.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/styleguide.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/carrelloStyle.css" /> 
</head>
<body>
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
    
    <%
	    // Verifica se l'utente è loggato
	    boolean isLoggedIn = (session.getAttribute("user") != null);
	    String actionUrl = isLoggedIn ? "/src/views/common/checkout.jsp" : "/src/views/common/accesso.jsp"; // Imposta l'URL dell'azione
	%>
    
    <form action="<%= request.getContextPath() %><%= actionUrl %>" method="get">
        <button type="submit" class="checkout-btn">Procedi all'acquisto</button>
    </form>
</div>
</body>

</html>

<%@ include file="/src/views/fragments/footer.jsp" %>