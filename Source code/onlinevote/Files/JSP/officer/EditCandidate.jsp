
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
	<title>EDIT CANDIDATE</title>
</head>

<%-- INCLUDING JAVA SCRIPT FILE AND CSS FILE --%>

<link rel="Stylesheet" type="text/css" href="Officer.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/Files/JS/checkbox.js"></script>

<%-- CONTENT OF THE PAGE--%>

<body>
<div id="content"><center>
	<div style="height:80px;width:790px;">
	<center><br><br>
	<img src="<%=request.getContextPath()%>/Files/images/Officer/editcandidate.png">
	</center>
	<%!
		Connection con=DBConnection.getServerConnection();
		Statement st=null;
		ResultSet rs=null;
		ResultSet rss=null;	
		ResultSet rs1=null;
	%>	
	<%	
	
		//SELECTING CANDIDATE VALUES FROM DATABASE 
	
		String m_code=request.getParameter("code");
		String sql="select * from m_candidate where c_code='"+m_code+"'";
		st=con.createStatement();
		rss=st.executeQuery(sql);
		System.out.println("the edit code="+m_code);
		String code="";
		String name="";
  		String address="";
  		String age="";
  		int district_code=0;
  		String remarks="";
  		String party="";
 		String symbol="";
 		while(rss.next())
  		{	 		
 			name=rss.getString(2);
 			address=rss.getString(3);
 			age=rss.getString(4);
 			district_code=Integer.parseInt(rss.getString(6));
 			remarks=rss.getString(7);	
 			party=rss.getString(8);
 			symbol=rss.getString(5);
  		} 	
 		
 		//RETRIVING VALUES FORM SESSION
 		
 		HttpSession sess=request.getSession(true);
 		String tp_code=(String)sess.getAttribute("tp_code");
 		String tp_name=(String)sess.getAttribute("tp_name");
  		String tp_address=(String)sess.getAttribute("tp_address");
  		String tp_age=(String)sess.getAttribute("tp_age");
  		String tp_district_code=(String)sess.getAttribute("tp_district_code");
  		String tp_remarks=(String)sess.getAttribute("tp_remarks");
  		String tp_party=(String)sess.getAttribute("tp_party");	
  		String tp_symbol=request.getParameter("tp_symbol");  	
	  	if(tp_code==null)
  		{code=m_code;}else {code=tp_code;}
  		if(tp_name==null)
  		{}else {name=tp_name;}
 		if(tp_address==null)
  		{}else {address=tp_address;}
 	 	if(tp_age==null)
  		{}else {age=tp_age;}
  		if(tp_district_code==null)
  		{}else {district_code=Integer.parseInt(tp_district_code);}
  		if(tp_remarks==null)
  		{}else {remarks=tp_remarks;}
  		if(tp_party==null)
  		{}else {party=tp_party;}
  		if(tp_symbol==null)
  		{}else {symbol=tp_symbol;}
	%>
	</div>
	<div style="height:280px;width:20px;float:right;">
	</div>
	<div style="height:280px;width:400px;float:right;">
	
	<%-- IF CONDITION FOR PREVIEW SYMBOL --%>
	
		<%if(tp_symbol==null)
	  		{%>
	  			<center>
	  				<br><br><br><br>	
	  				<img src="<%=request.getContextPath()%>/Files/images/Candidates/Symbol/<%=symbol%>" height="100" width="100">
	  			</center>
	  	<%	}
	  		else 
	  		{
	  			HttpSession sesn=request.getSession(true);
				sesn.setAttribute("tp_symbol",tp_symbol);
		%>
	  	<center>
	  		<br><br><br><br>	
	  		<img src="<%=request.getContextPath()%>/Files/images/Candidates/Symbol/<%=tp_symbol%>" height="100" width="100">
	  	</center>
  	  	<%	}%>
	</div>
	<form action="<%=request.getContextPath()%>/EditCandidate" method="post">
		<div style="height:280px;width:360px;float:left;">
		<table style="font-family: cambria; font-weight: bold;">	
			<tr height="30">	
				<td>&emsp;&emsp;CODE</td>
				<td width=10%>:</td>
				<td><input type="text" name="c_code" required="requried" readonly="readonly" value="<%=code%>"></td>
			</tr> 
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
				
				<%-- SELECTING DISTRICT NAME FROM DATABASE --%>
				
				<%
					rs=st.executeQuery("select E_D_code,E_D_name from m_electoral_district");
					if(district_code==0)
					{	System.out.println("district code first="+district_code);
						while(rs.next())
						{%>
  							<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
				<%		} 
					}
					else
					{
						System.out.println("district code second="+district_code);
						st=con.createStatement();
						rs1=st.executeQuery("select E_D_code,E_D_name from m_electoral_district where E_D_code="+district_code+"");
						while(rs1.next())
							{%>
	  							<option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option>
				<%			}	
							System.out.println("this is single..."); 
							ResultSet rs2=null;
							st=con.createStatement();
							rs2=st.executeQuery("select E_D_code,E_D_name from m_electoral_district where E_D_code not in ("+district_code+")");
							while(rs2.next())
								{%>
  									<option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
				<%				} 
				
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

<%-- IF CONDITION FOR CHANGE BUTTON --%>

<%
	if(tp_symbol==null)
	{%>
		<input type="image" value="Submit"src="<%=request.getContextPath()%>/Files/images/Officer/selectimage.png" 
  			   onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/selectimage-click.png'"
   	   		   onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/selectimage.png'">
<%	}
	else
	{%>
		<input type="image" value="Submit"src="<%=request.getContextPath()%>/Files/images/Officer/save.png" 
  			   onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/save-click.png'"
   	   		   onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/save.png'">
<%	}%>	</form>	
		<form action="<%=request.getContextPath()%>/Can_edit_cancel" method="post"><br>
		<input type="image" value="Submit" src="<%=request.getContextPath()%>/Files/images/Officer/cancel.png"
				onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/cancel-click.png'"
 				onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/cancel.png'">
 		</form></center>
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
		alert("Sorry, Candidate Name already exists, Enter new name");
		</script>
<%	}%>
</body>
</html>