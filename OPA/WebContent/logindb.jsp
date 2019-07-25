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
String password=request.getParameter("password");
try {
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("Driver loaded");
	Connection con=null;
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","root");
	System.out.println("connected");
	
	if(userid.equals("a101"))
		{
			PreparedStatement pst1=con.prepareStatement("select password from admin where userid=? and password=? ");
			pst1.setString(1,userid);
			pst1.setString(2, password);
			ResultSet rs1=pst1.executeQuery();
		    
			if(rs1.next())
			  {
			    String dbpassword1=rs1.getString("password");
			    	
				if(dbpassword1.equals(password))
					{
								
						session=request.getSession();
						session.setAttribute("uid", userid);
						response.sendRedirect("admin.jsp");
					}
			  }
				else
					{
			                     request.setAttribute("errorMessage","itsSet");
			                    
			                        //out.println("Username and Password Incorrect");
						RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			                        
			                        rd.forward(request, response);
					}
	
		}
	else
		{
		PreparedStatement pst=con.prepareStatement("select password,role,gid from login where userid=? and password=? ");
		
		pst.setString(1,userid);
		pst.setString(2, password);
		   
		ResultSet rs=pst.executeQuery();
		
		if(rs.next())
		{
			String dbpassword=rs.getString("password");
			String role=rs.getString("role");
		        String gid=rs.getString("gid");
		        
		        
			if(dbpassword.equals(password))
			{
				if(role.equals("faculty"))
				{
					
					session=request.getSession();
					session.setAttribute("uid", userid);
					session.setAttribute("roles", role);
		                        session.setAttribute("gid", gid);
					response.sendRedirect("faculty.jsp");
				}
				else
				{
						session=request.getSession();
						session.setAttribute("uid", userid);
						session.setAttribute("roles", role);
		                                 session.setAttribute("gid", gid);
						response.sendRedirect("student.jsp");
				}		
				
			}
	     }
		else
			{
	                     request.setAttribute("errorMessage","itsSet");
	                    
	                        //out.println("Username and Password Incorrect");
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
	                        
	                        rd.forward(request, response);
			}

		}
		
}

	

catch (Exception e)
{
		System.out.println(e);
		e.printStackTrace();
}


%>
</body>
</html>