package com.officer;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.conn.Methods;

/* CLASS FOR ADD BOOTH DETAILS TO THE DATABASE*/

public class AddBooth extends HttpServlet 
{
	
/* METHOD FOR ADD BOOTH DETAILS TO THE DATABASE */
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{	
		try
		{
			
			/* RETRIVING VALUES FROM JSP*/
			
			String b_name=req.getParameter("b_name");
			String b_id=req.getParameter("b_id");
			String b_pwd=req.getParameter("b_pwd");
			String d_code=req.getParameter("d_code");
			String b_reference_no=req.getParameter("b_reference_no");
			RequestDispatcher rd;
			
			/* FUNCTION CALL FOR CHECK BOOTH NO */
			
			boolean flag = Methods.CheckBothNo(b_reference_no);
			
			if(flag==true)
			{
				
				/* FUNCTION CALL FOR ADD BOOTH DETAILS */
				
				boolean flag1=Methods.AddBooth(b_name,b_id,b_pwd,d_code,b_reference_no);
				if(flag1)
				{
					res.sendRedirect(req.getContextPath()+"/Files/JSP/officer/Booths.jsp");
				}
			}
			else
			{
				rd=req.getRequestDispatcher("/Files/JSP/officer/AddBooth.jsp");
				req.setAttribute("Status", "Sorry, ref no already exists, Enter new no");
				rd.forward(req,res);
			}
		}
		catch(Exception e)
		{
		e.printStackTrace();	
		}
	}	
}	


