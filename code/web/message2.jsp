<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
.style4 {color: #0000FF; font-weight: bold; font-size: 18px; }
-->
</style>


</head>
<body>
<div align="center">
  <p>
    <%

	
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
        
          
      		
      		int id= Integer.parseInt(request.getParameter("uid"));
      		
      		String query="select * from message where id="+id+" "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		
		s6=rs.getString(6);
		
		
	
		%> 
      <span class="style1">CHECKING VALIDITY</span></p>
  <p>&nbsp;</p>
</div>
<form name="form1" method="post" action="message21.jsp">
  <table width="597" border="1" align="center">
    <tr>
      <td width="225"><span class="style4">Message ID:- </span></td>
      <td width="189"><input name="t1" type="text" size="50" value="<%= id %>"></td>
    </tr>
    <tr>
      <td><span class="style4">Title Name:- </span></td>
      <td><input name="t12" type="text" size="50" value="<%= s6 %>"></td>
    </tr>
    <tr>
      <td><span class="style4">Enter your MAC to Verify:- </span></td>
      <td><input name="t2" type="text" size="50"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="Check"></td>
    </tr>
  </table>
</form>
<p align="center" class="style1">&nbsp;</p>
</body>
<%
	   }
	  
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
</html>
