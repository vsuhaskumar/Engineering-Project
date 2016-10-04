
<%-- INCLUDING COMMON FILES --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Manager_content.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- HEADER PART OF THE PAGE --%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>HOME</title>
</head>

<%-- INCLUDING CSS FILE --%>

<link rel="Stylesheet" type="text/css" href="Officer.css">

<body>

<%-- CONTENT OF THE PAGE --%>

<div id="content">
<br><br>
<center>
	<img src="<%=request.getContextPath()%>/Files/images/Manager/managerhomepage.png">
</center>
<br>
<p> 
	<font style="font-family:cambria; font-weight:bold;color:black;font-size:20px;">	
		&emsp;&emsp;&emsp;&emsp;&emsp;
		The main concept of this application is to execute operations on <br> 
		&emsp;&emsp;&emsp;
		Encrpted data without Decrypting them. Which&nbsp; will&nbsp; provide &nbsp;as &nbsp;the<br> 
		&emsp;&emsp;&emsp;
		same Result after Calculations as if we Worked Directly Raw Data.<br><br>
		&emsp;&emsp;&emsp;&emsp;&emsp;
		Booth &nbsp;Manager &nbsp;can&nbsp; able &nbsp;to &nbsp;know&nbsp; the&nbsp; total&nbsp; Number&nbsp; of&nbsp; votes <br>
		&emsp;&emsp;&emsp;
		Polled&nbsp; in&nbsp; his&nbsp; Booth.&nbsp; it&nbsp; is&nbsp; not&nbsp; possible&nbsp; for&nbsp; Booth Manager to know <br> 
		&emsp;&emsp;&emsp;
		which Candidate got how many number of Votes.<br><br>
		&emsp;&emsp;&emsp;&emsp;&emsp;
		This operation is happend based on&nbsp;Homomorphic &nbsp;Encryption <br>
		&emsp;&emsp;&emsp;
		Technique stated in First Paragraph.
	</font>
</p>
</div>
</body>
</html>