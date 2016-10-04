package com.officer;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.database.conn.Methods;

/* CLASS FOR ADD ELECTORAL DISTRICT DETAILS TO THE DATABASE */

public class AddElectoralDistrict extends HttpServlet 
{
	
/* METHOD FOR ADD ELECTORAL DETAILS TO THE DATABASE */	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{	
		try
		{
			
			/* RETRIVING VALUES FROM THE JSP */
		
			String d_name=req.getParameter("d_name");
			String d_district=req.getParameter("d_district");
			String d_state=req.getParameter("d_state");
			RequestDispatcher rd;
				
			/* CHECK DISTRICT DETAILS FROM THE DATABASE */
		
			boolean flag = Methods.Checkdistrictname(d_name);
			if(flag==true)
			{
				
				/* FUNCTION CALL FOR ADD DISTRICT DETAILS TO THE DATABASE */
			
				boolean flag1=Methods.Adddistrict(d_name,d_district,d_state);
				if(flag1)
					{
						res.sendRedirect(req.getContextPath()+"/Files/JSP/officer/Electoral_District.jsp");
					}
			}
			else
			{
				rd=req.getRequestDispatcher("/Files/JSP/officer/AddElectoralDistrict.jsp");
				req.setAttribute("Status", "Sorry, District Name already exists, Enter new name");
				rd.forward(req,res);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
	}	
}	


