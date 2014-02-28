<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Management</title>
<script type="text/javascript">
window.history.forward(1);
document.attachEvent("onkeydown", my_onkeydown_handler);
function my_onkeydown_handler()
{
switch (event.keyCode)
{
case 116 : // 'F5'
event.returnValue = false;
event.keyCode = 0;
window.status = "We have disabled F5";
break;
}
} 
document.onmousedown=disableclick;
//status="Right Click is not allowed";
function disableclick(e)
{
if(event.button==2)
{
alert("Right Click is not allowed");
return false;	
}
}
</script>
</head>
<body bgcolor="blue" text="white">
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
<h1 align="center">Employee Management</h1>
<hr size="3" color="black" width="60%"></hr>
 <%
 out.println("<h2><marquee bgcolor=\"black\" behavior=\"alternate\">Welcome "+username+"</marquee></h2>"); 
 %>
<table align="right">
<tr>
<td><h3><a href="LoginController?action=logout">Logout</a></h3></td>
</tr>
</table>
<table bgcolor="silver" align="center">
<tr>
<td ><h2><a href="addEmployee.jsp">Add Employee</a></h2></td>
</tr>
<tr>
<td ><h2><a href="updateEmployee.jsp">Update Employee</a></h2></td>
</tr>
<tr>
<td><h2><a href="deleteEmployee.jsp">Delete Employee</a></h2></td>
</tr>
<tr>
<td><h2><a href="viewEmployee.jsp">View Employee</a></h2></td>
</tr>
</table>
</body>
</html>