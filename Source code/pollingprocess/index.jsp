
<%-- INDEX JSP OF THE POLLING PROCESS --%>

<%-- INCLUDING COMMON FILES AND JAVA PACKAGES --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- HEADER PART OF THE PAGE --%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>voting process</title>
</head>

<%-- JAVA SCRIPT FOR NO BACK BUTTON --%>

<SCRIPT type="text/javascript">
  	window.history.forward();
   	function noBack() { window.history.forward(); }
</SCRIPT>

<%-- INCLUDING CSS FILE --%>

<link rel="Stylesheet" type="text/css" href="home.css">

<%-- CONTENT OF THE PAGE--%>

<body background="<%=request.getContextPath()%>/Files/Images/index/bg.jpg">
<form action="<%=request.getContextPath()%>/Voterlogin" method="post">
<%
	String booth_no=request.getParameter("booth_no");
	String b_location=request.getParameter("b_location");
	String b_ref_no=request.getParameter("b_ref_no");
	System.out.println("booth no="+booth_no);
	System.out.println("Refference no="+b_ref_no);
	System.out.println("location="+b_location);
	if(booth_no==null)
	{
		HttpSession pol=request.getSession(true);
		booth_no=(String)pol.getAttribute("booth_no");
		b_location=(String)pol.getAttribute("b_location");
		b_ref_no=(String)pol.getAttribute("b_ref_no");
	}
	request.getSession().setAttribute("booth_no",booth_no);
	request.getSession().setAttribute("b_location",b_location);
	request.getSession().setAttribute("b_ref_no",b_ref_no);
%>
<div id="header">
	<br><br>
	<center>
		<br><br>
		<img src="<%=request.getContextPath()%>/Files/Images/index/logo-3.png"><br>
		<br><br><br><br>
	</center>																	
</div>
<center>
<div style="background-image: url(Files/Images/index/tashboard.png);
			width:400px;
			height:300px;
			width:400;
			height:300;">
<br>
<font style="font-family: cambria; font-weight: bold;">
BOOTH : <%=b_ref_no%>&emsp;
LOCATION : <%=b_location%><br><br>		
<img src="<%request.getContextPath();%>Files/Images/index/user.png" height="100" width="100">
</font>
<br><br>
<table style="font-family: cambria; font-weight: bold;">
	<tr>
		<td><b>VOTER ID</b></td>
		<td>&emsp;:&emsp;</td>
		<td><input type="text" name="voter_id" requried="requried" ></input></td>
	</tr>
</table><br>
<input type="image" name="image" value="<%=booth_no%>" src="<%=request.getContextPath()%>/Files/Images/index/enter.png"
		onmouseover="this.src='<%=request.getContextPath()%>/Files/Images/index/enter-click.png'"
 		onmouseout="this.src='<%=request.getContextPath()%>/Files/Images/index/enter.png'">
<br>

<%-- JAVA CODE FOR ALERT MESSAGE --%>

<%-- CHECK VOTER ID --%>

<%	String status=null;
	status=(String)request.getAttribute("Status");			
	if(status==null)
	{
		
	}
	else
{%>
<font style="font-family:cambria; font-weight:bold; color:red;">
	<%=status%>
</font>
<%}%>	

<%	String Encry=null;
Encry=(String)request.getAttribute("Encry");		
String A_Encry=(String)request.getAttribute("A_Encry");	
String D_Encry=(String)request.getAttribute("D_Encry");	
	if(Encry==null)
	{
		
	}
	else
{%>
<script type="text/javascript">
	alert(" BEFORE VOTING :<%=Encry%>                              AFTER VOTING :<%=A_Encry%>                                    AFTER ADDING:<%=D_Encry%>");
</script>
<%}Encry=null;%>
		 			
</div>
<font style="font-family:cambria; font-weight:bold; color:red;">
	<br><br><br><br><br>	
	<a href="<%=request.getContextPath()%>/Files/JSP/exit.jsp?booth_code=<%=booth_no%>"><u>EXIT</u></a>
	</font>
</center>
</form>
</body>
</html>