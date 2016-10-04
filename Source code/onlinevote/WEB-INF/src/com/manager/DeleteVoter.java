package com.manager;

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

/* CLASS FOR DELETE VOTER DETAILS FROM THE DATABASE */

public class DeleteVoter extends HttpServlet 
{
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	
/* METHOD FOR DELETE VOTER DETAILS FROM THE DATABASE */	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException 
	{
		String [] m_voter_code=req.getParameterValues("code");
		boolean flag=false;		
		if(m_voter_code!=null)
		{
			for (int i = 0; i < m_voter_code.length; i++) 
			{
				System.out.println("selected codes"+m_voter_code[i]);
			}			
		}
		if(m_voter_code!=null)
		{
			for (int i = 0; i < m_voter_code.length; i++) 
			{
				//FUNCTION CALL FOR DELETE VOTER DETAILS
				flag=Methods.DeleteVoter(m_voter_code[i]);
			}			
		}	
		if(flag==true)
		{
			resp.sendRedirect(req.getContextPath()+"/Files/JSP/manager/VoterDetails.jsp");
		}
		DBConnection.closeResoures(rs,st,con);
		System.out.println("connection closed");
	}
}


