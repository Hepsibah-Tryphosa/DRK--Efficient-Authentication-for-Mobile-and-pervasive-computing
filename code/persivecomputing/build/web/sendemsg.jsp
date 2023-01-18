<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="java.util.*"%>
    <%@ page import="java.sql.*,java.util.Random" %>
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
.style4 {color: #0000FF; font-weight: bold; font-size: 18px; }
-->
</style>

<script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}

</script>

</head>
<body>
<%

      	try 
	{
      		
      		 ArrayList a1=new ArrayList();
      		
      		Random rr = new Random();
     	   String str = "";
     		str = String.valueOf(rr.nextInt(10))
     				+ String.valueOf(rr.nextInt(10))
     				+ String.valueOf(rr.nextInt(10))
     				+ String.valueOf(rr.nextInt(10))
     				+ String.valueOf(rr.nextInt(10))
     				+ String.valueOf(rr.nextInt(10))
     				+ String.valueOf(rr.nextInt(10))
     				+ String.valueOf(rr.nextInt(10))
     				+ String.valueOf(rr.nextInt(10))
     				+ String.valueOf(rr.nextInt(10))
     				+ String.valueOf(rr.nextInt(10))
     				+ String.valueOf(rr.nextInt(10))
     				+ String.valueOf(rr.nextInt(10))
     				+ String.valueOf(rr.nextInt(10))
     				+ String.valueOf(rr.nextInt(10))
     				+ String.valueOf(rr.nextInt(10));
           
           String query="select * FROM user order by uname"; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
          
	   while ( rs.next() )
	   {
			a1.add(rs.getString("uname"));
			
			
		
	   }
	
%>
<div align="center" class="style1">Message Sending Form</div>
<form action="emsg1.jsp" method="post"  name="form1">
  <table width="598" border="1" align="center">
    <tr>
      <td width="286"><span class="style4">Select the Reciever:-  </span></td>
      <td width="356"><select name="s1" id="s1"  >  
      		<option selected>--SELECT--</option>
          <% for(int i=0;i<a1.size();i++)
        	  {
        	  %>
           <option><%= a1.get(i)%></option>
           
           <%}%>
           </select>      </td>
    </tr>
    
    <tr>
      <td><span class="style4">Title Name:- </span></td>
      <td><input type="text" name="t1"></td>
    </tr>
    <tr>
      <td><span class="style4">Your Message:-</span></td>
      <td><input type="file" name="file" id="file"  onChange="loadFileAsText()"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><textarea name="textarea" id="textarea" cols="50" rows="15"></textarea></td>
    </tr>
    <tr>
      <td><span class="style4">Your Pseudo Random Key:- </span></td>
      <td><input name="t4" type="text" id="t4" size="50" value="<%= str %>" readonly></td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right">
        <input type="submit" name="Submit" value="Submit">
      </div></td>
      <td><input type="reset" name="Submit2" value="Reset"></td>
    </tr>
  </table>
</form>
<%

	   

           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
<p>&nbsp;</p>
</body>
</html>