package com.mypackage.servlets;
import com.mypackage.dao.UserDAOImpl;
import com.mypackage.model.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAOImpl userDAO = new UserDAOImpl();
        User user = userDAO.findUserByEmail(email, password);

        if (user!=null) {
            // Crea una nuova sessione
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            // Reindirizza alla servlet desiderata
            response.sendRedirect(request.getContextPath() + "/src/views/home.jsp");
        } else {
            // Autenticazione fallita
            response.sendRedirect(request.getContextPath() + "/src/views/common/accesso.jsp?error=true");
        }
    }

}
