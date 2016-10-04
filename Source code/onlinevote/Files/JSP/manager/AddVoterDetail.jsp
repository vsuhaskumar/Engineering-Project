
<%-- INCLUDING COMMON FILES AND JAVA PACKAGES --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Manager_content.jsp" %>   
<%@page import="java.sql.*,com.database.conn.*"%>    
<%@page import="com.database.conn.DBConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- HEADER PART OF THE PAGE --%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>ADD VOTER DETAILS</title>
</head>

<%-- INCLUDING JAVA SCRIPT FILE AND CSS FILE --%>

<link rel="Stylesheet" type="text/css" href="Officer.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/Files/JS/checkbox.js"></script>

<%-- CONTENT OF THE PAGE--%>

<body>
	<div id="content"><center>
		<div style="height:80px;width:790px;">
		<center><br><br>
			<img src="<%=request.getContextPath()%>/Files/images/Manager/addvoterdetails.png">
		</center>
		
		<%-- JAVA CODE FOR  RETRIVING VALUES FROM SERVLET AFTER SELECTING IMAGE --%>
		<%	String id_no="";
  			String name="";
  			String address="";
  			String sex="";
  			String age="";
 			String photo="";
 			String position="";
 			String vote_status="";
 			
 			//RETRIVING VALUES FROM SESSIONS
 			
 			HttpSession vses=request.getSession(true);
 			String temp_id_no=(String)vses.getAttribute("temp_id_no");
 			String temp_name=(String)vses.getAttribute("temp_name");
  			String temp_address=(String)vses.getAttribute("temp_address");
  			String temp_sex=(String)vses.getAttribute("temp_sex");
  			String temp_age=(String)vses.getAttribute("temp_age");
  			String temp_position=(String)vses.getAttribute("temp_position");
  			String temp_vote_status=(String)vses.getAttribute("temp_vote_status");
  			String temp_photo=request.getParameter("temp_photo");  			
  			if(temp_id_no==null)
  			{}else {id_no=temp_id_no;}
  			if(temp_name==null)
  			{}else {name=temp_name;}
 			if(temp_address==null)
  			{}else {address=temp_address;}
 			if(temp_sex==null)
  			{}else {sex=temp_sex;}
  			if(temp_age==null)
  			{}else {age=temp_age;}
  			if(temp_position==null)
  			{}else {position=temp_position;}
  			if(temp_vote_status==null)
  			{}else {vote_status=temp_vote_status;}
  			if(temp_photo==null)
  			{}else {photo=temp_photo;}
		%>
	</div>
	<div style="height:280px;width:20px;float:right;">
	</div>
	<div style="height:280px;width:400px;float:right;">
		
		<%-- IF CONDITION FOR PREVIEW IMAGE--%>
		
		<%if(temp_photo==null)
	  		{%>
	  			<center>
	  				<br><br><br><br><br><br>
					<b>Select the image <br>to Preview</b>
				</center>
	  	<%	}else 
	  		{
	  			HttpSession sesn=request.getSession(true);
				sesn.setAttribute("temp_photo",temp_photo);
		%>
	  	<center><br><br><br><br>	
	  		<img src="<%=request.getContextPath()%>/Files/images/voters/<%=temp_photo%>" height="100" width="100">
	  	</center>
  	  	<%	}%>
	</div>
	<form action="<%=request.getContextPath()%>/AddVoterDetail" method="post">
		<div style="height:280px;width:360px;float:left;">
		<br>
		<table style="font-family: cambria; font-weight: bold;">	
			<tr height="30">	
				<td>&emsp;&emsp;VOTER ID</td>
				<td width=10%>:</td>
				<td><input type="text" name="v_id_no" required="requried" value="<%=id_no%>"></td>
			</tr> 
			<tr height="30">
				<td>&emsp;&emsp;NAME</td>
				<td width=10%>:</td>
				<td><input type="text" name="v_name" required="requried" value="<%=name%>"></td>
			</tr>
			<tr height="30">
				<td>&emsp;&emsp;ADDRESS</td>
				<td width=10%>:</td>
				<td><input type="text" name="v_address" required="requried" value="<%=address%>"></td>
			</tr>
			<tr height="30">
				<td>&emsp;&emsp;AGE</td>
				<td width=10%>:</td>
				<td><input type="text" name="v_age" required="requried" value="<%=age%>"></td>
			</tr>
			<tr height="30">
				<td>&emsp;&emsp;SEX</td>
				<td width=10%>:</td>
				<td>
				<%	String[] v_sex ={"male", "female"};
			  		if(temp_sex==null)
			  		{%>
					<select style="width:153px" name="v_sex" required="requried">
						<option value="male">male</option>
						<option value="female">female</option>
					</select>
				<%	}
			  		else
			  		{%>
						<select style="width:153px" name="v_sex" required="requried">
							<option value="<%=temp_sex%>"><%=temp_sex%></option>
				<%
						for(int i=0;i<v_sex.length;i++)
						{
							if(!v_sex[i].equals(temp_sex))
				      		{%>
								<option value="<%=v_sex[i]%>"><%=v_sex[i]%></option>
				<%			}
						}%>
						</select>
				<%	}%>
				</td>
			</tr>		
			<tr height="30">
				<td>&emsp;&emsp;POSITION</td>
				<td width=10%>:</td>
				<td>
			<%
				String[] v_position ={"available","dead","nontraceasble"};
			  	if(temp_position==null)
			  	{%>
					<select style="width:153px" name="v_position" required="requried">
						<option value="available">available</option>
						<option value="dead">dead</option>
						<option value="nontraceasble">nontraceasble</option>
					</select>
			<%	}
				else
			  	{%>
					<select style="width:153px" name="v_position" required="requried">
						<option value="<%=temp_position%>"><%=temp_position%></option>
			<%		for(int i=0;i<v_position.length;i++)
					{
						if(!v_position[i].equals(temp_position))
				      	{%>
							<option value="<%=v_position[i]%>"><%=v_position[i]%></option>
			<%			}
					}%>
					</select>
			<%	}%>
				</td>
			</tr>
			<tr height="30">
				<td>&emsp;&emsp;VOTE STATUS</td>
				<td width=10%>:</td>
				<td>
			<%	
				String[] v_vote_status ={"pending","polled"};
			  	if(temp_vote_status==null)
			  	{%>
					<select style="width:153px" name="v_vote_status" required="requried">
						<option value="pending">pending</option>
						<option value="polled">polled</option>
					</select>
			<%	}
			  	else
			  	{%>
					<select style="width:153px" name="v_vote_status" required="requried">
					<option value="<%=temp_vote_status%>"><%=temp_vote_status%></option>
			<%
					for(int i=0;i<v_vote_status.length;i++)	
					{
						if(!v_vote_status[i].equals(temp_vote_status))
				      	{%>	
							<option value="<%=v_vote_status[i]%>"><%=v_vote_status[i]%></option>
			<%			}
					}%>
					</select>
			<%	}%>
				</td>
			</tr>
		</table>
	</div>
<br>

<%-- IF CONDITION FOR CHANGE BUTTON AFTER SELECTING IMAGE--%>

<%
	if(temp_photo==null)
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
<%	}%>	</form>	
<form action="<%=request.getContextPath()%>/Vot_add_cancel" method="post">
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
		alert("Sorry, Voter id already exists, Enter new Voter id");
		</script>
<%	}%>
</body>
</html>