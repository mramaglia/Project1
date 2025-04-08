package com.mypackage.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mypackage.dao.ProductDAO;
import com.mypackage.model.Prodotto;

/**
 * Servlet implementation class StoresServlet
 */
@WebServlet("/StoresServlet")
public class StoresServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoresServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Recupera la lista dei prodotti dal database
        ProductDAO productDAO = new ProductDAO();
        List<Prodotto> products = productDAO.getAllProducts();

        // Aggiungi i prodotti come attributo alla richiesta
        request.setAttribute("products", products);

        // Invia la richiesta alla JSP
        request.getRequestDispatcher("/src/views/common/store.jsp").forward(request, response);

    }

}
