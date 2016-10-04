package com.officer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/* CLASS FOR CANCEL THE ADD CANDIDATE DETAILS */

public class Can_add_cancel extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		
		//EMPTY THE SESSION
		
		HttpSession ses=request.getSession(true);
		ses.setAttribute("temp_name",null);
		ses.setAttribute("temp_address",null);
		ses.setAttribute("temp_age",null);
		ses.setAttribute("temp_district_code",null);
		ses.setAttribute("temp_remarks",null);
		ses.setAttribute("temp_party",null);	
		ses.setAttribute("temp_symbol",null);	
		response.sendRedirect(request.getContextPath()+"/Files/JSP/officer/Candidates.jsp");
	}
}