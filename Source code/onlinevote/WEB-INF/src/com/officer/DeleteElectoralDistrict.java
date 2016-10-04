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

/* CLASS FOR DELETE ELECTORAL DISTRICT FROM DATABASE */

public class DeleteElectoralDistrict extends HttpServlet 
{
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException 
	{
		String [] m_District_code=req.getParameterValues("code");
		boolean flag=false;		
		if(m_District_code!=null)
		{
			for (int i = 0; i < m_District_code.length; i++) 
			{
				System.out.println("selected codes"+m_District_code[i]);
			}			
		}
		if(m_District_code!=null)
		{
			for (int i = 0; i < m_District_code.length; i++) 
			{
				
				//FUNCTION CALL FOR DELETE DISTRICT DETAILS
				
				flag=Methods.DeleteDistrict(m_District_code[i]);
			}			
		}	
		if(flag==true)
		{
			resp.sendRedirect(req.getContextPath()+"/Files/JSP/officer/Electoral_District.jsp");
		}
		DBConnection.closeResoures(rs,st,con);
		System.out.println("connection closed");
	}
}

