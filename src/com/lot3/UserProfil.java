package com.lot3;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lot3.beans.Chercheur;
import com.lot3.beans.Entreprise;
import com.lot3.beans.Institution;
import com.lot3.beans.Personne;
import com.lot3.beans.User;
import com.lot3.util.CompteManager;
import com.lot3.util.EntrepriseManager;
import com.lot3.util.InstitutionManager;
import com.lot3.util.PersonneManager;

@WebServlet("/UserProfil")
public class UserProfil extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserProfil() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User utilisateur=(User)session.getAttribute("utilisateur");
		switch (utilisateur.getType()) {
			case "institution" : 
				Institution i = new InstitutionManager().getProfil(utilisateur.getLogin());
				request.setAttribute( "institution", i );
				break;
			case "entreprise" : 
				Entreprise e = new EntrepriseManager().getProfil(utilisateur.getLogin());
				request.setAttribute( "entreprise", e );
				break;
			case "personne_physique" : 
				Personne p = new PersonneManager().getProfil(utilisateur.getLogin());
				request.setAttribute( "personne", p );
				break;
			case "chercheur" : 
				Chercheur c = new CompteManager().getProfilChercheur(utilisateur.getLogin());
				request.setAttribute( "chercheur", c );
				break;
		}
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/profil.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User utilisateur=(User)session.getAttribute("utilisateur");		
		request.setCharacterEncoding("UTF-8");
		String result;
		switch (utilisateur.getType()) {
			case "institution" : 
				result = new InstitutionManager().setProfil(request,utilisateur.getLogin());
				break;
			case "entreprise" : 
				result = new EntrepriseManager().setProfil(request,utilisateur.getLogin());
				break;
			case "personne_physique" :
				result = new PersonneManager().setProfil(request,utilisateur.getLogin());
				break;
			case "chercheur" :
				result = new CompteManager().setProfilChercheur(request,utilisateur.getLogin());				
				break;
		}
		this.getServletContext().getRequestDispatcher("/WEB-INF/welcome.jsp").forward(request, response);
	}

}
