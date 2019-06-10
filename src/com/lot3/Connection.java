package com.lot3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lot3.beans.User;
import com.lot3.util.UserConnection;

public class Connection extends HttpServlet {
    public static final String ATT_USER         = "utilisateur";
    public static final String ATT_FORM         = "cnx";
    public static final String ATT_SESSION_USER = "utilisateur";
    public static final String VUE_LOGIN             = "/WEB-INF/login.jsp";
    public static final String VUE_HOME             = "/WEB-INF/welcome.jsp";
    public static final String VUE_ADMIN             = "/WEB-INF/admin/demInscription.jsp";

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher( VUE_LOGIN ).forward( request, response );
    }

    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
    	UserConnection cnx = new UserConnection();
        User utilisateur = cnx.connecterUtilisateur( request );
        HttpSession session = request.getSession();

        if ( cnx.getErreurs().isEmpty() ) {
            session.setAttribute( ATT_SESSION_USER, utilisateur );
            if(utilisateur.getType().equals("adminA")||utilisateur.getType().equals("adminB")) {
            	this.getServletContext().getRequestDispatcher( VUE_ADMIN ).forward( request, response );
            }
            else {
            	this.getServletContext().getRequestDispatcher( VUE_HOME ).forward( request, response );
            }     
        } else {
            session.setAttribute( ATT_SESSION_USER, null );           
            request.setAttribute( ATT_FORM, cnx );           
            this.getServletContext().getRequestDispatcher( VUE_HOME ).forward( request, response );
        }
    }
}