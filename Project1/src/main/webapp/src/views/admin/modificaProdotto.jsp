<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mypackage.model.Prodotto" %>
<%@ page import="com.mypackage.dao.ProductDAO" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/modificaProdottoStyle.css">

<meta charset="UTF-8">
<title>Modifica Prodotto</title>
</head>
<body>

<%
	int idProdotto = Integer.parseInt(request.getParameter("id"));
	ProductDAO productDao = new ProductDAO();
    Prodotto prodotto = productDao.getProductById(idProdotto);
%>

<form action="${pageContext.request.contextPath}/servlets/UpdateProductServlet" method="post" class="edit-product-form">
    <input type="hidden" name="id" value="<%= prodotto.getId() %>">    

    <label for="nome">Nome:</label>
    <input type="text" name="nome" value="<%= prodotto.getNome() %>" required>

    <label for="descrizione">Descrizione:</label>
    <textarea name="descrizione" required><%= prodotto.getDescrizione() %></textarea>

    <label for="prezzo">Prezzo (€):</label>
    <input type="number" name="prezzo" value="<%= prodotto.getPrezzo() %>" step="1" required>

    <label for="quantita">Quantità:</label>
    <input type="number" name="quantita" value="<%= prodotto.getQuantita() %>" required>

    <label for="categoria">Categoria:</label>
    <select name="categoria" required>
        <option value="interni" <%= prodotto.getCategoria().equals("interni") ? "selected" : "" %>>Interni</option>
        <option value="esterni" <%= prodotto.getCategoria().equals("esterni") ? "selected" : "" %>>Esterni</option>
        <option value="restauro" <%= prodotto.getCategoria().equals("restauro") ? "selected" : "" %>>Restauro</option>
    </select>


    <button type="submit" class="btn btn-primary">Salva modifiche</button>
</form>


</body>
</html>