<%-- INCLUDING COMMON FILES AND JAVA PACKAGES --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Manager_content.jsp" %>     
<%@page import="java.sql.*,com.database.conn.*"%>  
<%@page import="com.paillier.*"%>   
<%@page import="java.math.BigInteger"%>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- HEADER PART OF THE PAGE --%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%-- INCLUDING JAVA SCRIPT FILE AND CSS FILE --%>

<link rel="Stylesheet" type="text/css" href="Officer.css">
</head>

<%-- CONTENT OF THE PAGE--%>

<body>

<div id="content">
<br><br>
<center>
<img src="<%=request.getContextPath()%>/Files/images/Manager/currentststus-logo.png">
<br><br>
	<table border="1" width="400" style="font-family: cambria; font-weight: bold;">
		<tr style="background-color:lightblue;color:black;">
			<td>CANDIDATE NAME</td>
			<td>NUMBER OF VOTES</td>
		</tr>

<%-- JAVA CODE FOR RETRIVING VALUES FROM DATABASE --%>

<%!
		Connection con1=null;
		Statement st1=null;
		ResultSet rs1,rs2=null;
		String sql1="";
		String sql2="";
		String e_d_code=null;
		BigInteger n=new BigInteger("0");
		String empty_code=null;
%>
<% 
		String booth_code=request.getParameter("booth_code");
		String no_votes=request.getParameter("no_votes");
		System.out.println("booth_code="+booth_code);
		sql1="select E_D_code from m_booth_manager where b_code='"+booth_code+"'";
		con1=DBConnection.getServerConnection();
		st1=con1.createStatement();
		rs1=st1.executeQuery(sql1);
		while(rs1.next())
		{
			e_d_code=rs1.getString(1);
		}
		sql2="select c.C_name,v.No_votes from m_candidate c left outer join m_votes v on c.C_code=v.C_code where c.E_D_code='"+e_d_code+"'";
		rs2=st1.executeQuery(sql2);	
		while(rs2.next())
		{%>				
		<tr>
			<td><%=rs2.getString(1)%></td>
			<%				
				if(rs2.getString(2)==null)
				{
					Paillier paillier=new Paillier();	
					n=paillier.Encryption(n);
					empty_code=n.toString();
				}
				else
				{
					empty_code=rs2.getString(2);
				}
			%>
			<td><input type="text" value="<%=empty_code%>" style="width:240px; color: red;" readonly="readonly"></td>
		</tr>
<%	}%>
	</table>
	<br>
	<font style="font-family:cambria; font-weight:bold; color:black;">
		TOTAL NUMBER OF VOTES :
	</font>
	<font style="font-family:cambria; font-weight:bold; color:red;">
		<u><%=no_votes%></u>	
	</font><br><br>
	<p>
		<font style="font-family:cambria; font-weight:bold; color:black;">
			NOTE :&emsp;
		</font>
		<font style="font-family:cambria; font-weight:bold; color:red;">
			USING HOMOMORPHIC ENCRYPTION TOTAL NUMBER OF VOTES ARE<br>
		</font>
	</p>
</center>
<font style="font-family:cambria; font-weight:bold; color:red;">
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
	SUMMED USING ENCRYPTED DATA WITHOUT DECRPTING<br>
</font>
</div>
</body>
</html>