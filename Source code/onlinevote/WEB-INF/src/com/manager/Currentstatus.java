package com.manager;

import java.io.IOException;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.conn.DBConnection;
import com.paillier.Paillier;

/* CLASS FOR SELECTING VOTING CURRENT STATUS DETAILS FROM THE DATABASE */

public class Currentstatus extends HttpServlet 
{
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	String sql="";
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{	
		try
		{
			String b_no=req.getParameter("booth_no");
			int no_votes=0;	
			int i_vote=0;
			System.out.println("hey"+b_no);
			sql="select No_votes from m_votes where B_code='"+b_no+"'";
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			rs=st.executeQuery(sql);			
			while(rs.next())
			{				
				
				Paillier paillier=new Paillier();								
				BigInteger c_vote=new BigInteger(rs.getString(1));
			
				/* FUNCTION CALL FOR DECRPTION OF NUMBER OF VOTES FROM THE DATABASE */
			
				c_vote=paillier.Decryption(c_vote);
				String x_vote =c_vote.toString();
				i_vote=Integer.parseInt(x_vote);				
				no_votes=no_votes+i_vote;
			}
			
			/* PASSING NUMBER OF VOTES TO CURRENT STSTUS JSP*/
			
			res.sendRedirect(req.getContextPath()+"/Files/JSP/manager/Currentstatus.jsp?&no_votes="+no_votes+"&booth_code="+b_no+"");
		}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
	}
	
}	


