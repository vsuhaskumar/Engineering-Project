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

/* CLASS FOR EDIT BOOTH DETAILS FROM THE DATABASE */

public class EditBooth extends HttpServlet 
{
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	
/* METHOD FOR EDIT BOOTH DETAILS FROM DATABASE */	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException 
	{
		
		//RETRIVING VALUES FROM JSP
		
		String e_code=req.getParameter("b_code");
		System.out.println("code=+"+e_code);
		String b_reference_no=req.getParameter("b_reference_no");
		String e_m_name=req.getParameter("b_m_name");
		String b_id=req.getParameter("b_id");
		String b_pwd=req.getParameter("b_pwd");
		String d_code=req.getParameter("d_code");
		boolean flag=false;
		
		//FUNCTION CALL FOR EDIT BOOTH DETAILS
		
		flag=Methods.UpdateBooth(e_code,b_reference_no,e_m_name,b_id,b_pwd,d_code);
		
		
		if(flag==true)
		{
			resp.sendRedirect(req.getContextPath()+"/Files/JSP/officer/Booths.jsp");
		}
		DBConnection.closeResoures(rs,st,con);
		System.out.println("connection closed");
	}
}

