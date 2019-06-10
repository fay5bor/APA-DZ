package com.lot3;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Login() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String login = (String)request.getParameter("login");
	     String mdp = (String)request.getParameter("mdp");
	     HttpSession session = request.getSession();

	     if (login.equals("sidahmed") && mdp.equals("sidahmed")) 
	     {
	        session.setAttribute("login", login);
	        this.getServletContext().getRequestDispatcher("/WEB-INF/welcome.jsp").forward(request, response);
	     }
	     else {
	    	 /*request.setAttribute("login", login);
	    	 request.setAttribute("mdp", mdp);
	    	 this.getServletContext().getRequestDispatcher("/WEB-INF/welcome.jsp").forward(request, response);*/
	    	 this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	     }
	}

}
