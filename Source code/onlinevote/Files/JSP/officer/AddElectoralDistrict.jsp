
<%-- INCLUDING COMMON FILES AND JAVA PACKAGES --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@include file="Common_content.jsp" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- HEADER PART OF THE PAGE --%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>ADD DISTRICT</title>
	<link rel="Stylesheet" type="text/css" href="Officer.css">
</head>

<%-- CONTENT OF THE PAGE--%>

<body>
<div id="content">
	<br><br><br>
	<center>
		<img src="<%=request.getContextPath()%>/Files/images/Officer/addelectoraldistrict.png">
		<br><br><br>
		<form action="<%=request.getContextPath()%>/AddElectoralDistrict" >
			<table style="font-family: cambria; font-weight: bold;">
				<tr height="50">
					<td>NAME</td>
					<td width=10%>:</td>
					<td><input type="text" name="d_name" required="requried"></td>
				</tr>
				<tr height="50">
					<td>DISTRICT</td>
					<td width=10%>:</td>
					<td><input type="text" name="d_district" required="requried"></td>
				</tr>
				<tr height="50">
					<td>STATE</td>
					<td width=10%>:</td>
					<td><input type="text" name="d_state" required="requried"></td>
				</tr>
			</table>
			<br><br>
			<input type="image" value="Submit"src="<%=request.getContextPath()%>/Files/images/Officer/add.png" 
  				onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/add-click.png'"
   	   		 	onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/add.png'">
			&emsp;&emsp;&emsp;
			<a href="<%=request.getContextPath()%>/Files/JSP/officer/Electoral_District.jsp">
			<img src="<%=request.getContextPath()%>/Files/images/Officer/cancel.png"
				onmouseover="this.src='<%=request.getContextPath()%>/Files/images/Officer/cancel-click.png'"
 				onmouseout="this.src='<%=request.getContextPath()%>/Files/images/Officer/cancel.png'"></a>   	   		 	
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
			alert("Sorry, District Name already exists, Enter new District name");
		</script>
<%	}%>
</body>
</html>