
<%-- INCLUDING COMMON FILES AND JAVA PACKAGES --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Manager_content.jsp" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- HEADER PART OF THE PAGE --%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>ADD IMAGE</title>
</head>

<%-- CONTENT OF THE PAGE--%>

<body>
	<div id="content">
		<form action="<%=request.getContextPath()%>/AddImage" method="post" enctype="multipart/form-data">
		<center>
			<br><br><br>
			<img src="<%=request.getContextPath()%>/Files/images/Manager/addimage.png">
			<br><br><br>
			&emsp;&emsp;&emsp;&emsp;
			<input type="file"  name="file" required="required" width="150px" ></input>
			<br><br><br>
			<input type="submit"  value="  Upload Image "></input>
		</center>
	</form>
</div>
</body>
</html>