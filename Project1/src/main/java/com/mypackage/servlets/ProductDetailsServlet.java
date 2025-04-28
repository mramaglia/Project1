package com.mypackage.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mypackage.dao.ProductDAO;
import com.mypackage.model.Prodotto;

/**
 * Servlet implementation class ProductDetailsServlet
 */
@WebServlet("/ProductDetailsServlet")
public class ProductDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        ProductDAO productDAO = new ProductDAO();
        Prodotto product = productDAO.getProductById(productId);

        // Prepara la risposta
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<h2>" + product.getNome() + "</h2>");
        out.println("<p><strong>Descrizione:</strong> " + product.getDescrizione() + "</p>");
        out.println("<p><strong>Prezzo:</strong> €" + product.getPrezzo() + "</p>");
        out.println("<p><strong>Quantità disponibile:</strong> " + product.getQuantita() + "</p>");
        out.println("<img src='" + request.getContextPath() + "/" + product.getImmagine() + "' alt='" + product.getNome() + "' class='product-image-detail' />");
    }
	
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
