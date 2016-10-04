package com.voting;

import com.database.conn.Methods;
import java.io.IOException;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

/* CLASS FOR EXIT POLLING PROCESS TO APPLICATION */

public class Exit extends HttpServlet
{

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
    	String booth_no=req.getParameter("b_no");
    	System.out.println("booth code="+booth_no);
    	String pwd=req.getParameter("pwd");
    	System.out.println("password:"+pwd);
    	RequestDispatcher rd=null;
    	boolean flag=false;
    	try
    	{
			
    		/* FUNCTION CALL FOR CHECK MANAGER PASSWORD */
    		
    		flag=Methods.Checkpassword(booth_no,pwd);    	
			if(flag==true)
			{ 
				System.out.println("password changed");
				resp.sendRedirect("/onlinevote/Files/JSP/manager/Managerhome.jsp");
			}
			else
			{
				rd = req.getRequestDispatcher("Files/JSP/exit.jsp");
		        req.setAttribute("Status","Invalid Password");
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
