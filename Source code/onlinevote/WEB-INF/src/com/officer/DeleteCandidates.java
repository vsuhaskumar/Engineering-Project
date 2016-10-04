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

/* CLASS FOR DELETE CANDIDATE DETAILS FROM DATABASE */

public class DeleteCandidates extends HttpServlet 
{
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	
/* METHOD FOR DELETE BOOTH DETAILS FROM DATABASE */	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException 
	{
		String [] m_candidate_code=req.getParameterValues("code");
		boolean flag=false;
		
		if(m_candidate_code!=null)
		{
			for (int i = 0; i < m_candidate_code.length; i++) 
			{
				System.out.println("selected codes"+m_candidate_code[i]);
			}			
		}
		if(m_candidate_code!=null)
		{
			for (int i = 0; i < m_candidate_code.length; i++) 
			{
				
				// FUNCTION CALL FOR DELETE CANDIDATE DETAILS FROM DATABASE 
				
				flag=Methods.DeleteCandidates(m_candidate_code[i]);
			}			
		}	
		if(flag==true)
		{
			resp.sendRedirect(req.getContextPath()+"/Files/JSP/officer/Candidates.jsp");
		}
		DBConnection.closeResoures(rs,st,con);
		System.out.println("connection closed");
	}
}


