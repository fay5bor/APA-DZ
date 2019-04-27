package com.younes;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.younes.bdd.ConnaissanceMng;
import com.younes.beans.Connaissance;

import utils.Utils;

/**
 * Servlet implementation class FormConnaissance
 */
@WebServlet(description = "La page pour introduire une connaissance", urlPatterns = { "/FormConnaissance" })
/* TODO : on deployment change tmp path to C:\ for windows or / for linux */
@MultipartConfig(	
					fileSizeThreshold=1024*1024*10, 	// taille fichier pour qu'il soit mis en dossier temp : 10 MB 
					maxFileSize=1024*1024*25,      	// taille maximale d'un fichier : 25 MB
					maxRequestSize=1024*1024*25*2)   	// taille maximale dans une requête multipart : 50 MB

public class FormConnaissance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormConnaissance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getParameter("id_con") != null) {
			 
			Connaissance connaissance = ConnaissanceMng.getConnaissanceById(Integer.parseInt(request.getParameter("id_con")));
			request.setAttribute("connaissance", connaissance);
			
			int idRessource = connaissance.getIdRessource();	
			HashMap<String, String> pathMap = ConnaissanceMng.getConnaissancePath(idRessource);
			String categorie = pathMap.get("type");
			String ressource = pathMap.get("nom");
			request.setAttribute("path", categorie + " > " + ressource + " > " + connaissance.getTitre());
		} else {			
			if  (request.getParameter("id_ressource") == null) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
				return;
			}
			request.setAttribute("id_ressource", request.getParameter("id_ressource"));
			request.setAttribute("path", "Création d'une nouvelle connaissance");
		}
		
		this.getServletContext().getRequestDispatcher( "/WEB-INF/views/FormConnaissance.jsp" ).forward( request, response );
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idChercheur = 1;
		Connaissance connaissance = null;
			
		
		if ( request.getParameter("idRessource") != null ) { //Cas d'une nouvelle connaissance
			connaissance = new Connaissance();
			connaissance.setIdConnaissance(0);
			connaissance.setIdRessource(Integer.parseInt(request.getParameter("idRessource")));
			
			/* TODO : secure titre, type, resume entries */
			connaissance.setIdChercheur(idChercheur);
			connaissance.setTitre(request.getParameter("nomConnaissance"));
			connaissance.setType(request.getParameter("typeConnaissance"));
			//Ce ternaire est ajouter pour le cas où aucun résumé n'est introduit : on met null pour avoir la valeur par défault à l'affichage
			String resumeConnaissance = request.getParameter("resumeConnaissance").isEmpty() ? null : request.getParameter("resumeConnaissance");   
			connaissance.setResume(resumeConnaissance);
			connaissance.setContenu(request.getParameter("detailConnaissance"));
			
			Part idPhotoInput = request.getPart("id-photo-input");
			connaissance.setImg(Utils.ImageToByte(idPhotoInput));
			
			ConnaissanceMng.addConnaissance(connaissance);
			
		} else if ( request.getParameter("idConnaissance") != null ) { //Cas d'une modification de connaissance
			connaissance = ConnaissanceMng.getConnaissanceById(Integer.parseInt(request.getParameter("idConnaissance")));
			
			/* TODO : secure titre, type, resume entries */
			connaissance.setIdChercheur(idChercheur);
			connaissance.setTitre(request.getParameter("nomConnaissance"));
			connaissance.setType(request.getParameter("typeConnaissance"));
			
			//Ce ternaire est ajouter pour le cas où aucun résumé n'est introduit : on met null pour avoir la valeur par défault à l'affichage
			String resumeConnaissance = request.getParameter("resumeConnaissance") == "" ? null : request.getParameter("resumeConnaissance");   
			connaissance.setResume(resumeConnaissance);
			connaissance.setContenu(request.getParameter("detailConnaissance"));
			
			Part idPhotoInput = request.getPart("id-photo-input");
			connaissance.setImg(Utils.ImageToByte(idPhotoInput));
		} else { 
			// Normalement ce cas n'existe pas parce que dans la jsp on a if idRessource else idConnaissance mais je l'ai ajouté pour évité les imprévus
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		
		request.setAttribute("connaissance", connaissance);
	    this.getServletContext().getRequestDispatcher( "/FicheConnaissance").forward( request, response );
	}
	
	

}
