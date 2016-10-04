package com.officer;

import java.io.IOException;
import com.database.conn.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/* CLASS FOR ADD CANDIDATE DETAILS TO THE DATABASE*/

public class ElectionResult extends HttpServlet
{
 
/* METHOD FOR ADD CANDIDATE DETAILS TO THE DATABASE */	
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
    	try
		{
		
	
		/* RETRIVING VALUES FROM DATABASE */
    	
    
    	
		String temp_district=request.getParameter("district");
		System.out.println("java value="+temp_district);
		if(temp_district.equals("Select"))
		{
			RequestDispatcher rd;
			rd=request.getRequestDispatcher("/Files/JSP/officer/ElectionResult.jsp");
			request.setAttribute("Status","please select the district");
			rd.forward(request,response);
		}
		else
		{
			request.getSession().setAttribute("temp_district",temp_district);
			response.sendRedirect(request.getContextPath()+"/Files/JSP/officer/ElectionResult.jsp");			
		}
		}
    	catch (Exception e) 
    	{
    		e.printStackTrace();
		}
	}
					
}

