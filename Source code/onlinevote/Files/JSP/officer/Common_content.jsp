
<%-- COMMON CONTENT FOR EVERY OFFICER JSP --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- HEADER PART OF THE PAGE --%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<%-- INCLUDING CSS FILE FOR JSP STYLE --%>

<link rel="Stylesheet" type="text/css" href="<%=request.getContextPath()%>/Files/CSS/Officer.css">

<%-- JAVA SCRIPT FOR NO BACK BUTTON --%>

<SCRIPT type="text/javascript">
  	window.history.forward();
   	function noBack() { window.history.forward(); }
</SCRIPT>

<%-- CONTENT OF THE PAGE--%>

<body background="<%=request.getContextPath()%>/Files/images/index/bg.jpg">
	
	<%-- CONTENT FOR HEADER PART ON THE PAGE --%>
	
	<div id="header">
		<br>				
		<center>
			<img src="<%=request.getContextPath()%>/Files/images/index/logo-1.png"><br><br>
			<img  src="<%=request.getContextPath()%>/Files/images/index/logo-2.png">
		</center>																	
	</div> 
	
	<%-- CONTENT FOR LOGOUT AND CHANGE PASSWORD FOR OFFICER --%>
	
	<div align="right">
		<form action="<%=request.getContextPath()%>/Logout" method="post">
			<a href="<%=request.getContextPath()%>/Files/JSP/officer/Officerhome.jsp">
			<img src="<%=request.getContextPath()%>/Files/images/Manager/home.png" height="30" width="30"></a>
			<img src="<%=request.getContextPath()%>/Files/images/Manager/line.png" height="30" width="5">
			<a href="<%=request.getContextPath()%>/Files/JSP/officer/Admin_ChangePassword.jsp">
				<img src="<%=request.getContextPath()%>/Files/images/Manager/changepwd.png"
					onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Manager/changepwd-click.png'"
   	   	 			onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Manager/changepwd.png'"></a>
			<img src="<%=request.getContextPath()%>/Files/images/Manager/line.png" height="30" width="5">		
			<input type="image" value="submit" src="<%=request.getContextPath()%>/Files/images/Manager/logout.png"
					onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Manager/logout-click.png'"
   	   	 			onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Manager/logout.png'">	
			&emsp;&emsp;
		</form>	
	</div>	
	
	<%-- CONTENT FOR OFFICER MANAGEMENT OPTIONS --%>
	
	<div id="sidebar">
		<center><br><br>
			<table>
				<tr>
					<td align="center">
						<img src="<%=request.getContextPath()%>/Files/images/index/officer.png" height="100" width="90"><br>
					</td>
				</tr>
				<tr>
					<td>
						<a href="<%=request.getContextPath()%>/Files/JSP/officer/Electoral_District.jsp" >	
			   				<img src="<%=request.getContextPath()%>/Files/images/Officer/electoraldistrict.png" 
   								onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/electoraldistrict-click.png'"
   	   	 						onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/electoraldistrict.png'"/></a>
   	   	 			</td>
   	   	 		</tr>
   	   	 		<tr>
   	   	 			<td>
   	   	 				<a href="<%=request.getContextPath()%>/Files/JSP/officer/Candidates.jsp">	
   							<img src="<%=request.getContextPath()%>/Files/images/Officer/candidates.png" 
   								onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/candidates-click.png'"
   	   	 						onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/candidates.png'"/></a>
   	   	 			</td>
   	   	 		</tr>
   	   	 		<tr>
   	   	 			<td>
   	   	 				<a href="<%=request.getContextPath()%>/Files/JSP/officer/Booths.jsp">	
   							<img src="<%=request.getContextPath()%>/Files/images/Officer/booths.png" 
   								onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/booths-click.png'"
   	   	 						onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/booths.png'"/></a>
   	   	 			</td>
   	   	 		</tr>
   	   	 		<tr>
   	   	 			<td>
   	   	 				<a href="<%=request.getContextPath()%>/Files/JSP/officer/ElectionResult.jsp">	
   							<img src="<%=request.getContextPath()%>/Files/images/Officer/results.png" 
   								onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/results-click.png'"
   	   	 						onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/results.png'"/></a>							   	   	 				
   	   	 			</td>
   	   	 		</tr>	
   	   	 	</table>
		</center><br>			
	</div>
</body>
</html>