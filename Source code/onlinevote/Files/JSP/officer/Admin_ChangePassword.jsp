
<%-- INCLUDING COMMON FILES AND JAVA PACKAGES --%>   

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Common_content.jsp" %>
<%@page import="com.database.conn.DBConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- HEADER PART OF THE PAGE --%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>CHANGE PASSWORD</title>
</head>

<%-- INCLUDING JAVA SCRIPT FILE --%>

	<link rel="Stylesheet" type="text/css" href="Officer.css">

<%-- CONTENT OF THE PAGE--%>

<body>
<div id="content">
	<center>
		<br><br><br><br>
		<img src="<%=request.getContextPath()%>/Files/images/Officer/changepassword.png">
		<form action="<%=request.getContextPath()%>/AdminchangePassword" >
		
		<%-- JAVA CODE FOR SELECT ADMIN ID --%>		
		
		<%!
			Connection con=DBConnection.getServerConnection();
			Statement st=null;
			ResultSet rs=null;
		%>
		<%	
			st=con.createStatement();
			rs=st.executeQuery("select admin_id from m_admin");
		%>
			<br><br><br>
			<table style="font-family: cambria; font-weight: bold;">
			<% while(rs.next())
				{%>
				<tr height="30">
					<td ><b>Login Id</b></td>
					<td>:</td>
					<td><input type="text" name="id" value=<%=rs.getString(1)%>  style="color: #CDC9C9" readonly="readonly" ></input></td>
				</tr><%}%>
				<tr height="30">
					<td ><b>Old Password</b></td>
					<td>:</td>
					<td><input type="password" name="old_pass" requried="requried" ></input></td>
				</tr>
				<tr height="30">
					<td ><b>New Password</b></td>
					<td>:</td>
					<td><input type="password" name="new_pass" requried="requried" ></input></td>
				</tr>
				<tr height="30">
					<td ><b>Retype Password</b></td>
					<td>:</td>
					<td><input type="password" name="re_pass" requried="requried" ></input></td>
				</tr>
				<tr>
					<td>&emsp;</td>
				</tr>
				<tr height="50" >
					<td colspan="2" align="right">
					<input type="submit" name="login" value="submit"  ></input>
					</td>
					<td align="center"><input type="reset" name="reset" value="Reset"/></td>
				</tr>				
			</table>
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
			alert("Sorry,your Id and Password is mismatched");
		</script>
<%	}%>
</body>
</html>