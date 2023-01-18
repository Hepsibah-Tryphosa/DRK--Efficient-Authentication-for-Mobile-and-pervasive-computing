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
.style2 {font-weight: bold}
-->
</style>
</head>
<body>
<div align="center" class="style1">VALIDITY DETAILS</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div align="center" class="style2">
  <%

	
	

      	try 
	{
        
          
      		
      		int id= Integer.parseInt(request.getParameter("t1"));
      		String h1=request.getParameter("t2");
      		
      		if(h1.equalsIgnoreCase(null) )
      		{
      			
      		}
      		else
      		{
      			String query="select * from backup where id="+id+" and mac='"+h1+"'  "; 
                Statement st=connection.createStatement();
                ResultSet rs=st.executeQuery(query);
     	if ( rs.next()==true )
     	   {
     		
     		out.print("MESSAGE VALID ACCURATELY");
    		
    		%>
</div>
<p align="center">&nbsp;</p><p align="center">&nbsp;</p><p align="center"><strong><a href="viewamessage.jsp">Back</a></strong></p>
<div align="center"><strong>
  <% 
     		
     	   }
     	else
     	{
				out.print("MESSAGE NOT VALID AND CONTENTS ARE CHANGED");
    		
    		%>
</strong></div>
<p align="center">&nbsp;</p><p align="center">&nbsp;</p><p align="center"><strong><a href="viewamessage.jsp">Back</a></strong></p>
<div align="center"><strong>
  <% 
     	}
      		}
      		
	  
    connection.close();
   }
  
   catch(Exception e)
   {
     out.println(e.getMessage());
   }
	
		%> 
</strong></div>
</body>
</html>