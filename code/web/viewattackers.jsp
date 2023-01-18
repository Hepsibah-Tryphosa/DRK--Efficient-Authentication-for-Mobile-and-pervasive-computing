<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
<!--
.style3 {font-size: 18px; font-weight: bold; color: #0000FF; }
.style4 {
	font-size: 36px;
	font-weight: bold;
	color: #0000FF;
}
.style5 {
	font-size: 24px;
	color: #FF6600;
}
-->
</style>
</head>
<body>


<p align="center" class="style4 style5">LIST OF ALL ATTACKERS </p>
<table width="1055" border="1" align="center">
  <tr>
    <td width="205"><div align="center"><span class="style3">Message ID </span></div></td>
      <td width="509"><div align="center"><span class="style3">Title Name </span></div></td>
    <td width="509"><div align="center"><span class="style3">Key Used </span></div></td>
    <td width="509"><div align="center"><span class="style3">MAC Key </span></div></td>
    <td width="188"><div align="center"><span class="style3">Date & Time</span></div></td>
   <td width="188"><div align="center"><span class="style3">Message</span></div></td>
    <td width="188"><div align="center"><span class="style3"></span></div></td>
  
     
  </tr>

<%

	
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
        
          
      		
      		 
      		
      		String query="select * from Attackers "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		i=rs.getInt(1);
		s2=rs.getString(2);
		s3=rs.getString(3);
		s4=rs.getString(4);
		s5=rs.getString(5);
		
	
		%>

  <tr>
    <td><div align="center"><%=i%></div></td>
    <td><div align="center"><%=s2%></div></td>
    <td><div align="center"><%=s3%></div></td>
	 <td><div align="center"><%=s4%></div></td>
	  <td><div align="center"><%=s5%></div></td>
	  <td><div align="center"><a href="message.jsp?uid=<%=i%>"> View Message &nbsp;</a></div></td>
     <td><div align="center"><a href="Recovery.jsp?uid=<%=i%>"> Recover Message &nbsp;</a></div></td>
    
  </tr>

<%
	   }
	  
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>


</table>
</body>
</html>

