package com.database.conn;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/* CLASS FOR CREATE CONNECTION TO THE DATABASE */

public class DAO 
{

	static Connection con=null;
	static Statement st=null;
	static ResultSet rs=null;
	static String sql="";
	
	/* METHOD FOR UPDATE VOTE TO THE DATABASE */	
	
	public static boolean vote_endry(String b_no,String b_loc,String c_code,String voter_id,String vote)
	{	
		try 
		{
			String e_d_code="";
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			sql="select e_d_code from m_electoral_district where e_d_name='"+b_loc+"'";
			System.out.println("sql:"+sql);
			rs=st.executeQuery(sql);
			while(rs.next())
			{
				e_d_code=rs.getString(1);
			}
			sql="insert into m_votes(C_code,B_code,E_D_code,No_votes) values ('"+c_code+"','"+b_no+"','"+e_d_code+"','"+vote+"')";
			int i=st.executeUpdate(sql);
			System.out.println("sql:"+sql);
			sql="update m_voters set v_vote_status='"+"polled"+"' where v_id_no='"+voter_id+"'";
			System.out.println("sql:"+sql);
			st.executeUpdate(sql);
			
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		
		return true;
		
	}
	
	/* METHOD FOR UPDATE VOTE TO THE DATABASE */
	
	public static boolean vote_encry_update(String b_loc,String c_code,String voter_id,String vote)
	{	
		try 
		{
			String e_d_code="";
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			sql="select e_d_code from m_electoral_district where e_d_name='"+b_loc+"'";
			System.out.println("sql:"+sql);
			rs=st.executeQuery(sql);
			while(rs.next())
			{
				e_d_code=rs.getString(1);
			}
			sql="update m_votes set No_votes='"+vote+"' where C_code='"+c_code+"'";
			int i=st.executeUpdate(sql);
			System.out.println("sql:"+sql);
			sql="update m_voters set v_vote_status='"+"polled"+"' where v_id_no='"+voter_id+"'";
			System.out.println("sql:"+sql);
			st.executeUpdate(sql);
			
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		
		return true;
		
	}
}
