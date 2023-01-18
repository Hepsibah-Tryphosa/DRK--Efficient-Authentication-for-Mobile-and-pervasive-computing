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
<form name="form1" method="post" action="requestmac.jsp">
  <p align="center" class="style2">REQUEST FOR MESSAGE MAC AND SECRET KEY </p>
  <table width="371" border="0" align="center">
    <tr>
      <td><span class="style1">Enter Your  Secret Key:-</span></td>
      <td><label>
        <input type="text" name="t1">
      </label></td>
    </tr>
    <tr>
      <td><span class="style1">Enter Your  Message ID:-</span></td>
      <td><input type="text" name="t12"></td>
    </tr>
    <tr>
      <td><span class="style1">Enter Your  Title Name:-</span></td>
      <td><input type="text" name="t13"></td>
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
	
		
		
		int id= Integer.parseInt(request.getParameter("t12"));
		String uname=(String)session.getAttribute("uname");
	
		String key1= request.getParameter("t1");	
		String tname= request.getParameter("t13");	
		
		if(key1.equalsIgnoreCase("") && tname.equalsIgnoreCase(""))
		{
			
		}
		else
		{
		 	Statement stmt=connection.createStatement();
		    String strQuery = "select sk from user where uname='"+uname+"' and sk='"+key1+"' ";
		    ResultSet rs = stmt.executeQuery(strQuery);
		    if(rs.next()==true)
		    {
		    	Statement stmt1=connection.createStatement();
			    String strQuery1 = "select * from message where id="+id+" and tname='"+tname+"' and rname='"+uname+"'";
			    ResultSet rs1 = stmt1.executeQuery(strQuery1);
			    if(rs1.next()==true)
			    {
			    	String sk =rs1.getString(8);
			    	String mac =rs1.getString(9);
			    	 
			    	 
			    	%> <p align="center" class="style3"><strong>Your Message Secret Key is--<%=sk %></strong></p>
			    	 <p align="center" class="style3"><strong>Your Message MAC Key is--<%=mac %></strong></p><%
			    }
			    else
			    {
			    
			    
			    out.println("Message ID or Title Name is Mismatch....");
				  %><p><a href="requestmac.jsp">Back</a></p>

				  </body>
				  </html>
				  <%
		          }
		    }
		    else
		    {
		    
		    
		    out.println("Secret Key Mismatch....");
			  %><p><a href="requestmac.jsp">Back</a></p>

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