<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*"%>
    <%@ page import="java.io.PrintWriter" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OPA System</title>
</head>
<body>
<% 

request.getSession();
String uid=(String)session.getAttribute("uid");
if(uid==null)
{
	response.sendRedirect("login.jsp");
}		
response.setHeader("cache-control", "no-cache");
response.addHeader("cache-control", "no-store");
response.addHeader("Cache-Control", "must-revalidate");
response.setHeader("pragma", "no-cache");

RequestDispatcher rd=request.getRequestDispatcher("admin_home.jsp");  
	rd.include(request, response); 
	%>
</body>
</html>