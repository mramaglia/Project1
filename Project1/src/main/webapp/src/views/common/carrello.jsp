<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/src/views/fragments/header.jsp" %>
    <%@ page import="com.mypackage.model.Prodotto" %>
    <%@ page import="com.mypackage.model.ProdottoCarrello" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/global.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/styleguide.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/storeStyle.css" /> 
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
</body>

</html>

<%@ include file="/src/views/fragments/footer.jsp" %>