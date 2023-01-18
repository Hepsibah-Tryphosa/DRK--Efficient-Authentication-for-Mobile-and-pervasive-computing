<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
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

</head>
<body>
<%

      	try 
	{
      		
      		
      		
      		 
      		int id= Integer.parseInt(request.getParameter("t1"));
      		String tname=request.getParameter("t2");
      		String msg=request.getParameter("textarea");
      		String keys=request.getParameter("t3");
      		
      		String mob="",mail="",h1="";
      		String filename="filename.txt";
      		
      		
      		
      		
      			byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE, key);
      			String encryptedValue = new String(Base64.encode(msg.getBytes()));
      		

      		
      			
      			byte[] keyValue1 = keys.getBytes();
      			Key key1 = new SecretKeySpec(keyValue1, "AES");
      			Cipher c1 = Cipher.getInstance("AES");
      			c1.init(Cipher.DECRYPT_MODE, key1);
      			String decryptedValue = new String(Base64.decode(encryptedValue.getBytes()));
      		
      			
      			
      			
      		PrintStream p = new PrintStream(new FileOutputStream("D:/eauthentication/"+filename));
			p.print(new String(msg));
			
			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream("D:/eauthentication/"+filename);
			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);
 
			//Read the bis so SHA1 is auto calculated at dis
			while (true) {
				int b1 = bis1.read();
				if (b1 == -1)
					break;
			}
 
			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h1 = bi1.toString(16);
			
      		
      		
          
	
%>
<div align="center" class="style1">Message Attacking Form</div>
<form action="Attack4.jsp" method="post"  name="form1">
  <table width="612" border="1" align="center">
    
    <tr>
      <td width="286"><span class="style4">Message ID:- </span></td>
      <td width="339"><input type="text" name="t2" id="t2"  value="<%= id %>" readonly></td>
    </tr>
    <tr>
      <td><span class="style4">Title Name:- </span></td>
      <td><input type="text" name="t22" id="t22"  value="<%= tname %>" readonly></td>
    </tr>
    <tr>
      <td><span class="style4">Your Message:-</span></td>
      <td><textarea name="textarea" id="textarea"  cols="50" rows="20" readonly><%= msg %></textarea></td>
    </tr>
    
    <tr>
      <td><span class="style4">Your Pseudo Random Key:- </span></td>

      <td><input name="t4" type="text" id="t4" size="50" value="<%= keys %>" readonly></td>
    </tr>
    <tr>
      <td><span class="style4">MAC Key:-</span></td>
      <td><input name="t5" type="text" id="t5" size="50" value="<%= h1 %>" readonly></td>
    </tr>
    <tr>
      <td><span class="style4">Cipher Text:- </span></td>
      <td><textarea name="textarea2" cols="50" rows="20" readonly><%= encryptedValue %></textarea></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="right">
        <input type="submit" name="Submit" value="Attack">
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