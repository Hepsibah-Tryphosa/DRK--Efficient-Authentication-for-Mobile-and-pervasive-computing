<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
<!--
.style1 {
	color: #0000FF;
	font-weight: bold;
	font-size: 18px;
}
.style2 {
	color: #FF6600;
	font-weight: bold;
	font-size: 24px;
}
.style3 {
	font-size: 18px;
	color: #FF0000;
}
-->
</style>
</head>
<body>
<form name="form1" method="post" action="request.jsp">
  <p align="center" class="style2">REQUEST FOR USER SECRET KEY </p>
  <table width="371" border="0" align="center">
    <tr>
      <td><span class="style1">Enter Your Password to Get Secret Key:-</span></td>
      <td><label>
        <input type="password" name="t1">
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="submit" name="Submit" value="Submit">
      </label></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>
</body>
</html>


<%


	try 
{
	
		
		
		
		String uname=(String)session.getAttribute("uname");
	
		String field= request.getParameter("t1");	
		
		if(field.equalsIgnoreCase(""))
		{
			
		}
		else
		{
		 Statement stmt=connection.createStatement();
		    String strQuery = "select sk from user where uname='"+uname+"' and pwd='"+field+"' ";
		    ResultSet rs = stmt.executeQuery(strQuery);
		    if(rs.next()==true){
		    	
		    	String sk =rs.getString(1);
		    	%> <p align="center" class="style3"><strong>Your Message Secret Key is--<%=sk %></strong></p>
		    	<%
		    }
		    else
		    {
		    
		    
		    out.println("Password Mismatch....");
			  %><p><a href="request.jsp">Back</a></p>

			  </body>
			  </html>
			  <%
	          }
		}
		
		 }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>