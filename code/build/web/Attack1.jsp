<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
.style10 {color: #0000FF; font-weight: bold; font-size: 18px; }
-->
</style>
</head>
<body>
<div align="center" class="style1">
  <p>ATTACK THE USER MESSAGES</p>
  <p>&nbsp;</p>
</div>
<form name="form1" method="post" action="Attack2.jsp">
  <table width="548" border="1" align="center">
    <tr>
      <td><span class="style10">Enter the Message ID:- </span></td>
      <td><input type="text" name="t1"></td>
    </tr>
    <tr>
      <td><span class="style10">Enter the Title Name:- </span></td>
      <td><input type="text" name="t2"></td>
    </tr>
    <tr>
      <td><span class="style10">Enter the Pseudo Random Key:-</span></td>
      <td><input type="text" name="t3"></td>
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
<p>&nbsp;</p>
</body>
</html>