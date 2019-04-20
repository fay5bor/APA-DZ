package com.younes.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.younes.bdd.RessourceManager;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class Catalogue
 */
@WebServlet("/api/Catalogue")
public class CatalogueAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        
		JSONObject resultObj = new JSONObject();;
		JSONArray ressoucesArray = new JSONArray();
		try {
			for(ArrayList<String> ressouce : ressources) {
				JSONObject ressouceObj = new JSONObject();
				ressouceObj.put("nom", ressouce.get(0));
				ressouceObj.put("type", ressouce.get(1));
				ressouceObj.put("image", ressouce.get(2));
				ressoucesArray.put(ressouceObj);
			}
			resultObj.put( "pages", pages );
			resultObj.put("ressouces", ressoucesArray);

		}catch(JSONException e) {
			e.printStackTrace();
		}

		PrintWriter out = response.getWriter();
		out.println(resultObj);
	}

}
