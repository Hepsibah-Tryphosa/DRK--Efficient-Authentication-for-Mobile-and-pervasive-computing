<%@ include file="connect.jsp" %>
<%@page import="org.json.simple.JSONObject"%>
 <%@page contentType="text/html; charset=UTF-8"%>

<%

      

	JSONObject obj=new JSONObject();

      	
	String  s11=null,s2=null, s3=null,s4=null,s5=null,s6=null,s7=null,s8=null,s9=null;
	String s1;
	int c=0;

      	try 
	{




		ArrayList al = new ArrayList();

           String query="select * FROM Attackers "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	   while ( rs.next() )
	   {
		s1=rs.getString("tname");
		s2=rs.getString("key1");
		s3=rs.getString("mac");
		s4=rs.getString("dt");
		

                s9="Titlename="+s1+","+"KeyUsed="+s2+","+"Mac="+s3+","+"DT="+s4;
         	al.add(s9);
	   }

	  
	
	  obj.put("Attackers",al);
		
   	  out.print(obj);
    	
		}

         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>



