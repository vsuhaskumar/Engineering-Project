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

/* CLASS FOR SELECTING VOTING PROCESS DETAILS FROM THE DATABASE */

public class VotingProcess extends HttpServlet 
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
			String b_no=null;
			String b_ref_no=null;
			String temp_loc=null;
			String b_loc=null;
			int no_candidates=0;
			int no_voters=0;
			int no_votes=0;
			int i_vote=0;
			String enc_data=null;
			
			//RETRIVING MANAGER ID FROM THE SESSION
			
			String manager_id=(String)req.getSession().getAttribute("x_manager_id");
			
			/* SELECTING BOOTH CODE AND DISTRICT CODE FOR CORRESPONDING MANAGER ID */
			
			sql="select b_code,B_reference_no,e_d_code from m_booth_manager where b_m_userid='"+manager_id+"'";
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next())
			{
				b_no=rs.getString(1);
				b_ref_no=rs.getString(2);
				temp_loc=rs.getString(3);
			}
			
			/* SELECTING DISTRICT NAME FOR CORRESPONDING DISTRICT CODE */
			
			sql="select e_d_name from m_electoral_district where e_d_code='"+temp_loc+"'";
			rs=st.executeQuery(sql);
			while(rs.next())
			{
				b_loc=rs.getString(1);
				System.out.println("location="+b_loc);
			}
			
			/* SELECTING CANDIDATES FOR CORRESPONDING DISTRICT */
			
			sql="select c_code from m_candidate where e_d_code='"+temp_loc+"'";
			rs=st.executeQuery(sql);
			while(rs.next())
			{
				System.out.println("candidate of the district="+rs.getString(1));
				no_candidates++;
			}
			
			/* SELECTING VOTERS FOR CORRESPONDING BOOTH CODE */
			
			sql="select v_code from m_voters where B_code='"+b_no+"'";
			rs=st.executeQuery(sql);
			while(rs.next())
			{
				System.out.println("voter="+rs.getString(1));
				no_voters++;
			}
			
			/* SELECTING NUMBER OF VOTES FOR CORRESPONDING BOOTH CODE */			
			
			sql="select No_votes from m_votes where B_code='"+b_no+"'";
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
			
			/* FUNCTION CALL FOR ENCRPTION FOR TOTAL NUMBER OF VOTES BELONG TO THE BOOTH */
			
			if(no_votes>=1)
			{
			System.out.println("no of votes outside encryption="+no_votes);
			Paillier pail=new Paillier();					
			BigInteger m= BigInteger.valueOf(no_votes);
			System.out.println(" m:"+m);
			m=pail.Encryption(m);
			System.out.println(" m:"+m);
			enc_data=m.toString();
			System.out.println("encrypt:"+enc_data);
			}
			else
			{
				enc_data="0";
			}
			
			/* PASSING BOOTH CODE, BOOTH LOCATION , NUMBER OF CANDIDATES, NUMBER OF VOTERS, NUMBER OF VOTES, ENCRYPTED DATA TO VOTING PROCESS JSP*/
			
			res.sendRedirect(req.getContextPath()+"/Files/JSP/manager/information.jsp?booth_no="+b_no+"&b_ref_no="+b_ref_no+"&b_location="+b_loc+"&no_candidates="+no_candidates+"&no_voters="+no_voters+"&no_votes="+no_votes+"&enc_data="+enc_data+"");
		}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
	}
	
}	


