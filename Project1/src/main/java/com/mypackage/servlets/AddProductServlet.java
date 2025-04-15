package com.mypackage.servlets;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mypackage.dao.ProductDAO;
import com.mypackage.model.Prodotto;

/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet("/AddProductServlet")
@MultipartConfig
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    private static final String UPLOAD_DIR = "assets/images";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        
        System.out.println(request.getParameter("nome"));
        System.out.println(request.getParameter("descrizione"));
        System.out.println(request.getParameter("prezzo"));
        System.out.println(request.getParameter("quantita"));
        System.out.println(request.getParameter("categoria"));

        String nome = request.getParameter("nome");
        String descrizione = request.getParameter("descrizione");
        int prezzo = Integer.parseInt(request.getParameter("prezzo"));
        int quantita = Integer.parseInt(request.getParameter("quantita"));
        String categoria = request.getParameter("categoria");

        // Gestione upload immagine
        Part filePart = request.getPart("immagine");
        String fileName = new File(filePart.getSubmittedFileName()).getName();

        String uploadPath = getServletContext().getRealPath("/assets/images");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            System.out.println("Directory non trovata!!!!!");
        }

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        // Crea il prodotto
        Prodotto prodotto = new Prodotto();
        prodotto.setNome(nome);
        prodotto.setDescrizione(descrizione);
        prodotto.setPrezzo(prezzo);
        prodotto.setQuantita(quantita);
        prodotto.setCategoria(categoria);
        prodotto.setImmagine("assets/images/" + fileName);

        // Salva nel database
        ProductDAO productDAO = new ProductDAO();
        productDAO.addProduct(prodotto);

        // Redirect allo store
        response.sendRedirect(request.getContextPath() + "//servlets/StoresServlet");
    }
    

}
