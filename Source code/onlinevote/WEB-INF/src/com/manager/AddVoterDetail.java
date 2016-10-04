package com.manager;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.database.conn.DBConnection;
import com.database.conn.Methods;

/* CLASS FOR ADD VOTER DETAILS TO THE DATABASE */

public class AddVoterDetail extends HttpServlet
{

    ServletInputStream sis=null;
 
/* METHOD FOR ADD VOTER DETAILS TO THE DATABASE */	
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		
    	//REDRIVING VALUES FROM JSP
		
    	HttpSession ses=request.getSession(true);	
		String temp_id_no=request.getParameter("v_id_no");
		String temp_name=request.getParameter("v_name"); 
		String temp_address=request.getParameter("v_address");
		String temp_age=request.getParameter("v_age");
		String temp_sex=request.getParameter("v_sex");
		String temp_position=request.getParameter("v_position");
		String temp_vote_status=request.getParameter("v_vote_status");
		String temp_photo=(String) ses.getAttribute("temp_photo");
		String x_manager_id=(String)ses.getAttribute("x_manager_id");
		try 
		{
			boolean flag = Methods.Checkvoter(temp_id_no);
			if(flag==true)
			{
				
				//CREATE SESSION VALUES FOR RETRIVED VALUES FROM JSP
				
				ses.setAttribute("temp_id_no",temp_id_no);
				ses.setAttribute("temp_name",temp_name);
				ses.setAttribute("temp_address",temp_address);
				ses.setAttribute("temp_age",temp_age);
				ses.setAttribute("temp_sex",temp_sex);
				ses.setAttribute("temp_position",temp_position);
				ses.setAttribute("temp_vote_status",temp_vote_status);	
				System.out.println("back=(Uploaddetails)"+temp_photo);
				
				if(temp_photo==null)
				{
					response.sendRedirect(request.getContextPath()+"/Files/JSP/manager/AddImage.jsp");
				}
				else
				{
					Connection con;
					Statement st;
					ResultSet rs;
					int booth_code=0;
					con=DBConnection.getServerConnection();
					st=con.createStatement();
					rs=st.executeQuery("select b_code from m_booth_manager where b_m_userid='"+x_manager_id+"'");
					while (rs.next()) 
					{
						booth_code=Integer.parseInt(rs.getString(1));
					}
					
					/* FUNCTION CALL FOR ADD VOTER DETAILS TO THE DATABASE*/
					
					flag=Methods.Addvoter(temp_id_no,temp_name,temp_address,temp_sex,temp_age,booth_code,temp_photo,temp_position,temp_vote_status);
					
					if(flag==true)
					{
						
						// EMPTY THE SESSION
						
						ses.setAttribute("temp_photo",null);
						ses.setAttribute("temp_id_no",null);
						ses.setAttribute("temp_name",null);
						ses.setAttribute("temp_address",null);
						ses.setAttribute("temp_age",null);
						ses.setAttribute("temp_sex",null);
						ses.setAttribute("temp_position",null);
						ses.setAttribute("temp_vote_status",null);
						response.sendRedirect(request.getContextPath()+"/Files/JSP/manager/VoterDetails.jsp");
					}
				}
			}
			else
			{
				RequestDispatcher rd;
				rd=request.getRequestDispatcher("/Files/JSP/manager/AddVoterDetail.jsp");
				request.setAttribute("Status", "Sorry, item Name already exists, Enter new item name");
				rd.forward(request,response);
			}
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{	
			e.printStackTrace();
		}
	}					
}

