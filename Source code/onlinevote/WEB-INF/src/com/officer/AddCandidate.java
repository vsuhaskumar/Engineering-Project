package com.officer;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.database.conn.Methods;

/* CLASS FOR ADD CANDIDATE DETAILS TO THE DATABASE*/

public class AddCandidate extends HttpServlet
{

    ServletInputStream sis=null;
 
/* METHOD FOR ADD CANDIDATE DETAILS TO THE DATABASE */	
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		
		/* RETRIVING VALUES FROM DATABASE */
    	
    	HttpSession ses=request.getSession(true);	
		String temp_name=request.getParameter("c_name");
		String temp_address=request.getParameter("c_address"); 
		String temp_age=request.getParameter("c_age");
		int age=Integer.parseInt(temp_age);
		if(age<10)
		{
			System.out.println("age is below 10");
		}
		String temp_district_code=request.getParameter("c_district");
		String temp_remarks=request.getParameter("c_remarks");
		String temp_party=request.getParameter("c_party");
		String temp_symbol=(String) ses.getAttribute("temp_symbol");
		try 
		{
			
			/* CHECK CANDIDATE NAME FROM THE DATABASE */
			
			boolean flag = Methods.CheckCandidate(temp_name,temp_district_code,temp_party);
			
			if(flag==false)
			{
				
				/* CREATING SESSION BEFORE ADDING CANDIDATE DETAILS TO THE DATABASE */
				
				ses.setAttribute("temp_name",temp_name);
				ses.setAttribute("temp_address",temp_address);
				ses.setAttribute("temp_age",temp_age);
				ses.setAttribute("temp_district_code",temp_district_code);
				ses.setAttribute("temp_remarks",temp_remarks);
				ses.setAttribute("temp_party",temp_party);	
				if(temp_symbol==null)
				{
					response.sendRedirect(request.getContextPath()+"/Files/JSP/officer/AddSymbol.jsp");
				}
				else
				{
					
					/* FUNCTION CALL FOR ADDING CANDIDATE DETAILS TO  THE DATABASE */
					
					flag=Methods.AddCandidate(temp_name,temp_address,temp_age,temp_district_code,temp_remarks,temp_party,temp_symbol);					
					if(flag==true && age>10)
					{
					
						//EMPTY SESSION VALUES AFTER ADDING CANDIDATE DETAILS TO  THE DATABASE
						
						ses.setAttribute("temp_name",null);
						ses.setAttribute("temp_address",null);
						ses.setAttribute("temp_age",null);
						ses.setAttribute("temp_district_code",null);
						ses.setAttribute("temp_remarks",null);
						ses.setAttribute("temp_party",null);	
						ses.setAttribute("temp_symbol",null);	
						response.sendRedirect(request.getContextPath()+"/Files/JSP/officer/Candidates.jsp");
					}
					else if(age<10)
					{
						RequestDispatcher rd;
						rd=request.getRequestDispatcher("/Files/JSP/officer/AddCandidate.jsp");
						request.setAttribute("Status", "Sorry, Age is below 18");
					}
				}
			}
			else
			{
				RequestDispatcher rd;
				rd=request.getRequestDispatcher("/Files/JSP/officer/AddCandidate.jsp");
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

