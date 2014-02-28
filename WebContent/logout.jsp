<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="cyan" text="red">
<%
if(session.getAttribute("userName")==null)
	request.getRequestDispatcher("index.jsp").forward(request,response);
%>
<%session.invalidate(); %>
<h3 align="center">You Have Successfully Logged Out</h3>
<h3 align="right"><a href="index.jsp">Login Again</a></h3>
</body>
</html>