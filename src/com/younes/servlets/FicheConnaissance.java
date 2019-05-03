package com.younes.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.younes.bdd.ConnaissanceMng;
import com.younes.beans.CarteConnaissance;
import com.younes.beans.Connaissance;

/**
 * Servlet implementation class FicheConnaissance
 */
@WebServlet(description = "La fiche d'une connaissance pour afficher ses d�tails", urlPatterns = { "/FicheConnaissance" })
public class FicheConnaissance extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String VUE = "/WEB-INF/views/FicheConnaissance.jsp";
       
	
    public FicheConnaissance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connaissance connaissance = (Connaissance) request.getAttribute("connaissance");

		int idConnaissance = connaissance == null ? ((request.getParameter("id_con") != null) ? Integer.parseInt(request.getParameter("id_con")) : -1) : connaissance.getIdConnaissance();

		
		if (idConnaissance == -1) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		
		if ( connaissance == null) {  
			
			
			connaissance = ConnaissanceMng.getConnaissanceById(idConnaissance);
			if (connaissance ==  null) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
				return;
			}

			request.setAttribute("connaissance", connaissance);
		}
		
		
		int idRessource = connaissance.getIdRessource();	
		HashMap<String, String> pathMap = ConnaissanceMng.getConnaissancePath(idRessource);
		String categorie = pathMap.get("type");
		String ressource = pathMap.get("nom");
		
		request.setAttribute("path", categorie + " > " + ressource + " > " + connaissance.getTitre());
		
		ArrayList<CarteConnaissance> cartes = ConnaissanceMng.getConnaissancesForRessource(idRessource, idConnaissance);
		request.setAttribute("cartes", cartes);
		
		this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}