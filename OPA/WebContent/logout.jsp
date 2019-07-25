<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*" %>
    <%@ page import="java.io.*"%>
    <%@ page import="java.io.PrintWriter" %>
 	<%@ page import="javax.servlet.*"%>
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
session.invalidate();
 request.setAttribute("errorMessage15","itsSet");
                    
                        //out.println("Username and Password Incorrect");
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                        
                        rd.forward(request, response);

%>
</body>
</html>