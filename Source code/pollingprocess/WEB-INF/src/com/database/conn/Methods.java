package com.database.conn;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.database.conn.DBConnection;

public class Methods 
{
	static Connection con;
	static Statement st;
	static ResultSet rs;
	
/* METHOD FOR CHECK VOTER ID IN DATABASE */
	
	public static boolean Checkvoterid(String voter_id)throws ClassNotFoundException, SQLException
	{	
		boolean flag1 =false;		
		try
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			rs=st.executeQuery("select v_position,v_id_no from m_voters where v_id_no='"+voter_id+"'");
			while (rs.next()) 
			{
				String position = rs.getString(1);
				String id = rs.getString(2);
				System.out.println("position="+position);
				System.out.println("id="+id);				
				if(voter_id.equals(id)&&position.equals("available"))
				{
					flag1=true;
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return flag1;
	}	
	
	/* METHOD FOR CHECK VOTER ID IN BOOTH TABLE */	
	
	public static boolean Checkvoterbooth(String voter_id,String booth_no)throws ClassNotFoundException, SQLException
	{	
		boolean flag1 =false;		
		try
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			System.out.println("booth_no:"+booth_no);
			rs=st.executeQuery("select v_id_no,b_code from m_voters where b_code='"+booth_no+"'");
			while (rs.next()) 
			{
				String id = rs.getString(1);
				if(voter_id.equals(id))
				{
					flag1 =true;
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return flag1;
	}	
	
	/* METHOD FOR CHECK VOTER STATUS IN DATABASE */
	
	public static boolean Checkvoterstatus(String voter_id)throws ClassNotFoundException, SQLException
	{	
		boolean flag1 =false;		
		try
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			rs=st.executeQuery("select V_Vote_status from m_voters where v_id_no='"+voter_id+"'");
			while (rs.next()) 
			{
				String status = rs.getString(1);
				if(status.equals("pending"))
				{
					flag1 =true;
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return flag1;
	}	
	
	/* METHOD FOR SELECT CANDIDATE IN DATABASE */
	
	public static ResultSet selectcandidate(String location)throws ClassNotFoundException, SQLException
	{	
	//	ResultSet rs1=null;
		try
		{
			int district_code = 0;
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			rs=st.executeQuery("select e_d_code from m_electoral_district where e_d_name='"+location+"'");
			while (rs.next()) 
			{
				district_code = Integer.parseInt(rs.getString(1));
				System.out.println("method_district="+district_code);
			}
			rs=st.executeQuery("select c_symbol,c_name,c_code from m_candidate where e_d_code='"+district_code+"'");
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return rs;
	}	
	
	/* METHOD FOR CHECK BOOTH MANAGER PASSWORD IN DATABASE */	
	
	public static boolean Checkpassword(String b_id,String pwd)throws ClassNotFoundException, SQLException
	{	
	boolean flag =false;
	try
	{
		con=DBConnection.getServerConnection();
		st=con.createStatement();
		System.out.println("entered password="+pwd);
		rs=st.executeQuery("select b_m_pwd from m_booth_manager where b_code='"+b_id+"'");
		while (rs.next()) 
		{
			String b_pwd = rs.getString(1);
			System.out.println("password="+b_pwd);				
			if(pwd.equals(b_pwd))
			{
				System.out.println("password matched...");
				flag=true;
			}
		}
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
	return flag;
}	

}