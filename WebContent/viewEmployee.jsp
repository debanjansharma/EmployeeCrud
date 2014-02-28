<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%

String username=null;
if(session.getAttribute("userName")==null){
	response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
	request.getRequestDispatcher("index.jsp").forward(request,response);
}else{
	username=(String)session.getAttribute("userName");
}

%>
<body bgcolor="blue" text="white">
<h1 align="center">Generate Employee Report</h1>
<hr size="3" color="black" width="60%"></hr>
<form action="EmployeeController" method="post">
<center>
<input type="submit" value="Generate Report">
<input type="hidden" name="action" value="view"></input>
</center>
</form>
<h3 align="right"><a href="welcome.jsp">BackToHome</a></h3>

</body>
</html>