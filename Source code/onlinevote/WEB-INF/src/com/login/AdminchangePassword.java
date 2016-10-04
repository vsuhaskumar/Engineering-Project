package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.database.conn.DBConnection;
import com.database.conn.Methods;

/* CLASS FOR CNANGE ADMINISTRATOR PASSWORD */

public class AdminchangePassword extends HttpServlet 
{
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	
/* METHOD FOR CNANGE ADMINISTRATOR PASSWORD */	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException 
	{
		String m_admin_id=req.getParameter("id");
		String m_old_pass=req.getParameter("old_pass");
		String m_new_pass=req.getParameter("new_pass");
		String m_re_pass=req.getParameter("re_pass");
		RequestDispatcher rd=null;
		boolean flag=false;
		try
		{
			//FUNCTION CALL FOR CHECK OFFICER USERNAME AND PASSWORD
			flag=Methods.Checkofficer(m_admin_id, m_old_pass);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		System.out.println("Flag..."+flag);
		if(flag==true)
		{	
			//FUNCTION CALL FOR CHANGE OFFICER USERNAME AND PASSWORD
			Methods.Changepass(m_old_pass, m_new_pass);
			resp.sendRedirect(req.getContextPath()+"/Files/JSP/officer/Officerhome.jsp");
		}
		else
		{
			rd=req.getRequestDispatcher("/Files/JSP/officer/Admin_ChangePassword.jsp");
			req.setAttribute("Status", "Sorry, your id and password is mismatched");
			rd.forward(req,resp);
		}
		DBConnection.closeResoures(rs,st,con);
		System.out.println("connection closed");
	}
}

