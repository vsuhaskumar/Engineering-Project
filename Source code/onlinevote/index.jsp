
<%-- INDEX JSP OF THE APPLICATION --%>

<%-- INCLUDING COMMON FILES AND JAVA PACKAGES --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- HEADER PART OF THE PAGE --%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>ONLINE POLLING</title>				
</head>

<%-- JAVA SCRIPT FOR NO BACK BUTTON --%>

<SCRIPT type="text/javascript">
  	window.history.forward();
   	function noBack() { window.history.forward(); }
</SCRIPT>

<%-- JAVA SCRIPT FOR JSP ANIMATION --%>

<script src="<%=request.getContextPath() %>/Files/JS/jquery-1.6.4.min.js" type="text/javascript"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			$(".container .TabMenu span:first").addClass("selector");
				$(".container .TabMenu span").mouseover(function(){
						$(this).addClass("hovering");
				});	
				$(".container .TabMenu span").mouseout(function(){
					$(this).removeClass("hovering");
				});				
				$(".container .TabMenu span").click(function(){
				$(".selector").removeClass("selector");
				$(this).addClass("selector");
					var TabWidth = $(".TabContent:first").width();
					if(parseInt($(".TabContent:first").css("margin-left")) > 0)
						TabWidth += parseInt($(".TabContaent:first").css("margin-left"));
					if(parseInt($(".TabContent:first").css("margin-right")) >0)
						TabWidth += parseInt($(".TabContent:first").css("margin-right"));
					var newLeft = -1* $("span").index(this) * TabWidth;
					$(".AllTabs").animate({
						left: + newLeft + "px"
					},1000);
				});
			});
</script>

<%-- JAVA SCRIPT FOR NO BACK BUTTON --%>

<script type="text/javascript">
    	window.history.forward();
    	function noBack() { window.history.forward(); }
</script>

<%-- INCLUDING CSS FILE --%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/Files/CSS/login.css" type="text/css"/>

<%-- CONTENT OF THE PAGE--%>

<body background="Files/images/index/bg.jpg">
<div style="background-image: url(Files/images/index/titlebar.png);
				width:1000px;
				height:160px;
				width:1000;
				height:160;"><br>
	<center>
		<img src="Files/images/index/logo-1.png"><br><br>
		<img src="Files/images/index/logo-2.png">
	</center>							
</div >
	<br><br><br>
	<div style="width:50;
				height:285;
				float:left;">
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	</div>
	<div style="width:275;
				height:285;
				float:right;">
				<br><br><br><br>
				<img src="Files/images/index/onlinevote.png">
	</div>
	<div style="background-image:url(Files/images/index/dashboard.png);
				width:430px;
				height:380px;
				width:430;
				height:380;
				float:left;">
	</div>
	<div class="container">
		<div class="TabMenu"><br>
			<center>		
				<span>
					<img src="<%=request.getContextPath()%>/Files/images/index/officer.png" height="80" width="80" /><br>Election<br>Officer
				</span>
				<span>
					<img src="<%=request.getContextPath()%>/Files/images/index/manager.png" height="80" width="80" /><br>&emsp;Booth<br>&emsp;&nbsp;Manager
				</span>
			</center><br><br>
		</div>
		<div class="ContentFrame">
			<div class="AllTabs">
				<div class="TabContent">
					&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
					<img src="Files/images/index/officerlogin.png" height="35" width="230"><br><br>
					<form method="post" id="login" action="<%=request.getContextPath()%>/Officerlogin">
						<center>
							<table>
								<tr>
									<td width=20% ></td>
									<td><b><font size="4">Login id</font></b></td>
									<td>:</td>
									<td><input type="text" name="officer_id" required="required" style="border:1px solid #F298EE;"></input></td>
								</tr>
								<tr>
									<td width=20% ></td>
									<td><b><font size="4">password</font></b></td>
									<td>:</td>
									<td><input type="password" name="officer_pwd" required="required" style="border:1px solid #F298EE;"></input></td>
									</tr>
							</table>
							<br>&emsp;&emsp;&emsp;&emsp;
							<input type="image" src="Files/images/index/button.png" onmouseover="this.src='Files/images/index/buttonclick.png'" onmouseout="this.src='Files/images/index/button.png'">
						</center>	
					</form>
				</div>
				<div class="TabContent">
					&emsp;&emsp;&emsp;&emsp;<img src="Files/images/index/managerlogin.png"><br><br>
					<form method="post" id="login" action="<%=request.getContextPath() %>/Managerlogin">
						<center>
							<table>
								<tr>
									<td width=20% ></td>
									<td><b><font size="4">Login id</font></b></td>
									<td>:</td>
									<td><input type="text" name="manager_id" required="required" style="border:1px solid #F298EE;"></input></td>
								</tr>
								<tr>
									<td width=20% ></td>
									<td><b><font size="4">Password</font></b></td>
									<td>:</td>
									<td><input type="password" name="manager_pwd" required="required" style="border:1px solid #F298EE;"></input></td>
								</tr>
							</table>	
							<br>&emsp;&emsp;&emsp;&emsp;
							<input type="image" src="Files/images/index/button.png" onmouseover="this.src='Files/images/index/buttonclick.png'" onmouseout="this.src='Files/images/index/button.png'">
						</center>		
					</form>
				</div>
			</div>
		</div>
	</div>	
<%-- JAVA CODE FOR ALERT MESSAGE --%>

<%-- CHECK USERNAME AND PASSWORD --%>			
			
<%	String status=null;
	status=(String)request.getAttribute("Status");				
	if(status==null)
	{
			
	}
	else
	{%>
		<script type="text/javascript">
			alert("Sorry,your Id and Password is mismatched");
		</script>
<%	}%>	
							
</body>
</html>