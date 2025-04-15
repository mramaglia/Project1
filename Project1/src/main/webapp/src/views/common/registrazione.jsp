<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mypackage.dao.UserDAOImpl" %>

<%
    String message = "";
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        // Crea un'istanza di UserDAOImpl
        UserDAOImpl userDAO = new UserDAOImpl();

        // Chiama il metodo addUser 
        boolean isAdded = userDAO.addUser(username, email, password);

        if (isAdded) {
            message = "Registrazione avvenuta con successo!";
        } else {
            message = "Errore: l'utente non è stato aggiunto";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Registrazione</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style/registrazioneStyle.css">
</head>
<body>
    <div class="registrazioneForm">
        <h2>Registrazione</h2>
        <form action="" method="POST">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <button type="submit">Registrati</button>
        </form>
        <p><%= message %></p>

        <!-- Link per reindirizzare alla pagina di login -->
        <div class="registerLink">
            <a href="accesso.jsp" class="accediButton">Già registrato? Accedi</a>
        </div>
    </div>
</body>
</html>