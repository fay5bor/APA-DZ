package com.younes.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.younes.bdd.ConnectionBdRessource;

/**
 * Servlet implementation class Catalogue
 */
@WebServlet("/Catalogue")
public class Catalogue extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int page = Integer.parseInt(Optional.ofNullable(request.getParameter("page")).orElse("1"));
		int perPage = 9;
		
		
        ConnectionBdRessource ressourceConnection = new ConnectionBdRessource();
        
        ArrayList<ArrayList> ressources = ressourceConnection.getPageRessources(1, perPage, page);
        int pages = (int)(Math.ceil((double)ressourceConnection.countRessources(1)/perPage)) ;
        request.setAttribute( "ressources", ressources );
        request.setAttribute( "pages", pages );
        request.setAttribute( "current", page );

		RequestDispatcher view=request.getRequestDispatcher("WEB-INF/views/catalogue.jsp");
		view.forward(request, response);
	}

}
