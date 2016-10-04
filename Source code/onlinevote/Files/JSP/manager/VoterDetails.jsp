
<%-- INCLUDING COMMON FILES AND JAVA PACKAGES --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Manager_content.jsp" %>     
<%@page import="java.sql.*,com.database.conn.*"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- HEADER PART OF THE PAGE --%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Voter Details</title>
</head>

<%-- INCLUDING JAVA SCRIPT FILE AND CSS FILE --%>

<link rel="Stylesheet" type="text/css" href="Officer.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/Files/JS/checkbox.js"></script>

<body>

<%-- CONTENT OF THE PAGE --%>

<div id="content">
<form action="<%=request.getContextPath()%>/DeleteVoter" method="post">
	<center><br>
	<table border="1" width="750" style="font-family: cambria; font-weight: bold;">
		<tr style="background-color:black;color:white;"><td colspan="20" align="center">VOTER DETAILS</td></tr>
		<tr style="background-color:lightblue;color:black;"><td>SELECT</td><td>CODE</td><td>ID</td><td>NAME</td><td>ADDRESS</td><td>SEX</td><td>AGE</td><td>IMAGE</td><td>POSITION</td><td>VOTE STATUS</td><td>EDIT</td></tr>

<%-- RETRIVING MANAGER ID FROM SESSION WHICH WE STORED FROM LOGIN SERVLET--%>

<%		String x_manager_id=(String)session.getAttribute("x_manager_id"); 
		System.out.println("manage_id="+x_manager_id);
		ResultSet rs=Methods.Voterdetails(x_manager_id);
		
		//RETRIVING VALUES FROM DATABASE
		
		while(rs.next())
		{%>
		<tr>
			<td width=5% align="center"><input type="checkbox" name="code" value="<%=rs.getInt(1) %>"/></td>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><center><img src="<%=request.getContextPath()%>/Files/images/voters/<%=rs.getString(8)%>" height="30" width="30"></center></td>
			<td><%=rs.getString(9)%></td>
			<td><%=rs.getString(10)%></td>
			<td width=5% align="center">
				<a href="<%=request.getContextPath()%>/Files/JSP/manager/EditVoterDetail.jsp?code=<%=rs.getInt(1)%>">Edit</a>
			</td>	
		</tr>	
<%	} %>
	</table><br><br>
	<a href="<%=request.getContextPath()%>/Files/JSP/manager/AddVoterDetail.jsp">
	<img src="<%=request.getContextPath()%>/Files/images/Officer/add.png"
				onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/add-click.png'"
 				onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/add.png'"></a>
 	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
 	<input type="image" value="Submit"src="<%=request.getContextPath()%>/Files/images/Officer/delete.png" 
  				onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/delete-click.png'"
   	   		 	onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/delete.png'"
   	   		 	onclick="return checkboxvoter()">
	</center>
</form>
</div>
</body>
</html>