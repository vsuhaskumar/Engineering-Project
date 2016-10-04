package com.manager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/* CLASS FOR CANCEL THE ADDING DETAILS */

public class Vot_add_cancel extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{

		// EMPTY THE SESSION
		
		HttpSession ses=request.getSession(true);
		ses.setAttribute("temp_id_no",null);
		ses.setAttribute("temp_name",null);
		ses.setAttribute("temp_address",null);
		ses.setAttribute("temp_age",null);
		ses.setAttribute("temp_sex",null);
		ses.setAttribute("temp_position",null);
		ses.setAttribute("temp_vote_status",null);	
		response.sendRedirect(request.getContextPath()+"/Files/JSP/manager/VoterDetails.jsp");
	}
}