package com.database.conn;

import java.sql.*;

/* CLASS FOR CREATE CONNECTION TO THE DATABASE */

public class DBConnection
{

/* METHOD FOR CREAT CONNECTION */	
	
    public static Connection getServerConnection()
    {
        Connection connection = null;
        try
        {       	
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/election_polling", "root", "admin");
            System.out.println("database connected");
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        catch(ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        return connection;
    }

/* METHOD FOR CLOSING THE CONNECTION */   
    
    public static void closeResoures(ResultSet rs, Statement st, Connection con)
    {
        if(rs != null)
            try
            {
                rs.close();
                rs = null;
            }
            catch(SQLException e1)
            {
                e1.printStackTrace();
            }
        if(st != null)
            try
            {
                st.close();
                st = null;
            }
            catch(SQLException e)
            {
                e.printStackTrace();
            }
        if(con != null)
            try
            {
                con.close();
                con = null;
            }
            catch(SQLException e)
            {
                e.printStackTrace();
            }
        System.out.println("connection closed");
    }
}
