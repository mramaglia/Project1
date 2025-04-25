<%@ include file="fragments/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mypackage.model.Prodotto" %>
<%@ page import="com.mypackage.dao.ProductDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/global.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/styleguide.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/style.css" />
    <title>San Giuseppe Artigiano</title>

</head>
<body>

	<div class="copy">
      <div class="page-title">
        <div class="text-wrapper">Benvenuto da San Giuseppe artigiano!</div>
        <p class="div">
          Specializzato nel recupero e nella conservazione di mobili e oggetti in legno,
          riportando a nuova vita pezzi antichi o danneggiati. 
        </p>
      </div>
      <button class="button" onclick="window.location.href='${pageContext.request.contextPath}/src/views/common/about.jsp';">
      <div class="text-wrapper-2">Richiedi il preventivo per il tuo restauro</div>
      </button>
    </div>


	<div class="product-grid">
	    <!-- Itera sulla lista di prodotti -->
	    <% 
		    ProductDAO productDAO = new ProductDAO();
		    List<Prodotto> ultimiProdotti = productDAO.getUltimiProdotti(5); // ultimi 5
	        for (Prodotto product : ultimiProdotti) {
	            request.setAttribute("product", product);  // Imposta il prodotto come attributo
	    %>
	        <!-- Includi il fragment per ogni prodotto -->
	        <jsp:include page="/src/views/fragments/productCard.jsp"/>
	    <% } %>
	</div>
    
</body>
</html>

<%@ include file="fragments/footer.jsp" %>
