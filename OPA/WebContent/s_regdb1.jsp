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
		String userid=request.getParameter("userid");
		String name=request.getParameter("name");
		String academic=request.getParameter("academic");
		String stream=request.getParameter("stream");
		String department=request.getParameter("department");
		String section=request.getParameter("section");
		String email=request.getParameter("email");
		String mobno=request.getParameter("mobno");
		String year=request.getParameter("year");
		
		
		if(userid!=null && name!=null && academic!=null && stream!=null && department!=null && section!=null && email!=null && mobno!=null && year!=null)
		{

			System.out.println("session values inserting");
			session.setAttribute( "uid", userid );	//	SESSION STARTED
			session.setAttribute( "nm", name);
			session.setAttribute( "acad", academic);
			session.setAttribute( "strm", stream);
			session.setAttribute( "dept", department);
			session.setAttribute( "sect", section);
			session.setAttribute( "mail", email);
			session.setAttribute( "mob", mobno);
			session.setAttribute( "yr", year);
			System.out.println("session values inserted");
			
			response.sendRedirect("student_reg2.jsp");

			
		}
		


		
		%>
		
		</body>
		</html>