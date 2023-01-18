<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
.style2 {
	font-weight: bold;
	font-size: 18px;
	color: #0000FF;
}
-->
</style>
<script type='text/javascript'>

function saveTextAsFile()
{
	var textToWrite = document.getElementById("textarea").value;
	var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
	var fileNameToSaveAs = "Message.txt";

	var downloadLink = document.createElement("a");
	downloadLink.download = fileNameToSaveAs;
	downloadLink.innerHTML = "Download File";
	if (window.webkitURL != null)
	{
		// Chrome allows the link to be clicked
		// without actually adding it to the DOM.
		downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
	}
	else
	{
		// Firefox requires the link to be added to the DOM
		// before it can be clicked.
		downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
		downloadLink.onclick = destroyClickedElement;
		downloadLink.style.display = "none";
		document.body.appendChild(downloadLink);
	}

	downloadLink.click();
}

function destroyClickedElement(event)
{
	document.body.removeChild(event.target);
}



</script>
</head>
<body>
<%

	
	

      	try 
	{
        
      		String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
      		
      		int id= Integer.parseInt(request.getParameter("t1"));
      		String h1=request.getParameter("t2");
      		
      		if(h1.equalsIgnoreCase(null) )
      		{
      			
      		}
      		else
      		{
      			String query="select * from message where id="+id+" and key1='"+h1+"'  "; 
                Statement st=connection.createStatement();
                ResultSet rs=st.executeQuery(query);
     	if ( rs.next()==true )
     	   {
     		s6=rs.getString(6);
     		s7=rs.getString(7);
    		
    		%>
<p align="center" class="style1">Message Details </p>
<table width="461" border="1" align="center">
  <tr>
    <td><span class="style2">Title Name </span></td>
    <td><%= s6 %></td>
  </tr>
  <tr>
    <td><span class="style2">Message </span></td>
    <td><textarea name="textarea" id="textarea" cols="50" rows="15"><%= s7 %></textarea></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><button onClick="saveTextAsFile()">Download</button></td>
  </tr>
</table>
</body>
  <% 
     		
     	   }
     	else
     	{
				out.print("PSEUDO RANDOM KEY IS NOT VALID");
    		
    		%>

<p align="center">&nbsp;</p><p align="center">&nbsp;</p><p align="center"><strong><a href="viewamessage.jsp">Back</a></strong></p>
<div align="center"><strong>
  <% 
     	}
      		}
      		
	  
    connection.close();
   }
  
   catch(Exception e)
   {
     out.println(e.getMessage());
   }
	
		%> 
</strong></div>
</body>
</html>