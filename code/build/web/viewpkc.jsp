<%@ include file="connect.jsp" %>
<%@page import="org.json.simple.JSONObject"%>
 <%@page contentType="text/html; charset=UTF-8"%>

<%

      

	JSONObject obj=new JSONObject();


	String fname=request.getParameter("fname");

      	
	String  s11=null,s2=null, s3=null,s4=null,s5=null,s6=null,s7=null,s8=null,s9=null,s10=null;
	String s1;
	int c=0;

      	try 
	{




		ArrayList al = new ArrayList();

           String query="select * FROM message where tname='"+fname+"' "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);


	   while( rs.next()==true )
	   {
		s1=rs.getString("key1");
		s2=rs.getString("mac");
		
		

                s9="Pseodo Random Key="+s1+","+"Message MAC="+s2;
         	al.add(s9);
	   }
	

	  
	
	  obj.put("Keymac",al);
		
   	  out.print(obj);
    	
		}

         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>



