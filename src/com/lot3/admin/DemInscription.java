package com.lot3.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lot3.beans.DemEntreprise;
import com.lot3.beans.DemInstitution;
import com.lot3.beans.DemPersonne;
import com.lot3.beans.Institution;
import com.lot3.util.EntrepriseManager;
import com.lot3.util.InstitutionManager;
import com.lot3.util.PersonneManager;

import org.json.simple.JSONObject;


@WebServlet("/DemInscription")
public class DemInscription extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DemInscription() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//récupérer les types de demandes dans 3 dataSet
		List<DemInstitution> listeIns=new InstitutionManager().getDemIns();
		request.setAttribute("demInstitutions", listeIns);
		
		List<DemEntreprise> listeEnt=new EntrepriseManager().getDemEnt();
		request.setAttribute("demEntreprises", listeEnt);
		
		List<DemPersonne> listePer=new PersonneManager().getDemPer();
		request.setAttribute("demPersonnes", listePer);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/admin/demInscription.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String etat=request.getParameter("etat");
		String id=request.getParameter("id");
		String type=request.getParameter("type");
		
		String login,mdp;
		
		String resultat="";
		if(type.equals("inst")) {
			resultat=new InstitutionManager().majDemIns(id, etat);
		}
		else if(type.equals("entr")) {
			resultat=new EntrepriseManager().majDemEnt(id, etat);
		}else {
			resultat=new PersonneManager().majDemPer(id, etat);
		}
				
		
		response.setContentType("text");
		PrintWriter out = response.getWriter();
		out.println(resultat);
	}

}
