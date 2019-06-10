package com.lot3;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lot3.util.EntrepriseManager;
import com.lot3.util.InstitutionManager;
import com.lot3.util.PersonneManager;

@WebServlet("/SignIn")
@MultipartConfig
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String VUE_SIGNIN = "/WEB-INF/signin.jsp";
	public static final String VUE_HOME = "/WEB-INF/welcome.jsp";

    public SignIn() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher( VUE_SIGNIN ).forward( request, response );
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ty=request.getParameter("ty");
		String res=null;
		String path=getServletContext().getRealPath("/profils");
		System.out.println(path);
		if(ty.equals("institution")) {
			InstitutionManager ins=new InstitutionManager();
			res=ins.createDemInstitution(request,path);
		}else if(ty.equals("entreprise")) {
			EntrepriseManager ent=new EntrepriseManager();
			res=ent.createDemEntreprise(request,path);
		}else {
			PersonneManager per=new PersonneManager();
			res=per.createDemPersonne(request,path);
		}
		request.setAttribute("resultatCD", res);
		if(res==null) this.getServletContext().getRequestDispatcher( VUE_SIGNIN ).forward( request, response );
		else if(res.equals("Votre demande à été créée avec succès"))
			this.getServletContext().getRequestDispatcher( VUE_HOME ).forward( request, response );
		else this.getServletContext().getRequestDispatcher( VUE_SIGNIN ).forward( request, response );
	}

}
