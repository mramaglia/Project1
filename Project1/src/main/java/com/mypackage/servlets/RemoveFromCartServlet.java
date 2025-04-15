package com.mypackage.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mypackage.model.ProdottoCarrello;

/**
 * Servlet implementation class RemoveFromCartServlet
 */
@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveFromCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recupera l'ID del prodotto da rimuovere dalla richiesta
        String productId = request.getParameter("productId");
        
        // Recupera il carrello dalla sessione
        HttpSession session = request.getSession();
        List<ProdottoCarrello> cart = (List<ProdottoCarrello>) session.getAttribute("cart");

        if (cart != null && !cart.isEmpty()) {
            // Trova e rimuovi il prodotto dal carrello
        	cart.removeIf(item -> item.getProdotto().getId() == Integer.parseInt(productId));

            // Riempi di nuovo la sessione con il carrello aggiornato
            session.setAttribute("cart", cart);
        }

        // Dopo la rimozione, reindirizza l'utente al carrello aggiornato
        response.sendRedirect(request.getContextPath() + "/src/views/common/carrello.jsp");
    }

}
