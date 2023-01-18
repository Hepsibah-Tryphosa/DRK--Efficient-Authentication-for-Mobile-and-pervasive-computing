<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>

<%

        String username=(String)session.getAttribute("uname");

        String Password=request.getParameter("t1");




try
{
	   String sql="SELECT * FROM user where uname='"+username+"' and sk='"+Password+"'";
        Statement stmt = connection.createStatement();
	    ResultSet rs =stmt.executeQuery(sql);
		String utype="";
	   if(rs.next())
	    {
	    response.sendRedirect("sendemsg.jsp");
           }
	    else
	    {
	    response.sendRedirect("wronglogin.html");
          }
}

catch(Exception e)
{out.print(e);}
%>

