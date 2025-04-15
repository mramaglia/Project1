package com.mypackage.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
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

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recupera i parametri della richiesta
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String minPriceStr = request.getParameter("minPrice");
        String maxPriceStr = request.getParameter("maxPrice");

        // Converte i prezzi in double, se sono validi
        double minPrice = (minPriceStr != null && !minPriceStr.isEmpty()) ? Double.parseDouble(minPriceStr) : 0.0;
        double maxPrice = (maxPriceStr != null && !maxPriceStr.isEmpty()) ? Double.parseDouble(maxPriceStr) : Double.MAX_VALUE;

        // Recupera tutti i prodotti dal database
        ProductDAO productDAO = new ProductDAO();
        List<Prodotto> allProducts = productDAO.getAllProducts();

        // Lista dei prodotti che soddisfano i criteri del filtro
        List<Prodotto> filteredProducts = new ArrayList<>();

        // Applica i filtri sui prodotti
        for (Prodotto product : allProducts) {
            boolean matchesName = (name == null || name.isEmpty() || product.getNome().toLowerCase().contains(name.toLowerCase()));
            boolean matchesCategory = (category == null || category.isEmpty() || product.getCategoria().equalsIgnoreCase(category));
            boolean matchesPrice = (product.getPrezzo() >= minPrice && product.getPrezzo() <= maxPrice);

            if (matchesName && matchesCategory && matchesPrice) {
                filteredProducts.add(product);
            }
        }

        // Passa i prodotti filtrati alla JSP
        request.setAttribute("products", filteredProducts);

        // Forward alla JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("/src/views/common/store.jsp");
        dispatcher.forward(request, response);
    }
    
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
