
<%-- INCLUDING COMMON FILES AND JAVA PACKAGES --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Common_content.jsp" %>   
<%@page import="java.sql.*,com.database.conn.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- HEADER PART OF THE PAGE --%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>EDIT ELECTORAL DISTRICT</title>
</head>

<%-- INCLUDING CSS FILE --%>

<link rel="Stylesheet" type="text/css" href="Officer.css">

<%-- CONTENT OF THE PAGE--%>

<body>
	<div id="content">
	<%!
		Connection con=DBConnection.getServerConnection();
		Statement st=null;
		ResultSet rs=null;
	%>
	<%String m_code=request.getParameter("code");%>
	<form action="<%=request.getContextPath()%>/EditElectoralDistrict">
		<center>
		<br><br><br>
		<img src="<%=request.getContextPath()%>/Files/images/Officer/EDITelectroaLdistrict.png">
		<br><br>
		
		<%-- JAVA CODE FOR SELECTING ELECTORAL DISTRICT DETAILS FROM THE DATABASE  --%>
		
		<%
			st=con.createStatement();
			String sql="select * from m_electoral_district where E_D_code='"+m_code+"'";
			rs=st.executeQuery(sql);							
			while(rs.next())
			{%>	
				<table style="font-family: cambria; font-weight: bold;">
					<tr height="50">
						<td>CODE</td>
						<td width=10%>:</td>
						<td><input type="text" name="e_code" required="requried" readonly="readonly" value="<%=rs.getString(1)%>"></td>
					</tr>
					<tr height="50">
						<td>NAME</td>
						<td width=10%>:</td>
						<td><input type="text" name="e_name" required="requried" value="<%=rs.getString(2) %>"></td>
					</tr>
					<tr height="50">
						<td>DISTRICT</td>
						<td width=10%>:</td>
						<td><input type="text" name="e_district" required="requried" value="<%=rs.getString(3) %>"></td>
					</tr>
					<tr height="50">
						<td>STATE</td>
						<td width=10%>:</td>
						<td><input type="text" name="e_state" required="requried" value="<%=rs.getString(4)%>"></td>
					</tr>
				</table>
		<%	}%><br>
			<input type="image" value="Submit"src="<%=request.getContextPath()%>/Files/images/Officer/save.png" 
  				onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/save-click.png'"
   	   		 	onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/save.png'">
			&emsp;&emsp;&emsp;
			<a href="<%=request.getContextPath()%>/Files/JSP/officer/Electoral_District.jsp">
				<img src="<%=request.getContextPath()%>/Files/images/Officer/cancel.png"
					onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/cancel-click.png'"
	 				onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/cancel.png'">
 			</a>		
		</center>
	</form>	
</div>
</body>
</html>