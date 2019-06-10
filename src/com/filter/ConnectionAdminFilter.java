package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lot3.beans.User;

public class ConnectionAdminFilter implements Filter {
	
    public static final String ATT_SESSION_USER = "utilisateur";
    public static final String HOME    = "/home";

	public void init( FilterConfig config ) throws ServletException {
		
    }

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("test fait");
		HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        
        HttpSession session = request.getSession();
        if(session.getAttribute("utilisateur")==null) {
        	response.sendRedirect( request.getContextPath() + HOME );
        }else {
        	if ( ((User)session.getAttribute( ATT_SESSION_USER )).getType().equals("adminA")||((User)session.getAttribute( ATT_SESSION_USER )).getType().equals("adminB") ) {
            	chain.doFilter( request, response );        	
            } else {
            	response.sendRedirect( request.getContextPath() + HOME );
            }
        }

	}

	public void destroy() {
		
    }

}
