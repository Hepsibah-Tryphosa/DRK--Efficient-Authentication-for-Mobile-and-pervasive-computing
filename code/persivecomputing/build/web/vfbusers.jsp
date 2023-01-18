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

           String query="select * FROM user "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	   while ( rs.next() )
	   {
		s1=rs.getString("uname");
		s2=rs.getString("dob");
		s3=rs.getString("email");
		s4=rs.getString("mobile");
		s5=rs.getString("location");
		

                s9="Username="+s1+","+"DOB="+s2+","+"EMail="+s3+","+"Mobile="+s4+","+" Location="+s5;
         	al.add(s9);
	   }

	  
	
	  obj.put("Users",al);
		
   	  out.print(obj);
    	
		}

         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>



