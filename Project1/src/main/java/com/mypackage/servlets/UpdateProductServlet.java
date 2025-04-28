package com.mypackage.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mypackage.dao.ProductDAO;
import com.mypackage.model.Prodotto;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
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

	
	
	 @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        
	        try {
	            // Recupera i parametri dal form
	            int id = Integer.parseInt(request.getParameter("id"));
	            String nome = request.getParameter("nome");
	            String descrizione = request.getParameter("descrizione");
	            int prezzo = Integer.parseInt(request.getParameter("prezzo"));
	            int quantita = Integer.parseInt(request.getParameter("quantita"));
	            String categoria = request.getParameter("categoria");

	            // Crea l'oggetto prodotto aggiornato
	            Prodotto prodotto = new Prodotto();
	            prodotto.setId(id);
	            prodotto.setNome(nome);
	            prodotto.setDescrizione(descrizione);
	            prodotto.setPrezzo(prezzo);
	            prodotto.setQuantita(quantita);
	            prodotto.setCategoria(categoria);

	            // Chiama il DAO per aggiornare il prodotto
	            ProductDAO productDAO = new ProductDAO();
	            boolean success = productDAO.updateProduct(prodotto);

	            if (success) {
	                response.sendRedirect(request.getContextPath() + "/servlets/StoresServlet");
	            } else {
	                request.setAttribute("error", "Errore nell'aggiornamento del prodotto.");
	                request.getRequestDispatcher("/servlets/StoresServlet").forward(request, response);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	            request.setAttribute("error", "Errore nella modifica del prodotto.");
	            request.getRequestDispatcher("/servlets/StoresServlet").forward(request, response);
	        }
	    }
	

}
