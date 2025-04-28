<%@ include file="fragments/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mypackage.model.Prodotto" %>
<%@ page import="com.mypackage.dao.ProductDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>San Giuseppe Artigiano</title>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/global.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/styleguide.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/style.css" />
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
    
    <div id="imageCarousel" class="carousel slide" data-ride="carousel">
	    <div class="carousel-inner">
	        <div class="carousel-item active">
	            <img src="${pageContext.request.contextPath}/assets/images/carosello1.jpg" class="d-block w-100" alt="Immagine 1">
	        </div>
	        <div class="carousel-item">
	            <img src="${pageContext.request.contextPath}/assets/images/carosello2.jpg" class="d-block w-100" alt="Immagine 2">
	        </div>
	        <div class="carousel-item">
	            <img src="${pageContext.request.contextPath}/assets/images/carosello3.jpg" class="d-block w-100" alt="Immagine 3">
	        </div>
	        <div class="carousel-item">
	            <img src="${pageContext.request.contextPath}/assets/images/carosello4.jpg" class="d-block w-100" alt="Immagine 3">
	        </div>
	        <div class="carousel-item">
	            <img src="${pageContext.request.contextPath}/assets/images/carosello5.jpg" class="d-block w-100" alt="Immagine 3">
	        </div>
	    </div>
	    <a class="carousel-control-prev" href="#imageCarousel" role="button" data-slide="prev">
	        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	        <span class="sr-only">Precedente</span>
	    </a>
	    <a class="carousel-control-next" href="#imageCarousel" role="button" data-slide="next">
	        <span class="carousel-control-next-icon" aria-hidden="true"></span>
	        <span class="sr-only">Successivo</span>
	    </a>
	</div>
	
    <div class="new-products-header">
	    <h2>Nuovi Prodotti</h2>
	    <a href="<%= request.getContextPath() %>/servlets/StoresServlet" class="go-to-store-button">Vai allo store</a>
	</div>


	<div class="product-grid">
	
	    <!-- Itera sulla lista di prodotti -->
	    <% 
		    ProductDAO productDAO = new ProductDAO();
		    List<Prodotto> ultimiProdotti = productDAO.getUltimiProdotti(3); // ultimi 5
	        for (Prodotto product : ultimiProdotti) {
	            request.setAttribute("product", product);  // Imposta il prodotto come attributo
	    %>
	        <!-- Includi il fragment per ogni prodotto -->
	        <jsp:include page="/src/views/fragments/productCard.jsp"/>
	    <% } %>
	</div>
	
	<h1 class="about-paragraph-heading">Chi siamo</h1>
	
	<div class="about-paragraph">
		
	    <p class="about-text">
	        Giuseppe è un artigiano restauratore con una passione autentica per il legno e 
	        per l'arte del restauro. La sua storia professionale inizia nel 1998, anno in cui apre 
	        il suo laboratorio artigianale, spinto dall'amore per i materiali naturali e dal desiderio 
	        di ridare nuova vita a mobili e oggetti antichi. Giuseppe ha coltivato un 
	        interesse profondo per la lavorazione del legno, un materiale che considera vivo e capace di 
	        raccontare storie attraverso venature, profumi e imperfezioni. Nel suo laboratorio, ogni pezzo
	        viene trattato con rispetto, pazienza e cura, utilizzando tecniche tradizionali affiancate a 
	        metodi innovativi, sempre con l'obiettivo di preservarne l'autenticità e la bellezza originale.
	    </p>
	    
	    <a href="${pageContext.request.contextPath}/src/views/common/about.jsp" class="go-to-about-button">Per saperne di più...</a>
	</div>
    
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

<%@ include file="fragments/footer.jsp" %>

