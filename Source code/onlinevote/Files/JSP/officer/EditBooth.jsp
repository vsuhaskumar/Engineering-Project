
<%-- INCLUDING COMMON FILES AND JAVA PACKAGES --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Common_content.jsp" %>   
<%@page import="java.sql.*,com.database.conn.*"%>   
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- HEADER PART OF THE PAGE --%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>EDIT BOOTH</title>
</head>

<%-- INCLUDING JAVA SCRIPT FILE AND CSS FILE --%>

<link rel="Stylesheet" type="text/css" href="Officer.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/Files/JS/checkbox.js"></script>

<%-- CONTENT OF THE PAGE--%>

<body>
	<%!
		Connection con=DBConnection.getServerConnection();
		Statement st=null;	
		ResultSet rs=null;
		ResultSet rs1=null;
		ResultSet rs2=null;
	%>
	<div id="content">		
		<%	
			String b_code=request.getParameter("code");
			System.out.println("b_code="+b_code);	
		%>
		<center>
			<br><br>
			<img src="<%=request.getContextPath()%>/Files/images/Officer/editbooth.png">
			<br><br>
			
			<%-- JAVA CODE FOR SELECT BOOTH DEATAILS FROM DATABASE --%>
			
			<%
				st=con.createStatement();
				String sql="select * from m_booth_manager where B_code='"+b_code+"'";
				rs=st.executeQuery(sql);							
				while(rs.next())
				{%>	
					<form action="<%=request.getContextPath()%>/EditBooth" >
					<table style="font-family: cambria; font-weight: bold;">
					<tr height="40">
						<td>BOTH CODE</td>
						<td width=10%>:</td>
						<td><input type="text" name="b_code" required="requried" readonly="readonly" value="<%=rs.getString(1)%>"></td>
					</tr>
					<tr height="40">
						<td>REFERENCE NO</td>
						<td width=10%>:</td>
						<td><input type="text" name="b_reference_no" required="requried" value="<%=rs.getString(6)%>"></td>
					</tr>
					<tr height="40">
						<td>MANAGER NAME</td>
						<td width=10%>:</td>
						<td><input type="text" name="b_m_name" required="requried" value="<%=rs.getString(2)%>"></td>
					</tr>
					<tr height="40">
						<td>MANAGER ID</td>
						<td width=10%>:</td>
						<td><input type="text" name="b_id" required="requried" value="<%=rs.getString(3)%>"></td>
					</tr>
					<tr height="40">
						<td>PASSWORD</td>
						<td width=10%>:</td>
						<td><input type="password" name="b_pwd" required="requried" value="<%=rs.getString(4)%>"></td>
					</tr>
					<tr height="40">
						<td>DISTRICT</td>
						<td width=10%>:</td>
						<td>
						<select name="d_code" style="width:155px">
			
						<%-- JAVA CODE FOR DISTRICT NAMES --%>			
			
						<%		
							String code1=rs.getString(5);
							System.out.println("codecdode="+code1);
						%>		
						<%		
							String sql1="select E_D_code,E_D_name from m_electoral_district where E_D_code='"+code1+"'";
							System.out.println("sql="+sql1);
							st=con.createStatement();
							rs1=st.executeQuery(sql1);							
							while(rs1.next())
							{%>	
								<option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option>
						<%	}%>
			
						<%
							st=con.createStatement();
							rs2=st.executeQuery("select E_D_code,E_D_name from m_electoral_district where E_D_code not in ("+code1+")");	
							while(rs2.next())
							{%>
  								<option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
						<%	}System.out.println("this is first..."); %>				
						</select>
						<%}%>
						</td>
					</tr>
				</table>
				<br><br>
				<input type="image" value="Submit"src="<%=request.getContextPath()%>/Files/images/Officer/save.png" 
  					onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/save-click.png'"
   	   		 		onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/save.png'">
					&emsp;&emsp;&emsp;
				<a href="<%=request.getContextPath()%>/Files/JSP/officer/Booths.jsp">
					<img src="<%=request.getContextPath()%>/Files/images/Officer/cancel.png"
							onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/cancel-click.png'"
 							onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/cancel.png'">
 				</a>   	   		 	
			</form>
		</center>
	</div>
</body>
</html>