package com.younes.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.younes.bdd.RessourceManager;

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
		String[] regions = request.getParameterValues("region");
		ArrayList<String> regionsList = new ArrayList<String>();
		if(regions!=null) {
			regionsList = new ArrayList<String>(Arrays.asList(regions));
		}
		int page = 1;
		try {
			page =  (request.getParameter("page")==null) ? 1 : Integer.parseInt(request.getParameter("page"));
		}catch (NumberFormatException e) {
			page = 1;
		}
		int perPage = 12;
		
        
        ArrayList<ArrayList<String>> ressources = RessourceManager.getPageRessources(perPage, page, search, categoriesList, regionsList);
        int pages = (int)(Math.ceil((double)RessourceManager.countRessources(search, categoriesList)/perPage)) ;
        String catFiltre = ""  ;
       	for(String cat: categoriesList){
       		catFiltre+="categorie="+cat+"&";
       	}
       	String regionFiltre = ""  ;
       	for(String reg: regionsList){
       		regionFiltre+="region="+reg+"&";
       	}
        
        request.setAttribute( "ressources", ressources );
        request.setAttribute( "pages", pages );
        request.setAttribute( "catFiltre", catFiltre );
        request.setAttribute( "regionFiltre", regionFiltre );

		RequestDispatcher view=request.getRequestDispatcher("WEB-INF/views/catalogue.jsp");
		view.forward(request, response);
	}

}
