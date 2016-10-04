
<%-- THIS JSP CONTENTS ARE COMMON FOR EVERY JSP FILES BELONGS TO MANAGER --%>

<%-- INCLUDING COMMON FILES AND JAVA PACKAGES --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>     
<%@page import="java.sql.*,com.database.conn.*"%>    
<%@page import="com.database.conn.DBConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- SCRIPT FOR NO BACK BUTTON --%>

<SCRIPT type="text/javascript">
  	window.history.forward();
   	function noBack() { window.history.forward(); }
</SCRIPT>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<%-- INCLUDING CSS FILE --%>

<link rel="Stylesheet" type="text/css" href="<%=request.getContextPath()%>/Files/CSS/Officer.css">

<%-- CONTENT OF THE PAGE --%>

<body background="<%=request.getContextPath()%>/Files/images/index/bg.jpg">
	
	<%-- HEADER PART FOR EVERY JSP FILES BELONGS TO MANAGER --%>
	
	<div id="header">
		<br><br>				
		<center>
			<img src="<%=request.getContextPath()%>/Files/images/index/logo-1.png"><br><br>
			<img src="<%=request.getContextPath()%>/Files/images/index/logo-2.png">
		</center>																	
	</div>
	
	<%-- LOGOUT AND CHANGE PASSWORD OPTIONS FOR MANAGER --%>	
	 
	<div align="right">
		<form action="<%=request.getContextPath()%>/Logout" method="post">
			<a href="<%=request.getContextPath()%>/Files/JSP/manager/Managerhome.jsp">
				<img src="<%=request.getContextPath()%>/Files/images/Manager/home.png" height="30" width="30"></a>
				<img src="<%=request.getContextPath()%>/Files/images/Manager/line.png" height="30" width="5">
			<a href="<%=request.getContextPath()%>/Files/JSP/manager/Manager_ChangePassword.jsp">
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
	
	<%-- JAVA CODE FOR RETRIVING VALUES FROM DATABASE --%>
	
	<%!
		Connection con=DBConnection.getServerConnection();
		Statement st=null;
		ResultSet rs=null;
		String b_no=null;
		String b_ref_no=null;
		String b_location=null;
	%>	
	<%
		String manager_id=(String)request.getSession().getAttribute("x_manager_id");
		rs=Methods.ManagerBooth(manager_id);
		while(rs.next())
		{
			b_no=rs.getString(1);
			b_ref_no=rs.getString(2);
			b_location=rs.getString(3);
		}		
	%>	
	
	<%-- OPTIONS BAR CONTENTS FOR MANAGER --%>
	
	<div id="sidebar">
		<center><br><br>
			<table>
				<tr>
					<td align="center">
						<img src="<%=request.getContextPath()%>/Files/images/index/manager.png" height="85" width="85"><br><br>
					</td>
				</tr>
				<tr>
					<td>
						<a href="<%=request.getContextPath()%>/Files/JSP/manager/VoterDetails.jsp" >	
   						<img src="<%=request.getContextPath()%>/Files/images/Manager/voterdetails.png" 
   							onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Manager/voterdetails-click.png'"
   	   	 					onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Manager/voterdetails.png'"/></a>
   	   	 			</td>
   	   	 		</tr>
   	   	 		<tr>
   	   	 			<td>
   	   	 				<form action="<%=request.getContextPath()%>/VotingProcess" method="post">	
   							<input type="image" src="<%=request.getContextPath()%>/Files/images/Manager/information.png" 
   									onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Manager/information-click.png'"
   	   	 							onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Manager/information.png'"/>
   	   	 				</form>
   	   	 			</td>
   	   	 		</tr>
   	   	 		<tr>
   	   	 			<td>
   	   	 				<form action="<%=request.getContextPath()%>/Currentstatus" method="post">	
   	   	 					<input type="hidden" name="booth_no" value="<%=b_no%>">
   							<input type="image" src="<%=request.getContextPath()%>/Files/images/Manager/currentstatus.png" 
   									onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Manager/currentstatus-click.png'"
   	   	 							onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Manager/currentstatus.png'"/>
   	   	 				</form>
   	   	 			</td>
   	   	 		</tr>
   	   	 		<tr>
   	   	 			<td>			
						<a href="/pollingprocess/index.jsp?booth_no=<%=b_no%>&b_ref_no=<%=b_ref_no%>&b_location=<%=b_location%>" >	
   							<img src="<%=request.getContextPath()%>/Files/images/Manager/votingprocess.png" 
   								onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Manager/votingprocess-click.png'"
   	   	 						onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Manager/votingprocess.png'"/></a>   	   	 				
   	   	 			</td>
   	   	 		</tr>	
   	   	 	</table>
		</center>		
	</div>
</body>
</html>