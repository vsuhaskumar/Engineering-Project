package com.voting;

import java.io.IOException;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.conn.DAO;
import com.database.conn.DBConnection;
import com.paillier.Paillier;

/* CLASS FOR UPDATE VOTING DETAILS TO THE DATA BASE */

public class VoteCount extends HttpServlet 
{
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	boolean flag=false;
	String sql="";
	BigInteger x_vo;
	BigInteger c_vote;
	BigInteger m;
	String b_encry;
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{	
		try
		{
			String b_no=req.getParameter("b_no");
			String b_loc=req.getParameter("b_loc");
			String voter_id=req.getParameter("voter_id");
			String c_code=req.getParameter("vote_can");
			System.out.println("boothno="+b_no);
			System.out.println("location="+b_loc);   	
			System.out.println("voter_id="+voter_id);
			
			HttpSession session=req.getSession(false);
			// c_code=(String) session.getAttribute("vote_code");
			System.out.println("vote="+c_code);		
			
			//CREATE DATABAE CONNECTION			
			
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			sql="select No_votes from m_votes where C_code='"+c_code+"'";
			System.out.println("sql"+sql);
			rs=st.executeQuery(sql);			
			flag=rs.next();
			System.out.println("flag"+flag);
			Paillier paillier=new Paillier();
			if(flag==true)
			{				
				rs=st.executeQuery(sql);				
				while(rs.next())
				{					
					String m_vote=rs.getString(1);
					 c_vote=new BigInteger(m_vote);
					 b_encry=c_vote.toString();
					
										
					//FUNCTION CALL FOR PAILLIER DECRYPTION
					 x_vo =new BigInteger("1");
					x_vo=paillier.Encryption(x_vo);
					
					System.out.println(" x_vo : "+x_vo);
					
					c_vote=paillier.Addition(c_vote,x_vo);
				//	System.out.println("*****************************************  : "+c_vote);
					String x_vote =c_vote.toString();
					int i_vote=Integer.parseInt(x_vote);
					System.out.println("persion vote="+i_vote);
				
					 m= BigInteger.valueOf(i_vote);
					System.out.println(" m:"+m);
					
					//FUNCTION CALL FOR PAILLIER ENCRYPTION
					
					m=paillier.Encryption(m);
					System.out.println(" m:"+m);
					String no_of_votes=m.toString();
					System.out.println(" encrypt:"+no_of_votes);
					
					//FUNCTION CALL FOR UPDATE VOTE DETAILS TO THE DATA BASE
					
					flag=DAO.vote_encry_update(b_loc, c_code, voter_id, no_of_votes);					
				}
			}
			else
			{
				 if(c_vote==null)
				 {
					 c_vote =new BigInteger("0");
					 c_vote=paillier.Encryption(c_vote);
					 b_encry=c_vote.toString();
				 }
				x_vo= new BigInteger("1");
				x_vo=paillier.Encryption(x_vo);
				
				m=paillier.Addition(c_vote,x_vo);
				m=paillier.Encryption(m);
				String no_of_votes=m.toString();
				System.out.println(" m:"+m);
				System.out.println(" encrypt:"+no_of_votes);			
				
				//FUNCTION CALL FOR UPDATE VOTE DETAILS TO THE DATA BASE				
				
				flag=DAO.vote_endry(b_no, b_loc, c_code,voter_id, no_of_votes);
			}
			
			if(flag==true)
			{
				 RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
				// b_encry=b_encry.substring(0, b_encry.length());
				 String a_encry=x_vo.toString();
				 a_encry=a_encry.substring(0, a_encry.length());
				 
				 String result=m.toString();
				 result=result.substring(0, result.length());
				 req.setAttribute("Encry",b_encry );
				 req.setAttribute("A_Encry",x_vo.toString() );
				 req.setAttribute("D_Encry",m.toString() );
		         rd.forward(req, res);
			
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
	}
	
}	


