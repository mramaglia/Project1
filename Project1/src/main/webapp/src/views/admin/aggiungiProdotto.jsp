<%@ include file="/src/views/fragments/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/global.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/styleguide.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/aggiungiProdottoStyle.css" />
<title>Aggiungi prodotto</title>
</head>
<body>

<div class="form-container">
    <h2>Aggiungi Prodotto</h2>

    <form action="<%= request.getContextPath() %>/servlets/AddProductServlet" method="post" enctype="multipart/form-data">
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" required>

        <label for="descrizione">Descrizione:</label>
        <textarea id="descrizione" name="descrizione" rows="4" required></textarea>

        <label for="prezzo">Prezzo:</label>
        <input type="number" id="prezzo" name="prezzo" min="0" required>

        <label for="quantita">Quantità:</label>
        <input type="number" id="quantita" name="quantita" min="0" required>

        <label for="categoria">Categoria:</label>
        <input type="text" id="categoria" name="categoria" required>

        <label for="immagine">Immagine:</label>
        <input type="file" id="immagine" name="immagine" accept="image/*" required>

        <button type="submit">Aggiungi</button>
    </form>
</div>

</body>
</html>


<%@ include file="/src/views/fragments/footer.jsp" %>