<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AddEmployee</title>
</head>
<body bgcolor="blue" text="white">
<%
if(session.getAttribute("userName")==null)
	request.getRequestDispatcher("index.jsp").forward(request,response);
%>
<h1 align="center">Employee Details Is Successfully Added!</h1>
<hr size="2" width="80%" color="black"></hr>
<h3 align="right"><a href="welcome.jsp">BackToHome</a></h3>

</body>
</html>