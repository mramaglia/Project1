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

        String query = "SELECT * FROM prodotti WHERE quantita>0";

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
    			 int storedQuantita= rs.getInt("quantita");
    			 String storedImmagine= rs.getString("immagine");
    			 String storedCategoria= rs.getString("categoria");
    			 
    			 prodotto = new Prodotto(storedId, storedNome, storedDescrizione, storedPrezzo, storedQuantita, storedImmagine, storedCategoria);
    		}
    		
    	} catch (SQLException e) {
            e.printStackTrace();
        }
    	
    	return prodotto;
    	
    }
    
    
    public boolean updateProduct(Prodotto prodotto) {
        String query = "UPDATE prodotti SET nome = ?, descrizione = ?, prezzo = ?, quantita = ?, categoria = ? WHERE id = ?";
        
        try (Connection con = dataSource.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setString(1, prodotto.getNome());
            ps.setString(2, prodotto.getDescrizione());
            ps.setDouble(3, prodotto.getPrezzo());
            ps.setInt(4, prodotto.getQuantita());
            ps.setString(5, prodotto.getCategoria());
            ps.setInt(6, prodotto.getId());
            
            int result = ps.executeUpdate();
            return result > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteProductById(int id) {
        String query = "DELETE FROM prodotti WHERE id = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, id);
            int result = stmt.executeUpdate();
            return result > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Prodotto> getUltimiProdotti(int quanti) {
        List<Prodotto> lista = new ArrayList<>();
        try (Connection conn = dataSource.getConnection()) {
            String sql = "SELECT * FROM prodotti ORDER BY data_creazione DESC LIMIT ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, quanti);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                	Prodotto p = new Prodotto();
                	p.setId(rs.getInt("id"));
                    p.setNome(rs.getString("nome"));
                    p.setDescrizione(rs.getString("descrizione"));
                    p.setPrezzo(rs.getInt("prezzo"));
                    p.setQuantita(rs.getInt("quantita"));
                    p.setImmagine(rs.getString("immagine"));
                    p.setCategoria(rs.getString("categoria"));
                    lista.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }


}
