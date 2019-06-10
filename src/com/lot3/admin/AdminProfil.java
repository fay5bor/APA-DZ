package com.lot3.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lot3.beans.Admin;
import com.lot3.beans.Chercheur;
import com.lot3.beans.Entreprise;
import com.lot3.beans.Institution;
import com.lot3.beans.Personne;
import com.lot3.beans.User;
import com.lot3.util.CompteManager;
import com.lot3.util.EntrepriseManager;
import com.lot3.util.InstitutionManager;
import com.lot3.util.PersonneManager;

@WebServlet("/AdminProfil")
public class AdminProfil extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminProfil() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User utilisateur=(User)session.getAttribute("utilisateur");
		System.out.println(utilisateur);
		if (utilisateur.getType().equalsIgnoreCase("adminA") || utilisateur.getType().equalsIgnoreCase("adminB")) { 
				Admin admin = new CompteManager().getProfilAdmin(utilisateur.getLogin());
				request.setAttribute( "admin", admin );				
		}		
		this.getServletContext().getRequestDispatcher("/WEB-INF/admin/adminProfil.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User utilisateur=(User)session.getAttribute("utilisateur");		
		request.setCharacterEncoding("UTF-8");
		String result;
		if (utilisateur.getType().equalsIgnoreCase("adminA") || utilisateur.getType().equalsIgnoreCase("adminB")) {
				result = new CompteManager().setProfilAdmin(request,utilisateur.getLogin());
		}
		this.getServletContext().getRequestDispatcher("/WEB-INF/admin/demPermis.jsp").forward(request, response);
	}

}
