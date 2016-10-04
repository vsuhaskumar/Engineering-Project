package com.voting;

import com.database.conn.Methods;
import java.io.IOException;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

/* CLASS FOR CHECK VOTER LOGIN ID */

public class Voterlogin extends HttpServlet
{

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
    	
    	String booth_no=(String)req.getSession().getAttribute("booth_no");
    	System.out.println("booth_no:"+booth_no);
    	String b_location=(String)req.getSession().getAttribute("b_location");
    	String voter_id=req.getParameter("voter_id");
    	System.out.println("java_voter_id:"+voter_id);
    	HttpSession pol=req.getSession(true);
     	pol.setAttribute("booth_no",booth_no);
     	pol.setAttribute("b_location",b_location);
     	req.getSession().setAttribute("voter_id",voter_id);
    	RequestDispatcher rd=null;
    	boolean flag=false;
    	try
    	{
			
    		//FUNCTION CALL FOR CHECK VOTER ID
    		
    		flag=Methods.Checkvoterid(voter_id);    	
			if(flag==true)
			{
				
				//FUNCTION CALL FOR CHECK VOTER ID BELONGS TO BOOTH OR NOT
				
				flag=Methods.Checkvoterbooth(voter_id,booth_no); 
				if(flag==true)
				{
					
					//FUNCTION CALL FOR CHECK VOTER STATUS
					
					flag=Methods.Checkvoterstatus(voter_id); 
					if(flag==true)
					{
						System.out.println("valid voter_id");
						resp.sendRedirect(req.getContextPath()+"/Files/JSP/Votingprocess.jsp?booth_no="+booth_no+"&b_location="+b_location);
					}
					else
					{
						rd = req.getRequestDispatcher("/index.jsp");
				        req.setAttribute("Status","You Already Polled");
				        rd.forward(req, resp);
					}
				}
				else
				{
					rd = req.getRequestDispatcher("/index.jsp");
			        req.setAttribute("Status","Voter id Number not belongs to this Booth");
			        rd.forward(req, resp);
				}
			}
			else
			{
				rd = req.getRequestDispatcher("/index.jsp");
		        req.setAttribute("Status","Voter id Number Wrong");
		        rd.forward(req, resp);
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
