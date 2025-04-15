package com.mypackage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.mypackage.model.Prodotto;

public class ProductDAO {
	
	private DataSource dataSource;
	
	public ProductDAO() {
        try {
            // Ottieni il contesto iniziale
            Context initContext = new InitialContext();
            // Cerca la risorsa DataSource
            dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/RestauroDB");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }
	
	
    public boolean addProduct (Prodotto prodotto) {
    	String query = "INSERT INTO prodotti (nome, descrizione, prezzo, quantita, immagine, categoria) VALUES (?, ?, ?, ?, ?, ?)";
        boolean isAdded = false;


        try (Connection connection = dataSource.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
             
            stmt.setString(1, prodotto.getNome());
            stmt.setString(2, prodotto.getDescrizione());
            stmt.setInt(3, prodotto.getPrezzo()); 
            stmt.setInt(4, prodotto.getQuantita());
            stmt.setString(5, prodotto.getImmagine());
            stmt.setString(6, prodotto.getCategoria());
            

            int rowsAffected = stmt.executeUpdate();
            isAdded = (rowsAffected > 0); // Se rowsAffected è maggiore di 0, il prodotto è stato aggiunto
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isAdded;
    }
    
    public List<Prodotto> getAllProducts() {
        List<Prodotto> prodotti = new ArrayList<>();

        String query = "SELECT * FROM prodotti";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Prodotto p = new Prodotto();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setDescrizione(rs.getString("descrizione"));
                p.setPrezzo(rs.getInt("prezzo"));
                p.setQuantita(rs.getInt("quantita"));
                p.setImmagine(rs.getString("immagine"));
                p.setCategoria(rs.getString("categoria"));

                prodotti.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // oppure log dell'errore
        }

        return prodotti;
    }
    
    public Prodotto getProductById(int id) {
    	
    	String query="SELECT * FROM prodotti WHERE id = ?";
    	
    	Prodotto prodotto = null;
    	
    	try (Connection connection = dataSource.getConnection(); 
    			PreparedStatement stmt = connection.prepareStatement(query)){
    		
    		stmt.setInt(1, id);
    		
    		ResultSet rs = stmt.executeQuery();
    		
    		if(rs.next()) {
    			 int storedId = rs.getInt("id");
    			 String storedNome= rs.getString("nome");
    			 String storedDescrizione= rs.getString("descrizione");
    			 int storedPrezzo= rs.getInt("prezzo");
    			 int storedQuantita= rs.getInt("id");
    			 String storedImmagine= rs.getString("immagine");
    			 String storedCategoria= rs.getString("categoria");
    			 
    			 prodotto = new Prodotto(storedId, storedNome, storedDescrizione, storedPrezzo, storedQuantita, storedImmagine, storedCategoria);
    		}
    		
    	} catch (SQLException e) {
            e.printStackTrace();
        }
    	
    	return prodotto;
    	
    }

}
