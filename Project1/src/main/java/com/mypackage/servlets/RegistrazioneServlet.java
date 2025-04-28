package com.mypackage.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mypackage.dao.UserDAOImpl;

/**
 * Servlet implementation class RegistrazioneServlet
 */
@WebServlet("/RegistrazioneServlet")
public class RegistrazioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrazioneServlet() {
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    if (request.getMethod().equalsIgnoreCase("POST")) {
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        String email = request.getParameter("email");

	        // Crea un'istanza di UserDAOImpl
	        UserDAOImpl userDAO = new UserDAOImpl();

	        // Chiama il metodo addUser 
	        boolean isAdded = userDAO.addUser(username, email, password);
	        
	        if (isAdded) {
	            request.setAttribute("successMessage", "Registrazione avvenuta con successo!");
	        } else {
	            request.setAttribute("errorMessage", "Registrazione fallita. Riprova.");
	        }
	       
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/src/views/common/registrazione.jsp");
	        dispatcher.forward(request, response);

	    }
	}

}
