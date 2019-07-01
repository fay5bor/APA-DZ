package com.younes.servlets;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.younes.bdd.RessourceManager;
import com.younes.utils.Utils;

/**
 * Servlet implementation class TestBDD
 */
@WebServlet("/TestBDD")
public class TestBDD extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
    public static final String ATT_MESSAGES = "messages";
    public static final String VUE          = "/WEB-INF/views/test_jdbc.jsp";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /* Initialisation de l'objet Java et récupération des messages */
		String fileSource = "/home/youneszadi/Bureau/Projet 2cs/images/plante.jpeg";
		byte [] byteImage = Utils.ImageToByte(new File(fileSource));				
		
		RessourceManager.deleteAllRessources();
        /* Exécution d'une requête de lecture */
        for (int i=0; i<100; i++) {
        	String nom= "nom_"+i;
    		String contenu ="contenu_"+i;
    		int type = 2;
        	if (i<20) {	   
	        	RessourceManager.addRessourceGen(nom, contenu, type, byteImage);
	        	
        	}else if (i< 40) {	        	
        		type = 3;
	        	RessourceManager.addRessourceGen(nom, contenu, type, null);	        	
        	}else if (i<60) {
        		type =2 ;
	        	RessourceManager.addRessourceGen(nom, contenu, type, null);
        	}else if (i<80) {
        		type = 2;
	        	RessourceManager.addRessourceGen(nom, contenu, type, byteImage);        	
	        }else {	        		
        		type = 3;
	        	RessourceManager.addRessourceGen(nom, contenu, type, null);        	}

        }
        /* Enregistrement de la liste des messages dans l'objet requête */
        request.setAttribute( ATT_MESSAGES, "succes" );
        
        /* Transmission vers la page en charge de l'affichage des résultats */
        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );	
	}
}
