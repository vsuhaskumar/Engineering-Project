
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
	<title>ELECTORAL DISTRICT</title>
</head>

<%-- INCLUDING JAVA SCRIPT FILE AND CSS FILE --%>

<link rel="Stylesheet" type="text/css" href="Officer.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/Files/JS/checkbox.js"></script>

<%-- CONTENT OF THE PAGE--%>

<body>
	<div id="content">
		<form action="<%=request.getContextPath()%>/DeleteElectoralDistrict">
		<center>
			<br><br>
			<table border="1" width="600" style="font-family: cambria; font-weight: bold;">
				<tr style="background-color:black;color:white;">
					<td colspan="10" align="center">ELECTORAL DISTRICT</td>
				</tr>
				<tr style="background-color:lightblue;color:black;"><td>SELECT</td><td>CODE</td><td>NAME</td><td>DISTRICT</td><td>STATE</td><td>EDIT</td></tr>
		
				<%-- JAVA CODE FOR  RETRIVING RESULTSET FROM FUNCTION CALL --%>
		
				<%	ResultSet rs=Methods.electionarea();
					while(rs.next())
					{%>
				<tr>
					<td width=5% align="center"><input type="checkbox" name="code" value="<%=rs.getInt(1) %>"/></td>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td width=5% align="center">
						<a href="<%=request.getContextPath()%>/Files/JSP/officer/EditElectoralDistrict.jsp?code=<%=rs.getInt(1)%>">Edit</a>
					</td>	
				</tr>	
				<%	} %>
			</table>
			<br><br>
			<a href="<%=request.getContextPath()%>/Files/JSP/officer/AddElectoralDistrict.jsp">
				<img src="<%=request.getContextPath()%>/Files/images/Officer/add.png"
					onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/add-click.png'"
 					onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/add.png'"></a>
 					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
 				<input type="image" value="Submit"src="<%=request.getContextPath()%>/Files/images/Officer/delete.png" 
  					onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/delete-click.png'"
   	   		 		onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/delete.png'"
   	   		 		onclick="return checkboxval()">
		</center>
	</form>
</div>
</body>
</html>