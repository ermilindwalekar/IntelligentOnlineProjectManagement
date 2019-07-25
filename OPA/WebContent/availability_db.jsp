<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="javax.servlet.RequestDispatcher"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

		<%
				String year=request.getParameter("q");
				ResultSet rs3=null,rs4=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","root");
				System.out.println("connected");
				
				PreparedStatement pst3=con.prepareStatement("SELECT DISTINCT a.fid,d.name,COUNT(a.year) AS '3rd year' FROM availability a,detail d WHERE a.fid=d.userid AND a.year='3' GROUP BY fid");
				rs3=pst3.executeQuery();
				
				PreparedStatement pst4=con.prepareStatement("SELECT DISTINCT a.fid,d.name,COUNT(a.year) AS '4th year' FROM availability a,detail d WHERE a.fid=d.userid AND a.year='4' GROUP BY fid");
				rs4=pst4.executeQuery();
					
				
			if(year.equals("3")){
				
				if(rs3.next())
			    {   %>
                      <div style="height:350px; overflow:auto">
                             <table border="0" cellpadding='4' cellspacing='4'>
                                                    
					<tr bgcolor='#FBDEC4'>				
								
						<th>Faculty Id</th>
						
						<th>Faculty Name</th>
															
						<th>3rd Year Groups Registered</th>
						
					</tr>
				<%	boolean b=false;
						do{
							//Here gid is taken from session
							String fid=rs3.getString("fid");
							String name=rs3.getString("name");
							int year3=rs3.getInt("3rd Year");
							
							
							if(b)
							out.println("<tr bgcolor='#FFFFFF'>");
							else
							out.println("<tr bgcolor='#FFFFFF'>");
							
							b=!b;
				%>
							<td>
								<center>
								<%=fid%>
								</center>
							</td>
							<td>
								<center>
								<%=name%>
								</center>
							</td>
							<td>
								<center>
								<%=year3+"/4"%>
								</center>
							</td>
						</tr>
				
				<%			  }while(rs3.next());         %>
							</table>
				
			<%  	}
			
			else
				{
					out.println("| No Data found |");
				}
				
			}
				
				if(year.equals("4")){
					
				if(rs4.next())
			    {   %>
	                  	<div style="height:350px; overflow:auto">
	                         <table border="0" cellpadding='4' cellspacing='4'>
	                                                
					<tr bgcolor='#FBDEC4'>				
								
						<th>Faculty Id</th>
						
						<th>Faculty Name</th>
															
						<th>4th Year Groups Registered</th>
						
					</tr>
				<%	boolean b=false;
						do{
							//Here gid is taken from session
							String fid=rs4.getString("fid");
							String name=rs4.getString("name");
							int year4=rs4.getInt("4th Year");
							
							if(b)
							out.println("<tr bgcolor='#FFFFFF'>");
							else
							out.println("<tr bgcolor='#FFFFFF'>");
							
							b=!b;
				%>
							<td>
								<center>
								<%=fid%>
								</center>
							</td>
							<td>
								<center>
								<%=name%>
								</center>
							</td>
							<td>
								<center>
								<%=year4+"/4"%>
								</center>
							</td>
						</tr>
				
				<%			  }while(rs4.next());         %>
							</table>
				
			<%  	}
		
				
				else
				{
					out.println("| No Data found |");
				}
	
				}
				rs3.close();
				pst3.close();
			
rs4.close();
				
				pst4.close();
						con.close();
		
} catch(Exception e)
{
	System.out.println("error "+e);
	e.printStackTrace();
	}


		
		%>

</body>
</html>