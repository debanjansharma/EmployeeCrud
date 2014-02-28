<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
</head>
<body bgcolor="blue" text="white">
<h1 align="center">Login Form</h1>
<hr size="3" color="black" width="60%"></hr>
<form action="LoginController" method="Post">
<table align="center" border="10">
<tr>
<th>Enter LoginName:</th><th><input type="text" name="userName"></input></th>
</tr>
<tr>
<th>Enter Password:</th><th><input type="password" name="password"></input></th>
</tr>
<tr>
<td><input type="Submit" value="Login"></input></td><td><input type="Reset" value="clear"></input></td></tr>
</table>
<input type="hidden" name="action" value="login"></input>
</form>

</body>
</html>