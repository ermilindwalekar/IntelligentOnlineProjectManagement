<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*" %>
    <%@ page import="java.io.*"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@page import="javax.servlet.*" %>
	<%@page import="javax.servlet.http.*" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OPA System</title>
</head>
<body>
		<%  
		String groupid=request.getParameter("q");  
		
		
		
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

			try{  
					Class.forName("com.mysql.jdbc.Driver");
					System.out.println("Driver loaded");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","root");
					System.out.println("connected");
					
							PreparedStatement pst=con.prepareStatement("select * from group_projects where gid like ? AND gid IN (select gid from id where fid=?)");  
							pst.setString(1 , groupid+"%");
							pst.setString(2 , uid);
							//out.print(pst);
							ResultSet rs=pst.executeQuery();  
							//out.println(rs);
							if(rs.next())
						    {   %>
	
								<div id="dtl_table">
								<table border='0' cellpadding='4' cellspacing='4'> 
								<tr bgcolor="#FBDEC4"> 
								<th>GroupId</th> 
								<th>Project Title</th>
								<th>Student List</th> 
								</tr> 
							
								<% 
									boolean b=false;
									do 
									{  	
										if(b)
											out.println("<tr bgcolor='#FFFFFF'>");
											else
											out.println("<tr bgcolor='#FFFFFF'>");
											b=!b;
								%>
									<tr>
											<td><center><%=rs.getString("gid") %></center></td> 
											<td><center><%=rs.getString("project_title")%></center></td> 
											<td><center><a href="viewdetails.jsp?gid=<%=rs.getString("gid")%>">View Details</a></center></td>
									</tr>
											<% }while(rs.next()); %> 
							 
									</table>
                                                                </div> <br><br> 
			<%				}
							else
								{
									out.println("| No Groups Exist |");
								}		
								
								rs.close();
								pst.close();
								con.close();
							
					
			}catch(Exception e)
				{
				System.out.println("error "+e);
					e.printStackTrace();
				}  
		  %>
</body><br>
</html>