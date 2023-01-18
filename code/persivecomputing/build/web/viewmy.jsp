<%@ include file="connect.jsp" %>

<html>
<style type="text/css">
<!--
.style3 {color: #0000FF; font-weight: bold; font-size: 18px; }
.style4 {
	color: #FF6600;
	font-weight: bold;
	font-size: 24px;
}
-->
</style>

<body bgcolor=#FFFFFF >

<p align="center">
  <%
 String uname=(String)session.getAttribute("uname");
      	
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9,s10,s11,s12,s13;
	int i=0;

      	try 
	{
           
           String query="select * from user where uname='"+uname+"'"; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	  if ( rs.next()==true )
	   {
		i=rs.getInt(1);
		s2=rs.getString(2);
		
		s4=rs.getString(4);
		s5=rs.getString(5);
		s6=rs.getString(6);
		s7=rs.getString(7);
		
		
	   }
		
		
%>
  
  <span class="style4">MY DETAILS </span></p>
<table width="924" border="1" align="center">
  <tr>
    <td width="241"><div align="center"><span class="style3">Your Image </span></div></td>
    <td width="168"><div align="center"><span class="style3">User Name </span></div></td>
    <td width="109"><div align="center"><span class="style3">DOB</span></div></td>
    <td width="154"><div align="center"><span class="style3">E-Mail</span></div></td>
    <td width="102"><div align="center"><span class="style3">Mobile</span></div></td>
    <td width="124"><div align="center"><span class="style3">Location </span></div></td>
  </tr>
  <tr>
    <td><div align="center">
      <input  name="image" type="image" src="images.jsp?imgid=<%=i%>" width="100" height="100" alt="Submit">
    </</div></td>
    <td><div align="center"><%=s2 %></div></td>
    <td><div align="center"><%=s4 %></div></td>
    <td><div align="center"><%= s5%></div></td>
    <td><div align="center"><%= s6%></div></td>
    <td><div align="center"><%= s7%></div></td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>









<%

	 

           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>



</body>
</html>