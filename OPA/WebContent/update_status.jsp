<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*" %>
    <%@ page import="java.io.*"%>
    <%@ page import="java.io.PrintWriter" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OPA System</title>
</head>
<body>

<%
		//here groupid is retrieved through session 'gid from download.jsp					
			session=request.getSession();
			String gid=(String)session.getAttribute("gid");
		
			out.println(gid);
		String comment=request.getParameter("comment");
		String status=request.getParameter("status");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","root");
			System.out.println("connected");
			boolean b=false;
			PreparedStatement pst;
			pst=con.prepareStatement("update project_details set f_comment=?,status=?,f_date=curdate(),f_time=curtime() where gid=? AND status='Pending'");
				
				pst.setString(1, comment);
				pst.setString(2, status);
				pst.setString(3, gid);
					
				int r=pst.executeUpdate();
				out.println(gid);
				if(r!=0)
					{
						response.sendRedirect("pending_request.jsp");
										 		
					}
				else
				{
					out.println("Error in  data insertion ");
					response.sendRedirect("download.jsp");
				}
			
				pst.close();
				con.close();
			}catch (Exception e) {		
				out.println("<br>Error "+e);
				e.printStackTrace();
			}
		
		%>

</body>
</html>