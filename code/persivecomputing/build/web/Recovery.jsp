<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<html>
<body>
<%
			int id= Integer.parseInt(request.getParameter("uid"));
	     	
          
            
           
           
            

String ccat="Student";

               

		
		try
		{
	
			
			
			

 
Statement st=connection.createStatement();
ResultSet rs=st.executeQuery("select * from message where id="+id+" ");
if(rs.next()==true)
{
	Statement st1=connection.createStatement();
	ResultSet rs1=st1.executeQuery("select * from backup where id="+id+" ");
	if(rs1.next()==true)
	{
		String mac=rs1.getString(9);
		String pt=rs1.getString(7);
		String ct=rs1.getString(10);
		
		 Statement st2=connection.createStatement();
		 st2.executeUpdate("update message set mac='"+mac+"',pt='"+pt+"',ct='"+ct+"' where id="+id+" ");
			
		 Statement st3=connection.createStatement();
		 st3.executeUpdate("delete from Attackers where mid="+id+" ");
	}

}
else
{
	out.print("MESSAGE NOT FOUND");
}






		out.print("MESSAGE RECOVERED SUCCESSFULLY");
		
		%><p><a href="viewattackers.jsp">Back</a></p>

</body>
</html>

	<% 	}
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
           %>
