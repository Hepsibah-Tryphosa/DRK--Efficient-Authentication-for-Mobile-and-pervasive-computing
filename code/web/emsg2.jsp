<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<html>
<body>
<%
     
	     	String rname=request.getParameter("t12");
            String mobile=request.getParameter("t1");
            String email=request.getParameter("t2");
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
			
			String uname=(String)session.getAttribute("uname");

 Statement st=connection.createStatement();

st.executeUpdate("insert into  message (rname,sname,mno,email,tname,pt,key1,mac,ct,dt) values ('"+rname+"','"+uname+"','"+mobile+"','"+email+"','"+tname+"','"+pt+"','"+key+"','"+mac+"','"+ct+"','"+dt+"')");


Statement st1=connection.createStatement();

st1.executeUpdate("insert into  backup (rname,sname,mno,email,tname,pt,key1,mac,ct,dt) values ('"+rname+"','"+uname+"','"+mobile+"','"+email+"','"+tname+"','"+pt+"','"+key+"','"+mac+"','"+ct+"','"+dt+"')");




		out.print("MESSAGE SENT SUCCESSFULLY");
		
		%><p><a href="sendemsg.jsp">Back</a></p>

</body>
</html>

	<% 	}
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
           %>
