<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.awt.List"%>
    <%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Employee</title>
<script type="text/javascript">
function Reset(){
	document.getElementById("textarea").value="";
}
</script>
</head>
<body bgcolor="blue" text="white">
<h1 align="center">Update Employee</h1>
<hr size="3" color="black" width="60%"></hr>
<%
ArrayList<String> updatedata=new ArrayList<String>();
Cookie[] ckk=request.getCookies();
String empno="";
String empname="";
String empjob="";
String empmgr="";
for(Cookie d:ckk){
	if(d.getName().equals("Empno")){
		empno=d.getValue();
	}
	if(d.getName().equals("EmpName")){
		empname=d.getValue();
	}
	if(d.getName().equals("EmpJob")){
		empjob=d.getValue();
	}
	if(d.getName().equals("Empmgr")){
		empmgr=d.getValue();
	}
	
}
Cookie Empno = new Cookie("Empno", null);
Empno.setMaxAge(0);
Empno.setPath("/");
Cookie EmpName = new Cookie("EmpName", null);
EmpName.setMaxAge(0);
EmpName.setPath("/");
Cookie EmpJob = new Cookie("EmpJob", null);
EmpJob.setMaxAge(0);
EmpJob.setPath("/");
Cookie Empmgr = new Cookie("Empmgr", null);
Empmgr.setMaxAge(0);
Empmgr.setPath("/");
response.addCookie(Empno);
response.addCookie(EmpName);
response.addCookie(EmpJob);
response.addCookie(Empmgr);
%>
<form action="EmployeeController" method="post">
<table align="center" border="10">
<tr>
<%
if(empno.equals("")){
	out.println("<th>Enter Employee Number:</th><td><input type=\"text\" name=\"empNo\" value="+empno+"></input></td>");
}else{
out.println("<th>Enter Employee Number:</th><td><input type=\"text\" name=\"empNo\" value="+empno+" readonly></input></td>");
}
%>
</tr>
<tr>
<% 
out.println("<th>Enter Employee Name:</th><td><input type=\"text\" name=\"empName\" value="+empname+"></input></td>");
%>
</tr>
<tr>
<% 
out.println("<th>Enter Employee Job:</th><td><input type=\"text\" name=\"job\" value="+empjob+"></input></td>");
%>
</tr>
<tr>
<%
out.println("<th>Enter Manager ID:</th><td><input type=\"text\" name=\"mgrId\" value="+empmgr+"></input></td>");
%>
</tr>
<tr>
<th><input type="submit" value="Update"></input></th><td><input type="reset" value="clear"></input></td>
</tr>
</table>
<input type="hidden" name="action" value="doupdate"></input>
</form>
<h3 align="right"><a href="welcome.jsp">BackToHome</a></h3>

</body>
</html>