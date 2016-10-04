<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Common_content.jsp" %>      
<%@page import="java.sql.*,com.database.conn.*"%>    
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>    
<%@page import="com.paillier.*"%>   
<%@page import="java.math.BigInteger"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Election Result</title>
<link rel="Stylesheet" type="text/css" href="Officer.css">
</head>
<body>
<%!
	Connection con=DBConnection.getServerConnection();
	Statement st=null;
	ResultSet rs,rs1=null;
	String dec_data=null;
	int min_vote=0;
	int max_vote=0;
	int same_vote=0;
	int i=0;
	String winner=null;
	String temp_winner=null;	
	int same[]=new int[10];
	String Result="NONE";
%>	
<% 	
	same[0]=0;
	String temp_district=(String)request.getSession().getAttribute("temp_district");
	System.out.println("JSP temp_district"+temp_district);
	st=con.createStatement();
	rs=st.executeQuery("select E_D_district from m_electoral_district group by E_D_district");
%>
<div id="content">
<form action="<%=request.getContextPath()%>/ElectionResult" method="post">
<center>
<br><br>
<img src="<%=request.getContextPath()%>/Files/images/Officer/result-logo.png">
<br><br>
<table width="350" style="font-family: cambria; font-weight: bold;">
<tr>
	<td>
		<font style="font-family:cambria; font-weight:bold; color:black;">
			ELECTORAL DISTRICT 
		</font>
	</td>
	<td>:</td>	
	<td>
		<select name="district" style="width:150px;" required="required">				
<%		if(temp_district==null)
		{%>
			<option value="Select" >Select</option>
<% 			while(rs.next())
			{%>
				<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
<%			}					
		}
		else
		{%>
			<option value="<%=temp_district%>"><%=temp_district%></option>
<% 			rs1=st.executeQuery("select E_D_district from m_electoral_district where E_D_district not in ('"+temp_district+"') group by E_D_district");
			while(rs1.next())
			{%>
					<option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option>
<%			}
		}%>
		</select>
		</td>
	</tr>
</table><br>
<input type="image" src="/pollingprocess/Files/Images/index/enter.png"
				onmouseover="this.src='/pollingprocess/Files/Images/index/enter-click.png'"
 				onmouseout="this.src='/pollingprocess/Files/Images/index/enter.png'">
<br><br> 				
<% 
	if(temp_district==null)
	{%>
	
<%	}
	else
	{%>
	<table border="1" width="400" style="font-family: cambria; font-weight: bold;">
		<tr style="background-color:lightblue;color:black;">
			<td>CANDIDATE NAME</td>
			<td>NUMBER OF VOTES</td>
		</tr>			
<%		rs=st.executeQuery("select c.c_name,c.c_code,v.No_votes from m_candidate c left join m_votes v on c.c_code=v.c_code where c.c_code in (select c.c_code from m_candidate c inner join (select E_D_code from m_electoral_district where E_D_district='"+temp_district+"') t on c.E_D_code=t.E_D_code)");
		while(rs.next())
		{%>
		<tr>
			<td>
				<%=rs.getString(1)%>
			</td>
				<td>
<%				Paillier paillier=new Paillier();
				System.out.println("before Biginteger=");
				String t_no="0";
				int Result=0;
				temp_winner=rs.getString(1);
				if(rs.getString(3)==null)
				{					
				}
				else
				{
					t_no=rs.getString(3);
				}					
				BigInteger n=new BigInteger(t_no);	
				System.out.println("before decrption="+n);
				n=paillier.Decryption(n);
				min_vote=Integer.parseInt(n.toString());
				if(min_vote>max_vote)
				{							
						max_vote=min_vote;
						winner=temp_winner;
						
				}
				else if(min_vote==max_vote)
				{
					max_vote=min_vote;
					winner="NONE";	
				}
			
				%>
				<%=min_vote%>				
				</td>		
			</tr>	
<%		}%>			
		</table>					
<%	}%>		 	
	<br>
	<% if(winner==null)
	{%>
		<script type="text/javascript">
	alert("WINNER:");
	</script>
	<%} %>
	
	<font style="font-family:cambria; font-weight:bold; color:red;">
	"WINNER	:	
	<%=winner%>" 
	<% winner="NONE";%>	
	<% min_vote=0;%>
	<% max_vote=0;%>
	</font>			
</center>
</form>
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
			alert("Please select the district");
		</script>
<%	}%>
</body>
</html>