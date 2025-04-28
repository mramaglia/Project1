package com.mypackage.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mypackage.dao.ProductDAO;

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductServlet() {
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



	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        try {
	            int id = Integer.parseInt(request.getParameter("id"));

	            ProductDAO productDAO = new ProductDAO();
	            boolean deleted = productDAO.deleteProductById(id);

	            if (deleted) {
	                response.sendRedirect(request.getContextPath() + "/servlets/StoresServlet");
	            } else {
	                request.setAttribute("error", "Errore nell'eliminazione del prodotto.");
	                request.getRequestDispatcher("/servlets/StoresServlet").forward(request, response);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            request.setAttribute("error", "Errore nella richiesta di eliminazione.");
	            request.getRequestDispatcher("/servlets/StoresServlet").forward(request, response);
	        }
	    }

}
