package com.lot3.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lot3.beans.Admin;
import com.lot3.beans.Institution;
import com.lot3.util.CompteManager;
import com.lot3.util.InstitutionManager;

@WebServlet("/institution")
@MultipartConfig
public class institution extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public institution() {
        super();        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Institution> liste=new InstitutionManager().getIns();
		request.setAttribute("institutions", liste);
		this.getServletContext().getRequestDispatcher("/WEB-INF/admin/institution.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InstitutionManager imanager=new InstitutionManager();
		String resultat=imanager.creIns(request,getServletContext().getRealPath("/profils"));
		
		request.setAttribute("creationOP", resultat);
		doGet(request, response);
	}

}
