<%@ include file="fragments/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    
    <!-- Includi il CSS per la homepage -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/style.css">
</head>
<body>
    <div class="homepage-content">
        <h1>Welcome to San Giuseppe Artigiano!</h1>
        <p>This is the homepage of San Giuseppe Artigiano.</p>
        
         <img src="${pageContext.request.contextPath}/assets/images/restauro1.jpg" alt="Restauro" class="homepage-image-1">
    </div>
    
    <div class="frame">
      <div class="card">
        <div class="image"></div>
        <div class="copy">
          <div class="text-wrapper">Subheading</div>
          <p class="div">Body text for whatever you'd like to add more to the subheading.</p>
        </div>
      </div>
      <div class="card">
        <div class="image-2"></div>
        <div class="copy">
          <div class="text-wrapper">Subheading</div>
          <p class="div">Body text for whatever you'd like to expand on the main point.</p>
        </div>
      </div>
      <div class="card">
        <div class="image-3"></div>
        <div class="copy">
          <div class="text-wrapper">Subheading</div>
          <p class="div">Body text for whatever you'd like to share more.</p>
        </div>
      </div>
    </div>
    
</body>
</html>

<%@ include file="fragments/footer.jsp" %>
