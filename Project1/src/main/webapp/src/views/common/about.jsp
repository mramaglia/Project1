<%@ include file="/src/views/fragments/header.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
            Giuseppe è un falegname e restauratore altamente qualificato con anni di esperienza nel settore,
            unendo la maestria della lavorazione del legno alla passione per il restauro. Con la continua ricerca
            di perfezione, ha sviluppato un'approfondita conoscenza delle tecniche tradizionali e moderne,
            che gli permettono di affrontare ogni progetto con precisione e dedizione, sempre con un occhio attento
            alla qualità e al rispetto delle caratteristiche originali del legno.
        </p>
    </div>
    <div class="image"></div>
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
    

</body>
</html>

<%@ include file="/src/views/fragments/footer.jsp" %>