
<%-- INCLUDING COMMON FILES AND JAVA PACKAGES --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- HEADER PART OF THE PAGE --%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>ENTER PASSWORD</title>
</head>

<%-- INCLUDING JAVA SCRIPT AND CSS FILES --%>

<SCRIPT type="text/javascript">
  	window.history.forward();
   	function noBack() { window.history.forward(); }
</SCRIPT>
<link rel="Stylesheet" type="text/css" href="home.css">

<%-- CONTENT OF THE PAGE--%>

<body background="<%=request.getContextPath()%>/Files/Images/index/bg.jpg">

<%-- HEADER PART OF THE CONTENT --%>

<div id="header">
	<br><br>
	<center>
		<br><br><br>
		<img src="<%=request.getContextPath()%>/Files/Images/index/logo-3.png"><br>
		<br><br><br><br>
	</center>																	
</div>
<form action="<%=request.getContextPath()%>/Exit" method="post">
<center>
<div style="background-image: url(<%=request.getContextPath()%>/Files/Images/index/tashboard.png);
			width:400px;
			height:300px;
			width:400;
			height:300;">
<br><br>
<img src="<%=request.getContextPath()%>/Files/Images/index/manager.png" height="100" width="100">
<br><br>

<%-- JAVA CODE FOR GET BOOTH CODE --%>

<%
	String booth_code=request.getParameter("booth_code");
	System.out.println("booth_code on exit JSP ="+booth_code);
%>
<table style="font-family: cambria; font-weight: bold;">
	<tr>
		<td><b>PASSWORD</b></td>
		<td><input type="hidden" name="b_no" value="<%=booth_code%>">&emsp;&emsp;</td>
		<td><input type="password" name="pwd" requried="requried" ></input></td>
	</tr>
</table>

<%-- JAVA CODE FOR ALERT MESSAGE --%>

<%	String status=null;
	status=(String)request.getAttribute("Status");			
	if(status==null)
	{%>
		<br><br>
	<%}
	else
{%>
<br>
<font style="font-family:cambria; font-weight:bold; color:red;">
	<%=status%><br><br>
</font>
<%}%>	
<input type="image" src="<%=request.getContextPath()%>/Files/Images/index/enter.png"
		onmouseover="this.src='<%=request.getContextPath()%>/Files/Images/index/enter-click.png'"
 		onmouseout="this.src='<%=request.getContextPath()%>/Files/Images/index/enter.png'">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 		
<a href="<%=request.getContextPath()%>/index.jsp">
	<img src="<%=request.getContextPath()%>/Files/Images/index/cancel.png"
			onmouseover="this.src='<%=request.getContextPath()%>/Files/Images/index/cancel-click.png'"		
			onmouseout="this.src='<%=request.getContextPath()%>/Files/Images/index/cancel.png'"></a>
</div>	 	
</center>
</form>			
</body>
</html>