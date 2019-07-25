<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     <%@ page import="java.io.*"%>
     <%@ page import="java.io.PrintWriter" %>
		 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
		//here userid is retrieved through session 'uid from login.jsp
				request.getSession();
				String uid=(String)session.getAttribute("uid");

		//here gid is retrieved through session from login.jsp
				String gid=(String)session.getAttribute("gid");

		//here username is retrieved through session from s_home.jsp
				String name=(String)session.getAttribute("s_name");

		String message=request.getParameter("message");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","root");
			
			PreparedStatement pst=con.prepareStatement("insert into chat(userid,name,message,date,time,gid) values(?,?,?,curdate(),curtime(),?)");
			pst.setString(1, uid);
			pst.setString(2, name);
			pst.setString(3, message);
			pst.setString(4, gid);
			
			int r=pst.executeUpdate();
			if(r!=0)
			{
				
				response.sendRedirect("s_chat1.jsp?gid="+gid);
			}
			else{
					out.println("| Message not sended |");	
			}
		}catch(Exception e){
			System.out.println(e);
			e.printStackTrace();
		}
			
			
%>
</body>
</html>