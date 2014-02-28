<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.awt.List"%>
    <%@page import="java.util.*"%>
    <%@page import="model.entity.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Page</title>
<script type="text/javascript">
function readColumn(i){
	var Row = document.getElementById(i);
	var Cells = Row.getElementsByTagName("th");
	setcookie("Empno", Cells[0].innerText, 1);
	setcookie("EmpName", Cells[1].innerText, 1);
	setcookie("EmpJob", Cells[2].innerText, 1);
	setcookie("Empmgr", Cells[3].innerText, 1);
	//alert("Cookie Created!!");
}
function readColumnForDelete(i){
	var Row = document.getElementById(i);
	var Cells = Row.getElementsByTagName("th");
	setcookie("Empno", Cells[0].innerText, 1);
	setcookie("EmpName", Cells[1].innerText, 1);
	setcookie("EmpJob", Cells[2].innerText, 1);
	setcookie("Empmgr", Cells[3].innerText, 1);
	setcookie("Delete","dodelete");
	//alert("Cookie Created!!");
}

function setcookie(name, value, days)
{
  if (days)
  {
    var date = new Date();
    date.setTime(date.getTime()+days*24*60*60*1000); // ) removed
    var expires = "; expires=" + date.toGMTString(); // + added
  }
  else
    var expires = "";
  document.cookie = name+"=" + value+expires + ";path=/"; // + and " added
}
</script>
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
<script type="text/javascript">
    //setcookie("testcookie", "test", 1);
</script>
<center>
<h1 align="center">Employee Details</h1>
<hr size="3" color="black" width="60%"></hr>
<form >
<table align="center" border="10">
<%
out.println("<tr><th>Empno</th><th>Employee Name</th><th>Job Role</th><th>Manager Id</th><th colspan=\"2\">Actions</th></tr>");
ArrayList<Employee_3908489> list=(ArrayList<Employee_3908489>)request.getAttribute("list");
int rowid=0;
for(int i=0;i<list.size();i++){
	
	out.println("<tr id="+rowid+"><th>"+list.get(i).getEmpNo()+"</th>"+"<th>"+list.get(i).getEmpName()+"</th>"+"<th>"+list.get(i).getJob()+"</th>"+"<th>"+list.get(i).getMgrId()+"</th><th><button onClick=\"JavaScript:readColumn("+rowid+")\">Update</button></th><th><button onClick=\"JavaScript:readColumnForDelete("+rowid+");\">Delete</button></th></tr></br>");
	out.println("<input type=\"hidden\" name=\"action\" value=\"update\"></input>");
	rowid++;
}

%>
</table>
<h3 align="right"><a href="welcome.jsp">BackToHome</a></h3>

</form>
</center>
</body>
</html>