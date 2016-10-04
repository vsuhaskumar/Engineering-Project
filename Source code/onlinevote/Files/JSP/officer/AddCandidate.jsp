
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
	<title>ADD CANDIDATE</title>
	<link rel="Stylesheet" type="text/css" href="Officer.css">
</head>

<%-- INCLUDING JAVA SCRIPT FILE --%>

	<script type="text/javascript" src="<%=request.getContextPath()%>/Files/JS/checkbox.js"></script>

<%-- CONTENT OF THE PAGE--%>

<body>
<div id="content"><center>
	<div style="height:80px;width:790px;">
		<center><br><br>
			<img src="<%=request.getContextPath()%>/Files/images/Officer/addcandidates.png">
		</center>
		
		<%-- JAVA CODE FOR  RETRIVING VALUES FROM SERVLET AFTER SELECTING IMAGE --%>
		
		<%!
			Connection con=DBConnection.getServerConnection();
			Statement st=null;
		%>	
		<%	
			String name="";
  			String address="";
  			String age="";
	  		int district_code=0;
  			String remarks="";
  			String party="";
 			String symbol="";
 			
 			//RETRIVING VALUES FORM SESSION
 			
 			HttpSession ses=request.getSession(true);
 			String temp_name=(String)ses.getAttribute("temp_name");
  			String temp_address=(String)ses.getAttribute("temp_address");
  			String temp_age=(String)ses.getAttribute("temp_age");
  			String temp_district_code=(String)ses.getAttribute("temp_district_code");
  			String temp_remarks=(String)ses.getAttribute("temp_remarks");
  			String temp_party=(String)ses.getAttribute("temp_party");
  			String temp_symbol=request.getParameter("temp_symbol");
  			System.out.println("symbol="+temp_symbol);
  			
  			//IF CONDITION FOR VIEWING VALUES FROM THE SESSION
  			
  			if(temp_name==null)
  			{}else {name=temp_name;}
 			if(temp_address==null)
  			{}else {address=temp_address;}
  			if(temp_age==null)
  			{}else {age=temp_age;}
	  		if(temp_district_code==null)
  			{}else {district_code=Integer.parseInt(temp_district_code);}
  			if(temp_remarks==null)
  			{}else {remarks=temp_remarks;}
  			if(temp_party==null)
  			{}else {party=temp_party;}
  			if(temp_symbol==null)
  			{}else {symbol=temp_symbol;}
  			
		%>
	</div>
	<div style="height:280px;width:20px;float:right;">
	</div>
	<div style="height:280px;width:400px;float:right;">
		
		<%-- IF CONDITION FOR PREVIEW IMAGE--%>
		
		<%if(temp_symbol==null)
	  	  {%>
	  		<center>
	  		<br><br><br><br><br><br>
			<b>Select the Symbol <br>to Preview</b>
			</center>
	  	<%}
		  else 
	  	  {
	  	  		HttpSession sesn=request.getSession(true);
				sesn.setAttribute("temp_symbol",temp_symbol);
		%>
	  			<center>
	  				<br><br><br><br>	
		  			<img src="<%=request.getContextPath()%>/Files/images/Candidates/Symbol/<%=temp_symbol%>" height="100" width="100">
	  				<br><br>
	  				<a href="<%=request.getContextPath()%>/Files/JSP/officer/AddSymbol.jsp">Change Symbol
	  				</a>
	  			</center>
  	  	<%}%>
	</div>
	<form action="<%=request.getContextPath()%>/AddCandidate" method="post">
		<div style="height:280px;width:360px;float:left;">
			<br>
			<table style="font-family: cambria; font-weight: bold;">
				<tr height="30"></tr>	
				<tr height="30">
					<td>&emsp;&emsp;NAME</td>
					<td width=10%>:</td>
					<td><input type="text" name="c_name" required="requried" value="<%=name%>"></td>
				</tr>
				<tr height="30">
					<td>&emsp;&emsp;ADDRESS</td>
					<td width=10%>:</td>
					<td><input type="text" name="c_address" required="requried" value="<%=address%>"></td>
				</tr>
					<tr height="30">
						<td>&emsp;&emsp;AGE</td>
						<td width=10%>:</td>
						<td><input type="text" name="c_age" required="requried" value="<%=age%>"></td>
				</tr>
				<tr height="30">
					<td>&emsp;&emsp;DISTRICT</td>
					<td width=10%>:</td>
					<td>
					<select style="width:155px" name="c_district" required="requried">
					
					<%-- JAVA CODE FOR SELECTING DISTRICT NAME FROM THE DATABASE  --%>
					
					<%
						ResultSet rs,rs1=null;						
						st=con.createStatement();
						rs=st.executeQuery("select E_D_code,E_D_name from m_electoral_district");
						if(district_code==0)
						{
							System.out.println("district code first="+district_code);
							while(rs.next())
							{%>
  								<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
							<%}System.out.println("this is first..."); 
						}
						else
						{
							System.out.println("district code second="+district_code);
							st=con.createStatement();
							rs1=st.executeQuery("select E_D_code,E_D_name from m_electoral_district where E_D_code="+district_code+"");
							while(rs1.next())
							{%>
	  							<option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option>
							<%}
							System.out.println("this is single..."); 
							ResultSet rs2=null;
							st=con.createStatement();
							rs2=st.executeQuery("select E_D_code,E_D_name from m_electoral_district where E_D_code not in ("+district_code+")");
							while(rs2.next())
								{%>
  									<option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
								<%}System.out.println("this is multiple..."); 
						}%>
					</select>
					</td>
				</tr>
				<tr height="30">
					<td>&emsp;&emsp;REMARKS</td>
					<td width=10%>:</td>
					<td><input type="text" name="c_remarks" required="requried" value="<%=remarks%>"></td>
				</tr>
				<tr height="30">
					<td>&emsp;&emsp;PARTY</td>
					<td width=10%>:</td>
					<td><input type="text" name="c_party" required="requried" value="<%=party%>"></td>
				</tr>
			</table>
		</div>
		<br>
		
		<%-- IF CONDITION FOR CHANGE BUTTON AFTER SELECTING IMAGE--%>
		
		<%
			if(temp_symbol==null)
			{%>
			<input type="image" value="Submit"src="<%=request.getContextPath()%>/Files/images/Officer/selectimage.png" 
  			   onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/selectimage-click.png'"
   	   		   onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/selectimage.png'">
			<%}
			else
			{%>
			<input type="image" value="Submit"src="<%=request.getContextPath()%>/Files/images/Officer/add.png" 
  			   onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/add-click.png'"
   	   		   onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/add.png'">
		<%	}%>	
	</form>	
	<form action="<%=request.getContextPath()%>/Can_add_cancel" method="post">
		<br>
		<input type="image" value="Submit" src="<%=request.getContextPath()%>/Files/images/Officer/cancel.png"
				onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/cancel-click.png'"
 				onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/cancel.png'">
 	</form>
</center>
</div>

<%-- JAVA CODE FOR ALERT MESSAGE --%>

<%	String status=null;
	status=(String)request.getAttribute("Status");
	if(status==null)
	{
		
	}
	else
	{%>
		<script type="text/javascript">
		alert("Sorry, Candidate Name or party already exists");
		</script>
<%	}%>
</body>
</html>