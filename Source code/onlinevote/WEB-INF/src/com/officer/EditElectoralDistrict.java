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

/* CLASS FOR EDIT ELECTORAL DISTRICT DETAILS FROM THE DATABASE */

public class EditElectoralDistrict extends HttpServlet 
{
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;

/* METHOD FOR EDIT ELETORAL DISTRICT DETAILS FROM DATABASE*/	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException 
	{
		
		//RETRIVING VALUES FROM JSP
		
		String  e_code=req.getParameter("e_code");
		String e_name=req.getParameter("e_name");
		String e_district=req.getParameter("e_district");
		String e_state=req.getParameter("e_state");
		boolean flag=false;
		
		//FUNCTION CALL EDIT DISTRICT DETAILS FROM DATABASE
		
		flag=Methods.Updatedistrict(e_code,e_name,e_district,e_state);
		if(flag==true)
		{
			resp.sendRedirect(req.getContextPath()+"/Files/JSP/officer/Electoral_District.jsp");
		}
		DBConnection.closeResoures(rs,st,con);
		System.out.println("connection closed");
	}
}
