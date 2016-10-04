
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
	<title>CANDIDATE DETAILS</title>
	<link rel="Stylesheet" type="text/css" href="Officer.css">
</head>

<%-- INCLUDING JAVA SCRIPT FILE --%>

<script type="text/javascript" src="<%=request.getContextPath()%>/Files/JS/checkbox.js"></script>

<%-- CONTENT OF THE PAGE --%>

<body>
<div id="content">
	<center><br><br>
		<form action="<%=request.getContextPath()%>/DeleteCandidates">
			<table border="1" width="700" style="font-family: cambria; font-weight: bold;">
				<tr style="background-color:black;color:white;"><td colspan="10" align="center">CANDIDATE DETAILS</td></tr>
				<tr style="background-color:lightblue;color:black;"><td width=5%;>SELECT</td><td>CODE</td><td>NAME</td><td>DISTRICT</td><td>AGE</td><td>PARTY</td><td>SYMBOL</td><td width=5%;>EDIT</td></tr>
				
				<%-- JAVA CODE FOR  RETRIVING RESULTSET FROM FUNCTION --%>
				
				<%ResultSet rs=Methods.candidatedetails();%>
				<%while(rs.next())
				{%>
				<tr>
					<td width=5% align="center"><input type="checkbox" name="code" value="<%=rs.getInt(1) %>"/></td>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(6) %></td>
					<td><center><img src="<%=request.getContextPath()%>/Files/images/Candidates/Symbol/<%=rs.getString(5)%>" height="30" width="30"></center></td>
					<td width=5% align="center">
						<a href="<%=request.getContextPath()%>/Files/JSP/officer/EditCandidate.jsp?code=<%=rs.getInt(1)%>">Edit</a>
					</td>	
				</tr>	
				<%}%>
			</table>
			<br><br>
			<a href="<%=request.getContextPath()%>/Files/JSP/officer/AddCandidate.jsp">
			<img src="<%=request.getContextPath()%>/Files/images/Officer/add.png"
				onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/add-click.png'"
 				onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/add.png'"></a>
 			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
 			<input type="image" value="Submit"src="<%=request.getContextPath()%>/Files/images/Officer/delete.png" 
  				onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/delete-click.png'"
   	   		 	onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/delete.png'"
   	   		 	onclick="return deletecandidate()">   	
		</form>
	</center>
</div>
</body>
</html>