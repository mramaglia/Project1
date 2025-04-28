package com.mypackage.dao;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.mypackage.model.Ordine;
import com.mypackage.model.Prodotto;
import com.mypackage.model.ProdottoCarrello;

import java.math.BigDecimal;

public class OrdineDAO {
    
    private DataSource dataSource;

    public OrdineDAO() {
    	try {
            // Ottieni il contesto iniziale
            Context initContext = new InitialContext();
            // Cerca la risorsa DataSource
            dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/RestauroDB");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public List<Ordine> getOrdiniByUtente(int userId) throws SQLException {
        List<Ordine> ordini = new ArrayList<>();

        String sqlOrdini = "SELECT * FROM ordini WHERE id_utente = ? ORDER BY data_ordine DESC";
        try (Connection connection = dataSource.getConnection();
        		PreparedStatement stmtOrdini = connection.prepareStatement(sqlOrdini)) {
            stmtOrdini.setInt(1, userId);
            ResultSet rsOrdini = stmtOrdini.executeQuery();

            while (rsOrdini.next()) {
                Ordine ordine = null;
                int ordineId = rsOrdini.getInt("id_ordine");
                int utenteId = rsOrdini.getInt("id_utente");
                Timestamp data = rsOrdini.getTimestamp("data_ordine");
                double prezzo = rsOrdini.getDouble("prezzo_totale");
                String indirizzo = rsOrdini.getString("indirizzo_spedizione");
                ordine = new Ordine(ordineId, utenteId, data, prezzo, indirizzo);
                
                ordini.add(ordine);
                
                
            }
        }

        return ordini;
    }

    public List<ProdottoCarrello> getProdottiByOrdine(int ordineId) throws SQLException {
        List<ProdottoCarrello> prodotti = new ArrayList<>();

        String sql = """
            SELECT p.id, p.nome, p.descrizione, p.prezzo, p.quantita AS stock, 
                   p.immagine, p.categoria, op.quantita AS quantita_acquistata
            FROM prodotti_ordini op
            JOIN prodotti p ON op.id_prodotto = p.id
            WHERE op.id_ordine = ?
        """;

        try (Connection connection = dataSource.getConnection();
        		PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, ordineId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Prodotto prodotto = new Prodotto();
                prodotto.setId(rs.getInt("id"));
                prodotto.setNome(rs.getString("nome"));
                prodotto.setDescrizione(rs.getString("descrizione"));
                prodotto.setPrezzo(rs.getInt("prezzo"));
                prodotto.setQuantita(rs.getInt("stock")); // quantità a magazzino
                prodotto.setImmagine(rs.getString("immagine"));
                prodotto.setCategoria(rs.getString("categoria"));

                ProdottoCarrello pc = new ProdottoCarrello();
                pc.setProdotto(prodotto);
                pc.setQuantita(rs.getInt("quantita_acquistata")); // quantità acquistata

                prodotti.add(pc);
            }
        }

        return prodotti;
    }
    
    public List<Ordine> getAllOrdini() {
        List<Ordine> ordini = new ArrayList<>();
        String sql = "SELECT * FROM ordini ORDER BY data_ordine DESC";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Ordine ordine = new Ordine();
                ordine.setId_ordine(rs.getInt("id_ordine"));
                ordine.setId_utente(rs.getInt("id_utente"));
                ordine.setIndirizzo(rs.getString("indirizzo_spedizione"));
                ordine.setData(rs.getTimestamp("data_ordine"));
                ordini.add(ordine);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ordini;
    }


}
