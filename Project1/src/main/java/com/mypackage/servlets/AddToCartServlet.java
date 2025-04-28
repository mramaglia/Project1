package com.mypackage.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mypackage.dao.ProductDAO;
import com.mypackage.model.Prodotto;
import com.mypackage.model.ProdottoCarrello;



@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


    public AddToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int productId = Integer.parseInt(request.getParameter("productId"));
	    int quantita = Integer.parseInt(request.getParameter("quantita"));

	    // Recupera il prodotto dal DAO
	    ProductDAO dao = new ProductDAO();
	    Prodotto prodotto = dao.getProductById(productId);

	    // Recupera o crea il carrello dalla sessione
	    HttpSession session = request.getSession();
	    List<ProdottoCarrello> cart = (List<ProdottoCarrello>) session.getAttribute("cart");
	    if (cart == null) {
	        cart = new ArrayList<>();
	    }

	    // Verifica se l'articolo è già presente nel carrello
	    boolean found = false;
	    for (ProdottoCarrello item : cart) {
	        if (item.getProdotto().getId() == productId) {
	            item.setQuantita(item.getQuantita() + quantita);
	            found = true;
	            break;
	        }
	    }

	    // Se non trovato, aggiungilo
	    if (!found) {
	        cart.add(new ProdottoCarrello(prodotto, quantita));
	    }

	    session.setAttribute("cart", cart);
	    response.sendRedirect(request.getContextPath() + "/src/views/common/carrello.jsp");
	}


}
