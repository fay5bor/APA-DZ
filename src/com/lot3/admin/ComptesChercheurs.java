package com.lot3.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lot3.beans.Chercheur;
import com.lot3.util.CompteManager;

@WebServlet("/ComptesChercheurs")
@MultipartConfig
public class ComptesChercheurs extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ComptesChercheurs() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Chercheur> liste=new CompteManager().getCmpCher();
		request.setAttribute("cmpChercheurs", liste);
		this.getServletContext().getRequestDispatcher("/WEB-INF/admin/comptesChercheur.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getHeader("X-My-Header") != null) {
			String id=request.getParameter("id");
			String op=request.getParameter("op");
			CompteManager cpm=new CompteManager();
			if(op.equals("d")) {
				cpm.desableCompte(Integer.parseInt(id));
			}
			else cpm.enableCompte(Integer.parseInt(id));
		}
		else {
			CompteManager cpm=new CompteManager();
			cpm.creCptCher(request,getServletContext().getRealPath("/profils"));
			System.out.println("cration cbn");
			if(cpm.erreurs.isEmpty()) {
				request.setAttribute("creationOP", "success");
				doGet(request, response);
			}else {
				request.setAttribute("creationOP", cpm.erreurs.get("creation"));
				doGet(request, response);
			}
		}
	}

}
