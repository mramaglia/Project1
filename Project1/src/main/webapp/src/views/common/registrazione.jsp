<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mypackage.dao.UserDAOImpl" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrazione</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/registrazioneStyle.css">
    <script src="${pageContext.request.contextPath}/assets/script/validazioneRegistrazione.js" defer></script>
</head>
<body>
    <div class="registrazioneForm">
        <h2>Registrazione</h2>
        <form id="formRegistrazione" action="<%= request.getContextPath() %>/servlets/RegistrazioneServlet" method="post">
        
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <div id="errore-username" class="messaggio-errore"></div>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <div id="errore-email" class="messaggio-errore"></div>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <div id="errore-password" class="messaggio-errore"></div>

            <button type="submit">Registrati</button>
        </form>

		<% String successMessage = (String) request.getAttribute("successMessage"); %>
		<% String errorMessage = (String) request.getAttribute("errorMessage"); %>
		
		<% if (successMessage != null) { %>
		    <p class="success-message"><%= successMessage %></p>
		<% } %>
		
		<% if (errorMessage != null) { %>
		    <p class="error-message"><%= errorMessage %></p>
		<% } %>


        <div class="registerLink">
            <a href="accesso.jsp" class="accediButton">Già registrato? Accedi</a>
        </div>
    </div>

</body>
</html>