
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
<title>Information</title>
</head>

<%-- INCLUDING CSS FILE --%>

<link rel="Stylesheet" type="text/css" href="Officer.css">

<%-- CONTENT OF THE PAGE --%>

<body>
<div id="content">
<br><br>
<center><br>
<img src="<%=request.getContextPath()%>/Files/images/Manager/information-logo.png">
<br><br><br>
<table style="font-family: cambria; font-weight: bold; color: green;">
	<tr>
	<td>Booth Reference Number</td>
	<td>:</td>
	<td><input type="text" value="<%=request.getParameter("b_ref_no")%>" readonly="readonly"></input></td>
	</tr>
	<tr height="10"></tr>
	<tr>
	<td>Booth Location</td>
	<td>:</td>
	<td><input type="text" value="<%=request.getParameter("b_location")%>" readonly="readonly"></input></td>
	</tr>
	<tr height="10"></tr>
	<tr>
	<td>Number Of Candidates</td>
	<td>:</td>
	<td><input type="text" value="<%=request.getParameter("no_candidates")%>" readonly="readonly"></input></td>
	</tr>
	<tr height="10"></tr>
	<tr>
	<td>Number Of Voters</td>
	<td>:</td>
	<td><input type="text" value="<%=request.getParameter("no_voters")%>" readonly="readonly"></input></td>
	</tr>
</table>
</center>
</div>
</body>
</html>