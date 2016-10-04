
<%-- INCLUDING COMMON FILES AND JAVA PACKAGES --%>   

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,com.database.conn.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- HEADER PART OF THE PAGE --%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>VOTING PROCESS</title>
</head>

<%-- JAVA SCRIPT FOR NO BACK BUTTON --%>

<SCRIPT type="text/javascript">
  	window.history.forward();
   	function noBack() { window.history.forward(); }
</SCRIPT>

<%-- JAVA SCRIPT FOR VOTE ALERT MESSAGE --%>

<SCRIPT type="text/javascript">
function Reset(vote)
{
	if(confirm('You Vote For '+vote+' Press ok to Confirm'))
  		return true;
  	else 
  		return false;	
}
</SCRIPT>

<%-- CONTENT OF THE PAGE--%>

<body background="<%=request.getContextPath()%>/Files/Images/index/bg.jpg">
<div id="header">
	<br><br>
	<center>
		<br>
		<img src="<%=request.getContextPath()%>/Files/Images/index/logo-3.png"><br>
		<br><br>
	</center>																	
</div>

<%-- JAVA CODE FOR GET BOOTH CODE VOTER ID AND LOCTION--%>

<%
	String booth_no=request.getParameter("booth_no");
	String b_location=request.getParameter("b_location");
	String voter_id=(String)request.getSession().getAttribute("voter_id");
	System.out.println("jsp_booth_no="+booth_no);
	System.out.println("jsp_location="+b_location);
	System.out.println("jsp_vote_id="+voter_id);
%>
<center>
<div style="background-image: url(<%=request.getContextPath()%>/Files/Images/voting/voteboard.png);
			width:550px;
			height:500px; 
			width:550;
			height:500;">
<br>		
<form action="<%=request.getContextPath()%>/VoteCount" method="get">
	<input type="hidden" name="b_no" value="<%=booth_no%>">
	<input type="hidden" name="b_loc" value="<%=b_location%>">
	<input type="hidden" name="voter_id" value="<%=voter_id%>">
	<table style="font-family: cambria; font-weight: bold;">
		<tr style="background-color:black;color:white;">
			<td colspan="20" align="center" >CANDIDATES</td>
		</tr>
		<tr height="10"></tr>
		<tr style="background-color:lightblue;color:black;">
			<td width="150" align="center">SYMBOL</td>
			<td width="200" align="center">CANDIDATE NAME</td>
			<td width="150" align="center">SELECT</td>
		</tr>
		<tr height="10"></tr>
		
		<%-- FUNCTION CALL FOR SELECT CANDIDATE FORM DATA BASE --%>
		
<%		ResultSet rs=Methods.selectcandidate(b_location);
		while(rs.next())
		{ 
			HttpSession session2=request.getSession(true);
			String c_code=rs.getString(3);
			System.out.println("  vb :"+c_code);
			session2.setAttribute("vote_code",c_code);
		%>
		<tr>
			<td align="center"><img src="/onlinevote/Files/images/Candidates/Symbol/<%=rs.getString(1)%>" height="60" width="60"></td>
			<td align="center"><%=rs.getString(2)%></td>
			<td align="center">
				<input type="image" id="<%=rs.getString(2)%>" name="vote_can" value="<%=rs.getString(3)%>" src="<%=request.getContextPath()%>/Files/Images/voting/vote.png" height="50" width="50"
					onmouseover="this.src='<%=request.getContextPath()%>/Files/Images/voting/vote-click.png'"
   	   		 		onmouseout="this.src='<%=request.getContextPath()%>/Files/Images/voting/vote.png'"
   	   		 		onclick="return Reset(this.id)" />
			</td>
		</tr>	
<% 		}%>
	</table>
</form>	
</div>
</center>
</body>
</html>