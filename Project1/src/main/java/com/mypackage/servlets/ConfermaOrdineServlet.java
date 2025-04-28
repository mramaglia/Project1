package com.mypackage.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.mypackage.model.ProdottoCarrello;
import com.mypackage.model.User;


/**
 * Servlet implementation class ConfermaOrdineServlet
 */
@WebServlet("/ConfermaOrdineServlet")
public class ConfermaOrdineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private DataSource dataSource;
	
    public ConfermaOrdineServlet() {
    	 try {
             // Ottieni il contesto iniziale
             Context initContext = new InitialContext();
             // Cerca la risorsa DataSource
             dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/RestauroDB");
         } catch (NamingException e) {
             e.printStackTrace();
         }
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recupera la sessione e il carrello
        HttpSession session = request.getSession();
        List<ProdottoCarrello> cart = (List<ProdottoCarrello>) session.getAttribute("cart");
        double totaleCarrello = 0.0;
        
        for (ProdottoCarrello item : cart) {
	        totaleCarrello += item.getProdotto().getPrezzo() * item.getQuantita();
	    }
        
        User user = (User) session.getAttribute("user");

        if (cart == null || user == null) {
            response.sendRedirect(request.getContextPath() + "/src/views/common/accesso.jsp");
            return;
        }

        Connection conn = null;
        PreparedStatement orderStmt = null;
        PreparedStatement itemStmt = null;
        PreparedStatement updateStockStmt = null;
        ResultSet rs = null;

        try {
            // Ottieni la connessione al database
            conn = dataSource.getConnection();
            conn.setAutoCommit(false); // Inizia la transazione

            // Inserisci l'ordine nella tabella 'orders'
            String insertOrderSQL = "INSERT INTO ordini (id_utente, data_ordine, prezzo_totale, indirizzo_spedizione) VALUES (?, NOW(), ?, ?)";
            orderStmt = conn.prepareStatement(insertOrderSQL, Statement.RETURN_GENERATED_KEYS);
            orderStmt.setInt(1, user.getId());
            orderStmt.setDouble(2, totaleCarrello);
            orderStmt.setString(3,  request.getParameter("indirizzo"));
            orderStmt.executeUpdate();

            // Ottieni l'ID dell'ordine appena inserito
            rs = orderStmt.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // Inserisci ciascun prodotto nella tabella 'order_items'
            String insertItemSQL = "INSERT INTO prodotti_ordini (id_ordine, id_prodotto, quantita, prezzo) VALUES (?, ?, ?, ?)";
            itemStmt = conn.prepareStatement(insertItemSQL);
            for (ProdottoCarrello item : cart) {
                itemStmt.setInt(1, orderId);
                itemStmt.setInt(2, item.getProdotto().getId());
                itemStmt.setInt(3, item.getQuantita());
                itemStmt.setDouble(4, item.getProdotto().getPrezzo());
                itemStmt.addBatch();
            }
            itemStmt.executeBatch();

            // Aggiorna le quantità disponibili dei prodotti
            String updateQuantitaSQL = "UPDATE prodotti SET quantita = quantita - ? WHERE id = ?";
            updateStockStmt = conn.prepareStatement(updateQuantitaSQL);
            for (ProdottoCarrello item : cart) {
                updateStockStmt.setInt(1, item.getQuantita());
                updateStockStmt.setInt(2, item.getProdotto().getId());
                updateStockStmt.addBatch();
            }
            updateStockStmt.executeBatch();

            conn.commit(); // Conferma la transazione

            // Pulisce il carrello e reindirizza alla pagina di conferma
            session.removeAttribute("cart");
            response.sendRedirect(request.getContextPath() + "/src/views/common/profilo.jsp");
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback(); // Annulla la transazione in caso di errore
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            throw new ServletException("Errore durante il checkout", e);
        } finally {
            // Chiude le risorse
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (orderStmt != null) orderStmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (itemStmt != null) itemStmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (updateStockStmt != null) updateStockStmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }

}
