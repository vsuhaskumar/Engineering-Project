package com.database.conn;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.database.conn.DBConnection;

/* CLASS FOR CREAT,DELETE,UPDATE DETAILS TO THE DATABASE */

public class Methods 
{
	static Connection con;
	static Statement st;
	static ResultSet rs;
	
/* METHOD FOR CHECK OFFICER USERNAME AND PASSWORD IN DATABASE */
	
	public static boolean Checkofficer(String name,String pass)throws ClassNotFoundException, SQLException
	{	
		boolean flag1 =false;		
		try
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			String str="select Admin_id,Admin_pwd from m_admin where Admin_id='"+name+"' and Admin_pwd='"+pass+"'";
			System.out.println(str);
			rs=st.executeQuery(str);
			
			while (rs.next()) 
			{
				String db_name = rs.getString(1);
				String db_pass = rs.getString(2);
				if(name.equals(db_name)&&(pass.equals(db_pass)))
				{
					flag1 =true;
					return flag1;
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return flag1;
	}
	
/* METHOD FOR CHANGE OFFICER PASSWORD IN DATABASE */
	
	public static boolean Changepass(String old_pass,String new_pass)
	{
		try
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			String sql="update m_admin set admin_pwd='"+new_pass+"' where admin_pwd='"+old_pass+"'";
			System.out.println("Sql....."+sql);
			st.executeUpdate(sql);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return true;
	}
	
/* METHOD FOR CHECK BOOTH MANAGER USERNAME AND PASSWORD IN DATABASE */
	
	public static boolean Checkmanager(String name,String pass)throws ClassNotFoundException, SQLException
	{	
		boolean flag1 =false;		
		try
		{
			System.out.println("on function call");
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			rs=st.executeQuery("select b_m_userid,b_m_pwd from m_booth_manager where b_m_userid='"+name+"' and b_m_pwd='"+pass+"'");
			while(rs.next()) 
			{
				String db_name = rs.getString(1);
				String db_pass = rs.getString(2);
				if(name.equals(db_name)&&(pass.equals(db_pass)))
				{
					flag1 =true;
					return flag1;
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return flag1;
	}
	
/* METHOD FOR CHANGE OFFICER PASSWORD IN DATABASE */
	
	public static boolean M_Changepass(String old_pass,String new_pass)
	{
		try
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			String sql="update m_booth_manager set b_m_pwd='"+new_pass+"' where b_m_pwd='"+old_pass+"'";
			System.out.println("Sql....."+sql);
			st.executeUpdate(sql);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return true;
	}
	
/* METHOD FOR SELECT ELECTION AREA DETAILS FROM THE DATABASE */
	
	public static ResultSet electionarea()throws ClassNotFoundException, SQLException
	{
		
		con=DBConnection.getServerConnection();
		st=con.createStatement();
		ResultSet rs=st.executeQuery("select E_D_code,E_D_name,E_D_district,E_D_state from m_electoral_district");
		return rs;
	}
	
/* METHOD FOR SELECT VOTER DETAILS FROM THE DATABASE */
	
	public static ResultSet Voterdetails(String Manager_id)throws ClassNotFoundException, SQLException
	{
		con=DBConnection.getServerConnection();
		st=con.createStatement();
		ResultSet rs,rs1;
		String booth_code=null;
		rs1=st.executeQuery("select b_code from m_booth_manager where b_m_userid='"+Manager_id+"'");
		while(rs1.next()) 
		{
			booth_code=rs1.getString(1);
		}
		rs=st.executeQuery("select * from m_voters where b_code='"+booth_code+"'");
		return rs;
	}
	
/* METHOD FOR SELECT CANDIDATE DETAILS FROM THE DATABASE */
	
	public static ResultSet candidatedetails()throws ClassNotFoundException, SQLException
	{		
		con=DBConnection.getServerConnection();
		st=con.createStatement();
		ResultSet rs=st.executeQuery("select m.C_code,m.C_name,c.E_D_name,m.C_age,m.C_symbol,m.C_party from m_candidate m left outer join m_electoral_district c on m.e_d_code=c.e_d_code");
		return rs;
	}
	
/* METHOD FOR SELECT BOOTH DETAILS FROM THE DATABASE */	
	
	public static ResultSet Boothdetails()throws ClassNotFoundException, SQLException
	{		
		con=DBConnection.getServerConnection();
		st=con.createStatement();
		ResultSet rs=st.executeQuery("select m.B_code,m.B_reference_no,d.E_D_name,d.E_D_state,m.B_M_name from m_booth_manager m left join m_electoral_district d on m.E_D_code=d.E_D_code");
		return rs;
	}
	
/* METHOD FOR SELECT BOOTH DETAILS FOR CORRESPONDING MANAGER ID FROM DATABASE */	
	
	public static ResultSet ManagerBooth(String man_id)throws ClassNotFoundException, SQLException
	{		
		con=DBConnection.getServerConnection();
		st=con.createStatement();
		ResultSet rs=st.executeQuery("select m.B_code,m.B_reference_no,d.E_D_name from m_booth_manager m left join m_electoral_district d on m.E_D_code=d.E_D_code where m.B_M_userid='"+man_id+"'");
		return rs;
	}	
	
/* METHOD FOR CHECK DISTRICT NAME FROM THE DATABASE */	
	
	public static boolean Checkdistrictname(String d_name)throws ClassNotFoundException, SQLException
	{	
		boolean flag1 =true;		
		try
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			rs=st.executeQuery("select E_D_name from m_electoral_district");
			while (rs.next()) 
			{
				String new_name = rs.getString(1);
				if(new_name.equals(d_name))
				{
					flag1 =false;
					return flag1;
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return flag1;
	}
	
/* METHOD FOR ADD DISTRICT DETAILS FROM THE DATABASE */	
	
	public static boolean Adddistrict(String name,String district,String state)
	{
		boolean flag=false;
		try 
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			String sql="insert m_electoral_district(E_D_name,E_D_district,E_D_state) values ('"+name+"','"+district+"','"+state+"')";
			System.out.println("Sql....."+sql);
			st.executeUpdate(sql);
			flag=true;
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return flag;
	}
	
/* METHOD FOR UPDATE DISTRICT DETAILS FROM THE DATABASE */
	
	public static boolean Updatedistrict(String code,String name,String district,String state)
	{
		boolean flag=false;
		try 
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			
			String sql="update m_electoral_district set E_D_name='"+name+"'," +
					"E_D_district='"+district+"',E_D_state='"+state+"' where E_D_code='"+code+"'";
					
			System.out.println("Sql....."+sql);
			st.executeUpdate(sql);
			flag=true;
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return flag;
	}
	
/* METHOD FOR DELETE DISTRICT DETAILS FROM THE DATABASE */	
	
	public static boolean DeleteDistrict(String code)
	{
		boolean flag=false;
		try 
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			String sql="delete from m_electoral_district where E_D_code='"+code+"'";
			System.out.println("Sql....."+sql);
			st.executeUpdate(sql);
			flag=true;
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return flag;
	}
	
/* METHOD FOR CHECK CANDIDATE DETAILS FROM THE DATABASE */	
	
	public static boolean CheckCandidate(String name,String district_code,String Party)throws ClassNotFoundException, SQLException
	{	
		boolean flag1 =true;		
		try
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			String sql="select c_name,E_D_code,c_party from m_candidate where c_name='"+name+"'|| c_party='"+Party+"' and E_D_code='"+district_code+"'  ";
			System.out.println(sql);
			rs=st.executeQuery(sql);
			flag1=rs.next();
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return flag1;
	}
	
/* METHOD FOR ADD CANDIDATE DETAILS TO THE DATABASE */
	
	public static boolean AddCandidate(String name,String address,String age,String district,String remarks,String party,String symbol)
	{
		boolean flag=false;
		try 
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			String sql="insert m_candidate(C_name,C_address,C_age,C_symbol,E_D_code,C_remarks,C_party) values ('"+name+"','"+address+"','"+age+"','"+symbol+"','"+district+"','"+remarks+"','"+party+"')";
			System.out.println("Sql....."+sql);
			st.executeUpdate(sql);
			flag=true;
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return flag;
	}
	
/* METHOD FOR DELETE CANDIDATE DETAILS FROM THE DATABASE */	
	
	public static boolean DeleteCandidates(String code)
	{
		boolean flag=false;
		try 
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			String sql="delete from m_candidate where C_code='"+code+"'";
			System.out.println("Sql....."+sql);
			st.executeUpdate(sql);
			flag=true;
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return flag;
	}

/* METHOD FOR UPDATE CANDIDATE DETAILS FROM THE DATABASE */	
	
	public static boolean UpdateCandidate(String temp_code,String temp_name,String temp_address,String temp_age,String temp_district_code,String temp_remarks,String temp_party,String temp_symbol)
	{
		boolean flag=false;
		try 
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();			
			String sql="update m_candidate set c_name='"+temp_name+"'," +
				"c_address='"+temp_address+"',c_age='"+temp_age+"'," +
				"e_d_code='"+temp_district_code+"',c_remarks='"+temp_remarks+"'," +
				"c_party='"+temp_party+"',c_symbol='"+temp_symbol+"' where c_code='"+temp_code+"'";
			System.out.println("Sql....."+sql);
			st.executeUpdate(sql);
			flag=true;
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return flag;
	}
	
/* METHOD FOR DELETE BOOTH DETAILS FROM THE DATABASE */	
	
	public static boolean DeleteBooth(String code)
	{
		boolean flag=false;
		try 
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			String sql="delete from m_booth_manager where B_code='"+code+"'";
			System.out.println("Sql....."+sql);
			st.executeUpdate(sql);
			flag=true;
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return flag;
	}
	
/* METHOD FOR CHECK BOOTH NUMBER FROM THE DATABASE */	
	
	public static boolean CheckBothNo(String ref_no)throws ClassNotFoundException, SQLException
	{	
		boolean flag1 =true;		
		try
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			rs=st.executeQuery("select B_reference_no from m_booth_manager");
			while (rs.next()) 
			{
				String new_name = rs.getString(1);
				if(new_name.equals(ref_no))
				{
					flag1 =false;
					return flag1;
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return flag1;
	}
	
/* METHOD FOR ADD BOOTH DETAILS TO THE DATABASE */	
	
	public static boolean AddBooth(String b_name,String b_id,String b_pwd,String d_code,String b_reference_no)
	{
		boolean flag=false;
		try 
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			String sql="insert m_booth_manager(B_M_name,B_M_userid,B_M_pwd,E_D_code,B_reference_no) values ('"+b_name+"','"+b_id+"','"+b_pwd+"','"+d_code+"','"+b_reference_no+"')";
			System.out.println("Sql....."+sql);
			st.executeUpdate(sql);
			flag=true;
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return flag;
	}
	
/* METHOD FOR UPDATE BOOTH DETAILS TO THE DATABASE */	
	
	public static boolean UpdateBooth(String e_code,String b_reference_no,String e_m_name,String b_id,String b_pwd,String d_code)
	{
		boolean flag=false;
		try 
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			String sql="update m_booth_manager set B_M_name='"+e_m_name+"',E_D_code='"+d_code+"',B_M_pwd='"+b_pwd+"'," +
					"B_M_userid='"+b_id+"',B_reference_no='"+b_reference_no+"' where B_code='"+e_code+"'";
					
			System.out.println("Sql....."+sql);
			st.executeUpdate(sql);
			flag=true;
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return flag;
	}
	
/* METHOD FOR ADD VOTER DETAILS TO THE DATABASE */	
	
	public static boolean Addvoter(String id,String name,String address,String sex,String age,int booth_code,String image,String position,String vote_status)throws ClassNotFoundException, SQLException
	{	
		boolean flag1 =false;		
		try
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();	
			System.out.println("booth_code="+booth_code);
			String sql="insert m_voters(V_id_no,V_name,V_address,V_sex,V_age,B_code,V_image,V_position,V_Vote_status) values ('"+id+"','"+name+"','"+address+"','"+sex+"','"+age+"','"+booth_code+"','"+image+"','"+position+"','"+vote_status+"')";
			System.out.println("Sql....."+sql);
			st.executeUpdate(sql);
			flag1=true;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return flag1;
	}
	
/* METHOD FOR CHECK VOTER DETAILS FROM THE DATABASE */	
	
	public static boolean Checkvoter(String ref_no)throws ClassNotFoundException, SQLException
	{	
		boolean flag1 =true;		
		try
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			rs=st.executeQuery("select v_id_no from m_voters where v_id_no='"+ref_no+"'");
			while (rs.next()) 
			{
				String new_name = rs.getString(1);
				if(new_name.equals(ref_no))
				{
					flag1 =false;
					return flag1;
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return flag1;
	}
	
/* METHOD FOR UPDATE VOTER DETAILS TO THE DATABASE */	
	
	public static boolean updatevoter(int code,String id,String name,String address,String sex,String age,int booth_code,String image,String position,String vote_status)throws ClassNotFoundException, SQLException
	{	
		boolean flag=false;
		try 
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			String sql="update m_voters set V_id_no='"+id+"'," +
				"V_name='"+name+"',V_address='"+address+"',V_sex='"+sex+"',V_age='"+age+"'," +
				"B_code='"+booth_code+"',V_image='"+image+"',V_position='"+position+"',V_Vote_status='"+vote_status+"'" +
				" where V_code='"+code+"'";
					
			System.out.println("Sql....."+sql);
			st.executeUpdate(sql);
			flag=true;
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return flag;
	}
	
/* METHOD FOR DELETE VOTER DETAILS FROM THE DATABASE */	
	
	public static boolean DeleteVoter(String code)
	{
		boolean flag=false;
		try 
		{
			con=DBConnection.getServerConnection();
			st=con.createStatement();
			String sql="delete from m_voters where V_code='"+code+"'";
			System.out.println("Sql....."+sql);
			st.executeUpdate(sql);
			flag=true;
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return flag;
	}
	
}