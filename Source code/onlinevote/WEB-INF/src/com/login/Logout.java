package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/* CLASS FOR OFFICER LOGOUT  */

public class Logout extends HttpServlet
{

/* METHOD FOR INVALIDATE SESSION AND OFFICER LOGOUT  */
 
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		HttpSession session = ((HttpServletRequest)request).getSession(false);  
		session.invalidate();
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}
					
}

