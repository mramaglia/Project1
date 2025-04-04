<%@ include file="fragments/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="global.css" />
    <link rel="stylesheet" href="styleguide.css" />
    <link rel="stylesheet" href="style.css" />
    <title>Homepage</title>
    
    <!-- Includi il CSS per la homepage -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/style.css">
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
      <button class="button" onclick="window.location.href='${pageContext.request.contextPath}/src/views/common/contatti.jsp';"><div class="text-wrapper-2">Richiedi il preventivo per il tuo restauro</div></button>
    </div>
	
   
    
</body>
</html>

<%@ include file="fragments/footer.jsp" %>
