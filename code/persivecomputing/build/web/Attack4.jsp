<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<html>
<body>
<%
			int id= Integer.parseInt(request.getParameter("t2"));
	     	String tname=request.getParameter("t22");
            String pt=request.getParameter("textarea");
            String key=request.getParameter("t4");
            String mac=request.getParameter("t5");
            String ct=request.getParameter("textarea2");
          
            
           
           
            

String ccat="Student";

               

		
		try
		{
	
			SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat(
					"HH:mm:ss");

			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
			

 Statement st=connection.createStatement();

st.executeUpdate("update message set mac='"+mac+"',pt='"+pt+"',ct='"+ct+"' where id="+id+" ");


Statement st1=connection.createStatement();

st1.executeUpdate("insert into  Attackers  values ("+id+",'"+tname+"','"+key+"','"+mac+"','"+dt+"')");




		out.print("MESSAGE ATTACKED SUCCESSFULLY");
		
		%><p><a href="Attack1.jsp">Back</a></p>

</body>
</html>

	<% 	}
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
           %>
