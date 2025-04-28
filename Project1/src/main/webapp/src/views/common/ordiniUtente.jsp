<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mypackage.model.User" %>
<%@ page import="com.mypackage.model.Ordine" %>
<%@ page import="com.mypackage.model.Prodotto" %>
<%@ page import="com.mypackage.model.ProdottoCarrello" %>
<%@ page import="com.mypackage.dao.OrdineDAO" %>
<%@ page import="java.util.List" %>

<%@ include file="/src/views/fragments/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/global.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/styleguide.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/ordiniUtenteStyle.css" /> 

<title>Insert title here</title>
</head>
<body>

<%
    if (user == null) {
        response.sendRedirect("login.jsp");
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

        <%
            int userId = user.getId();
            OrdineDAO ordineDAO = new OrdineDAO();
            List<Ordine> ordini = ordineDAO.getOrdiniByUtente(userId);

            if (ordini == null || ordini.isEmpty()) {
        %>
            <p>Non hai ancora effettuato ordini.</p>
        <%
            } else {
                for (Ordine ordine : ordini) {
        %>
            <div class="ordine">
                <h2>Ordine n. <%= ordine.getId_ordine() %></h2>
                <p><strong>Data:</strong> <%= ordine.getData() %></p>
                <p><strong>Indirizzo:</strong> <%= ordine.getIndirizzo() %></p>

                <div>
                    <h3>Prodotti:</h3>
                    <% 
                    List<ProdottoCarrello> prodotti = ordineDAO.getProdottiByOrdine(ordine.getId_ordine());
                    for (ProdottoCarrello pc : prodotti) {
                        Prodotto p = pc.getProdotto();
                    %>
                        <div class="prodotto">
                            <span><strong>Nome:</strong> <%= p.getNome() %></span><br>
                            <span><strong>Prezzo:</strong> €<%= p.getPrezzo() %></span><br>
                            <span><strong>Quantità:</strong> <%= pc.getQuantita() %></span>
                        </div>
                    <% } %>
                </div>
            </div>
        <%
                }
            }
        %>
    </div>
</div>

</body>
</html>

<%@ include file="/src/views/fragments/footer.jsp" %>