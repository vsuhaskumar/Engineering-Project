package com.officer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.database.conn.DBConnection;
import com.database.conn.Methods;

/* CLASS FOR DELETE BOOTH DETAILS FROM DATABASE */

public class DeleteBooth extends HttpServlet 
{
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;

/* METHOD FOR DELETE BOOTH DETAILS FROM DATABASE */
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException 
	{
		String [] m_booth_code=req.getParameterValues("code");
		boolean flag=false;		
		if(m_booth_code!=null)
		{
			for (int i = 0; i < m_booth_code.length; i++) 
			{
				System.out.println("selected codes"+m_booth_code[i]);
			}			
		}
		if(m_booth_code!=null)
		{
			for (int i = 0; i < m_booth_code.length; i++) 
			{
				
				//FUNCTION CALL FOR DELETE BOOTH DETAILS
				
				flag=Methods.DeleteBooth(m_booth_code[i]);
			}			
		}	
		if(flag==true)
		{
			resp.sendRedirect(req.getContextPath()+"/Files/JSP/officer/Booths.jsp");
		}
		DBConnection.closeResoures(rs,st,con);
		System.out.println("connection closed");
	}
}


