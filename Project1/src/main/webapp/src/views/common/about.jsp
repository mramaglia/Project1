<%@ include file="/src/views/fragments/header.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/aboutStyle.css" />
    <title>About</title>

</head>
<body>

<div class="content-wrapper">
    <div class="text">
        <h2 class="title">Il Restauratore</h2>
        <p class="description">
            Giuseppe è un artigiano restauratore con una passione autentica per il legno e 
	        per l'arte del restauro. La sua storia professionale inizia nel 1998, anno in cui apre 
	        il suo laboratorio artigianale, spinto dall'amore per i materiali naturali e dal desiderio 
	        di ridare nuova vita a mobili e oggetti antichi. Giuseppe ha coltivato un 
	        interesse profondo per la lavorazione del legno, un materiale che considera vivo e capace di 
	        raccontare storie attraverso venature, profumi e imperfezioni. Nel suo laboratorio, ogni pezzo
	        viene trattato con rispetto, pazienza e cura, utilizzando tecniche tradizionali affiancate a 
	        metodi innovativi, sempre con l'obiettivo di preservarne l'autenticità e la bellezza originale.
	        Nel corso degli anni, grazie alla sua competenza, sensibilità e dedizione, Giuseppe è diventato
	        un punto di riferimento nel settore del restauro, conquistando la fiducia di clienti privati,
	        antiquari e appassionati d'arte. Il suo nome è sinonimo di qualità, serietà e grande attenzione
	        ai dettagli: ogni lavoro porta con sé l'impronta unica della sua maestria artigianale.
	        Oggi, dopo più di venticinque anni di attività, Giuseppe continua a trasmettere la sua passione
	        attraverso ogni progetto, valorizzando il patrimonio storico degli arredi e contribuendo 
	        a mantenere viva la tradizione del restauro.
	        <br>P.S. Non chiamatelo mai falegname! Ci tiene ad essere definito restauratore.
        </p>
    </div>
    <div class="image"></div>
</div>

<h1 class="barca-paragraph-heading">Passione per le barche</h1>
	
	<div class="barca-paragraph">
		
	    <p class="barca-text">
	        La passione per il legno non si è fermata ai soli mobili ma è arrivata anche alle barche il legno.
	        Qui qualche foto di una barca restaurata da Giuseppe.
	    </p>
	    
	</div>
	
	    <div id="imageCarousel" class="carousel slide" data-ride="carousel">
	    <div class="carousel-inner">
	        <div class="carousel-item active">
	            <img src="${pageContext.request.contextPath}/assets/images/barca-1.jpg" class="d-block w-100" alt="Immagine 1">
	        </div>
	        <div class="carousel-item">
	            <img src="${pageContext.request.contextPath}/assets/images/barca-2.jpg" class="d-block w-100" alt="Immagine 2">
	        </div>
	        <div class="carousel-item">
	            <img src="${pageContext.request.contextPath}/assets/images/barca-3.jpg" class="d-block w-100" alt="Immagine 3">
	        </div>
	        <div class="carousel-item">
	            <img src="${pageContext.request.contextPath}/assets/images/barca-4.jpg" class="d-block w-100" alt="Immagine 3">
	        </div>
	        <div class="carousel-item">
	            <img src="${pageContext.request.contextPath}/assets/images/barca-5.jpg" class="d-block w-100" alt="Immagine 3">
	        </div>
	        <div class="carousel-item">
	            <img src="${pageContext.request.contextPath}/assets/images/barca-6.jpg" class="d-block w-100" alt="Immagine 3">
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

<div class="contact-section">
    <h3 class="contact-title">Contatti</h3>
    <ul class="contact-list">
        <li><strong>Telefono:</strong> +39 349 3262083</li>
        <li><strong>Email:</strong> ramagliagiuseppe@tiscali.it</li>
        <li><strong>Facebook:</strong> <a href="https://www.facebook.com/ramaglia.giuseppe" target="_blank">Giuseppe Ramaglia</a></li>
        <li><strong>Instagram:</strong> <a href="https://www.instagram.com" target="_blank">@ramagliagiuseppe</a></li>
    </ul>
</div>    
    
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

<%@ include file="/src/views/fragments/footer.jsp" %>