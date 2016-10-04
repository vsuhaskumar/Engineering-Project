
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
	<title>ADD BOOTH</title>
</head>

<%-- CONTENT OF THE PAGE--%>

<body>
<div id="content">
<center>
	<br><br>
	<img src="<%=request.getContextPath()%>/Files/images/Officer/addbooths.png">
	<br><br><br>
	<form action="<%=request.getContextPath()%>/AddBooth" >
		<table style="font-family: cambria; font-weight: bold;">
			<tr height="40">
				<td>REFERENCE NO</td>
				<td width=10%>:</td>
				<td><input type="text" name="b_reference_no" required="requried"></td>
			</tr>
			<tr height="40">
				<td>MANAGER NAME</td>
				<td width=10%>:</td>
				<td><input type="text" name="b_name" required="requried"></td>
			</tr>
			<tr height="40">
				<td>MANAGER ID</td>
				<td width=10%>:</td>
				<td><input type="text" name="b_id" required="requried"></td>
			</tr>
			<tr height="40">
				<td>PASSWORD</td>
				<td width=10%>:</td>
				<td><input type="password" name="b_pwd" required="requried"></td>
			</tr>
			<tr height="40"><td>DISTRICT</td><td width=10%>:</td>
				<td>
					<select name="d_code" style="width:155px">
					
					<%-- JAVA CODE FOR SELECTING DISTRICT NAME FROM THE DATABASE  --%>					
					
					<%!
						Connection con=DBConnection.getServerConnection();
						Statement st=null;	
					%>	
					<%	
						ResultSet rs=null;
						st=con.createStatement();
						rs=st.executeQuery("select E_D_code,E_D_name from m_electoral_district");	
						while(rs.next())
						{%>
  						<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
					<%	}System.out.println("this is first..."); 
					%>
					</select>
				</td>
			</tr>
		</table>
		<br><br>
		<input type="image" value="Submit"src="<%=request.getContextPath()%>/Files/images/Officer/add.png" 
  				onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/add-click.png'"
   	   		 	onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/add.png'">
		&emsp;&emsp;&emsp;
		<a href="<%=request.getContextPath()%>/Files/JSP/officer/Booths.jsp">
			<img src="<%=request.getContextPath()%>/Files/images/Officer/cancel.png"
				onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/cancel-click.png'"
 				onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/cancel.png'">
 		</a>   	   		 	
	</form>
</center>
</div>

<%-- JAVA CODE FOR ALERT MESSAGE --%>

<%
	String status=null;
	status=(String)request.getAttribute("Status");				
	if(status==null)
	{					
	}
	else
	{%>
		<script type="text/javascript">
			alert("Sorry, Reference Number already exists, Enter new Number");
		</script>
<%	}%>
</body>
</html>