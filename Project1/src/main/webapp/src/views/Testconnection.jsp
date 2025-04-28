<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="javax.sql.DataSource" %>

<%
    String message="";
    Connection connection = null;

    try {
        // Ottieni il contesto iniziale
        Context initContext = new InitialContext();
        // Cerca la risorsa DataSource
        DataSource dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/RestauroDB");

        // Ottieni una connessione
        connection = dataSource.getConnection();

        if (connection != null) {
            message = "Connessione al database avvenuta con successo!";
        } else {
            message = "Connessione non riuscita.";
        }
    } catch (NamingException e) {
        message = "Errore nella ricerca del DataSource: " + e.getMessage();
    } catch (SQLException e) {
        message = "Errore nella connessione al database: " + e.getMessage();
    } finally {
        // Chiudi la connessione se è stata aperta
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                message += "<br/>Errore nella chiusura della connessione: " + e.getMessage();
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Test Connessione Database</title>
</head>
<body>
    <h1>Risultato del Test di Connessione</h1>
    <p><%= message %></p>
</body>
</html>