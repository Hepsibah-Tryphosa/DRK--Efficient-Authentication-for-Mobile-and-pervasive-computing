<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ include file="connect.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
<!--
.style1 {
	color: #FF6600;
	font-weight: bold;
	font-size: 24px;
}
.style10 {color: #0000FF; font-weight: bold; font-size: 18px; }
-->
</style>
</head>
<body>
<%

      	try 
	{
      		
      		
      		String msg="";
      		 
      		int id= Integer.parseInt(request.getParameter("t1"));
      		String tname=request.getParameter("t2");
      		String keys=request.getParameter("t3");
      		
      		
           String query="select * FROM message where id="+id+" and tname='"+tname+"' and key1='"+keys+"' "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
          
	  while( rs.next() )
	   {
			msg=rs.getString(7);
			
		
	  
	   
	
%>


<div align="center" class="style1">ATTACK THE USER MESSAGES</div>
<form name="form1" method="post" action="Attack3.jsp">
  <table width="548" border="1" align="center">
    <tr>
      <td><span class="style10"> Message ID:- </span></td>
      <td><input type="text" name="t1" value="<%= id %>"  readonly></td>
    </tr>
    <tr>
      <td><span class="style10"> Title Name:- </span></td>
      <td><input type="text" name="t2" value="<%= tname %>" readonly></td>
    </tr>
    <tr>
      <td><span class="style10"> Pseudo Random Key:-</span></td>
      <td><input type="text" name="t3" value="<%= keys %>" readonly></td>
    </tr>
    <tr>
      <td><span class="style10">Change the Message:-</span></td>
      <td><textarea name="textarea" id="textarea"  cols="50" rows="20"><%= msg %></textarea></td>
    </tr>
    
    <tr>
      <td><div align="right">
        <input type="submit" name="Submit" value="Attack">
      </div></td>
      <td><input type="reset" name="Submit2" value="Reset"></td>
    </tr>
  </table>
</form>

<%

	   
	   }
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
<p>&nbsp;</p>
</body>
</html>