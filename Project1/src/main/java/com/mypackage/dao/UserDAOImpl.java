package com.mypackage.dao;
import javax.naming.Context;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.mypackage.model.User;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UserDAOImpl implements UserDAO {

    private DataSource dataSource;

    public UserDAOImpl() {
        try {
            // Ottieni il contesto iniziale
            Context initContext = new InitialContext();
            // Cerca la risorsa DataSource
            dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/RestauroDB");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    
    public User findUserByEmail(String email, String password) {
        String sql = "SELECT * FROM utenti WHERE email = ?";
        User logged = null;

        try (Connection connection = dataSource.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
             
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("password");
                String storedName = rs.getString("nome");
                String storedEmail = rs.getString("email");
                
                // Verifica se la password fornita corrisponde a quella memorizzata
                if(hashPassword(password).equals(storedPassword)) {
                	logged=new User(storedName, storedEmail, storedPassword);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return logged;
    }
    
    @Override
    public boolean addUser (String username, String email, String password) {
        String sql = "INSERT INTO utenti (nome, email, password) VALUES (?, ?, ?)";
        boolean isAdded = false;

        // Hash della password
        String hashedPassword = hashPassword(password);

        try (Connection connection = dataSource.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
             
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, hashedPassword); // Memorizza la password hashata

            int rowsAffected = stmt.executeUpdate();
            isAdded = (rowsAffected > 0); // Se rowsAffected è maggiore di 0, l'utente è stato aggiunto
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isAdded;
    }
    
    static String hashPassword(String password) {
        try {
            return bytesToHex(MessageDigest.getInstance("SHA-256").digest(password.getBytes()));
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    private static String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }
    
}