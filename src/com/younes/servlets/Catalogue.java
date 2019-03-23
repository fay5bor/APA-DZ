package com.younes.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
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
		String search = request.getParameter("search");
		String[] categories = request.getParameterValues("categorie");
		ArrayList<String> categoriesList = new ArrayList<String>();
		if(categories!=null) {
			categoriesList = new ArrayList<String>(Arrays.asList(categories));
		}

		int page = 1;
		try {
			page =  (request.getParameter("page")==null) ? 1 : Integer.parseInt(request.getParameter("page"));
		}catch (NumberFormatException e) {
			page = 1;
		}
		int perPage = 9;
		
        ConnectionBdRessource ressourceConnection = new ConnectionBdRessource();
        
        ArrayList<ArrayList> ressources = ressourceConnection.getPageRessources(perPage, page, search, categoriesList);
        int pages = (int)(Math.ceil((double)ressourceConnection.countRessources(search, categoriesList)/perPage)) ;
        request.setAttribute( "ressources", ressources );
        request.setAttribute( "pages", pages );
        request.setAttribute( "current", page );
        request.setAttribute( "search", search );
        request.setAttribute( "categorie", categoriesList );

		RequestDispatcher view=request.getRequestDispatcher("WEB-INF/views/catalogue.jsp");
		view.forward(request, response);
	}

}
