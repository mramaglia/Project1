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
import java.util.ArrayList;
import java.util.List;


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
            	int storedID = rs.getInt("id");
                String storedPassword = rs.getString("password");
                String storedName = rs.getString("nome");
                String storedEmail = rs.getString("email");
                boolean isAdmin = rs.getBoolean("isAdmin");
                
                // Verifica se la password fornita corrisponde a quella memorizzata
                if(hashPassword(password).equals(storedPassword)) {
                	logged=new User(storedID, storedName, storedEmail, storedPassword, isAdmin);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return logged;
    }
    
    @Override
    public boolean addUser (String username, String email, String password) {
        String sql = "INSERT INTO utenti (nome, email, password, isAdmin) VALUES (?, ?, ?, ?)";
        boolean isAdded = false;

        // Hash della password
        String hashedPassword = hashPassword(password);

        try (Connection connection = dataSource.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
             
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, hashedPassword); // Memorizza la password hashata
            stmt.setBoolean(4, false);

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
    
    public List<User> getAllUsers() {
        List<User> utenti = new ArrayList<>();
        String sql = "SELECT * FROM utenti ORDER BY data_iscrizione DESC";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("nome"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password")); // Se non ti serve, puoi ometterlo
                u.setAdmin(rs.getBoolean("isAdmin"));
                utenti.add(u);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return utenti;
    }
    
    public boolean emailExists(String email) {
        boolean exists = false;
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT 1 FROM utenti WHERE email = ? LIMIT 1")) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                exists = rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }


    
}