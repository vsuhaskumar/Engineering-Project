package com.officer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/* CLASS FOR CANCEL EDIT CANDIDATE DETAILS */

public class Can_edit_cancel extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{

		//EMPTY THE SESSIONS
		
		HttpSession sess=request.getSession(true);
		sess.setAttribute("tp_code",null);
		sess.setAttribute("tp_name",null);
		sess.setAttribute("tp_address",null);
		sess.setAttribute("tp_age",null);
		sess.setAttribute("tp_district_code",null);
		sess.setAttribute("tp_remarks",null);
		sess.setAttribute("tp_party",null);	
		sess.setAttribute("tp_symbol",null);
		response.sendRedirect(request.getContextPath()+"/Files/JSP/officer/Candidates.jsp");
	}
}