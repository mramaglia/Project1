<%@ include file="/src/views/fragments/header.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mypackage.model.User" %>
<%@ page import="com.mypackage.model.Ordine" %>
<%@ page import="com.mypackage.model.ProdottoCarrello" %>
<%@ page import="com.mypackage.model.Prodotto" %>
<%@ page import="com.mypackage.dao.OrdineDAO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/global.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/styleguide.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/profiloStyle.css" /> 
    <title>Profilo</title>
    
    <!-- Includi il CSS per la homepage -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/style.css">
</head>

<body>

<%
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/src/views/common/accesso.jsp");
        return;
    }
	boolean isAdmin = user.isAdmin();
	
	OrdineDAO ordineDAO = new OrdineDAO();
    List<Ordine> ordini = ordineDAO.getAllOrdini(); // Questo metodo deve restituire gli ordini in ordine DESC di data
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
        
         <div class="main-content">
        <h1>Ordini Utenti</h1>

        <% if (ordini == null || ordini.isEmpty()) { %>
            <p>Nessun ordine trovato.</p>
        <% } else { 
            for (Ordine ordine : ordini) {
        %>
            <div style="border: 1px solid #ccc; padding: 15px; margin-bottom: 15px; border-radius: 5px; background-color: #fff;">
                <h3>Ordine n. <%= ordine.getId_ordine() %> - Utente ID: <%= ordine.getId_utente() %></h3>
                <p><strong>Data:</strong> <%= ordine.getData() %></p>
                <p><strong>Indirizzo:</strong> <%= ordine.getIndirizzo() %></p>

                <div>
                    <strong>Prodotti:</strong>
                    <ul>
                        <%
                            List<ProdottoCarrello> prodotti = ordineDAO.getProdottiByOrdine(ordine.getId_ordine());
                            for (ProdottoCarrello pc : prodotti) {
                                Prodotto p = pc.getProdotto();
                        %>
                            <li>
                                <%= p.getNome() %> - €<%= p.getPrezzo() %> x <%= pc.getQuantita() %>
                            </li>
                        <% } %>
                    </ul>
                </div>
            </div>
        <% 
            }
        } %>
    </div>
        
    </div>
</div>

</body>
</html>

<%@ include file="/src/views/fragments/footer.jsp" %>