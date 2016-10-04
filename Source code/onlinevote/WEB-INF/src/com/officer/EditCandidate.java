package com.officer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.conn.Methods;

/* CLASS FOR EDIT CANDIDATE DETAILS FROM THE DATABASE*/

public class EditCandidate extends HttpServlet
{

    ServletInputStream sis=null;
 
/* METHOD FOR EDIT CANDIDATE DETAILS FROM DATABASE */
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		
    	//RETRIVING VALUES FROM JSP
    	
		HttpSession sess=request.getSession(true);
		String tp_code=request.getParameter("c_code");
		String tp_name=request.getParameter("c_name");
		String tp_address=request.getParameter("c_address"); 
		String tp_age=request.getParameter("c_age");
		String tp_district_code=request.getParameter("c_district");
		String tp_remarks=request.getParameter("c_remarks");
		String tp_party=request.getParameter("c_party");
		String tp_symbol=(String) sess.getAttribute("tp_symbol");
		
		//CREATE SESSION FOR VALUES BEFORE ADDING IMAGE
		
		sess.setAttribute("tp_code",tp_code);
		sess.setAttribute("tp_name",tp_name);
		sess.setAttribute("tp_address",tp_address);
		sess.setAttribute("tp_age",tp_age);
		sess.setAttribute("tp_district_code",tp_district_code);
		sess.setAttribute("tp_remarks",tp_remarks);
		sess.setAttribute("tp_party",tp_party);	
		sess.setAttribute("tp_symbol",tp_symbol);		
		if(tp_symbol==null)
		{
			response.sendRedirect(request.getContextPath()+"/Files/JSP/officer/EditSymbol.jsp");
		}
		else
		{
			
			//FUNCTION CALL FOR EDIT CANDIDATE DETAILS FROM THE DATABASE
			
			boolean flag=Methods.UpdateCandidate(tp_code,tp_name,tp_address,tp_age,tp_district_code,tp_remarks,tp_party,tp_symbol);
			if(flag==true)
			{
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
	}					
}

