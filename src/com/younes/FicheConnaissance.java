package com.younes;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FicheConnaissance
 */
@WebServlet(description = "La fiche d'une connaissance pour afficher ses détails", urlPatterns = { "/FicheConnaissance" })
public class FicheConnaissance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public FicheConnaissance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("path", "Source Categorie > Source Name > Connaissance");
		
		this.getServletContext().getRequestDispatcher( "/WEB-INF/views/FicheConnaissance.jsp" ).forward( request, response );
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
