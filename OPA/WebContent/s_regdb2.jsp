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
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","root");
			
			String s_uid=(String)session.getAttribute("uid");		// VALUES HAVE BEEN RETRIEVED THROUGH THE SESSION NAME "UID" 
			String name=(String)session.getAttribute("nm");
			String academic=(String)session.getAttribute("acad");
			String stream=(String)session.getAttribute("strm");
			String department=(String)session.getAttribute("dept");
			String email=(String)session.getAttribute("mail");
			String section=(String)session.getAttribute("sect");
			String mobno=(String)session.getAttribute("mob");
			String year=(String)session.getAttribute("yr");
			
			PreparedStatement pst=con.prepareStatement("insert into detail(userid,name,academic_year,stream,department,section,email,mobno,year) values(?,?,?,?,?,?,?,?,?)");
			pst.setString(1, s_uid);
			pst.setString(2, name);
			pst.setString(3, academic);
			pst.setString(4, stream);
			pst.setString(5, department);
			pst.setString(6, section);
			pst.setString(7, email);
			pst.setString(8, mobno);
			pst.setString(9, year);
			
			int r=pst.executeUpdate();
			if(r!=0)
			{
						String gid=request.getParameter("gid");
						String password=request.getParameter("password");
						String cpassword=request.getParameter("cpassword");
						String question=request.getParameter("question");
						String answer=request.getParameter("answer");
						
						if(!password.equals(cpassword))
						{
							 request.setAttribute("errorMessage","itsSet");
				                    
				                        //out.println("Username and Password Incorrect");
							RequestDispatcher rd=request.getRequestDispatcher("student_reg2.jsp");
				                        
				                        rd.forward(request, response);
						}
						else
						{
						try {
						
											
						
						PreparedStatement pst1=con.prepareStatement("insert into login(userid,password,securityQ,securityA,role,gid) values(?,?,?,?,'student',?)");
						pst1.setString(1, s_uid);
						pst1.setString(2, password);
						pst1.setString(3, question);
						pst1.setString(4, answer);
						pst1.setString(5, gid);
						
						int r1=pst1.executeUpdate();
						if(r1!=0)
							{
								 request.setAttribute("errorMessage5","itsSet");
				                    
				                        //out.println("Username and Password Incorrect");
							RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
				                        
				                        rd.forward(request, response);
							}		
						else
							{
								 request.setAttribute("errorMessage6","itsSet");
				                    
				                        //out.println("Username and Password Incorrect");
							RequestDispatcher rd=request.getRequestDispatcher("student_reg2.jsp");
				                        
				                        rd.forward(request, response);
							}
						pst1.close();
						con.close();
						}catch (Exception e) {		
							request.setAttribute("errorMessage25","itSet");
				                    
				                        //out.println("Username and Password Incorrect");
							RequestDispatcher rd=request.getRequestDispatcher("student_reg2.jsp");
				                        
				                        rd.forward(request, response);
						}
						}
							
				
				
			}
				
			else
				{
					 request.setAttribute("errorMessage4","itsSet");
	                    
	                        //out.println("Username and Password Incorrect");
				RequestDispatcher rd=request.getRequestDispatcher("student_reg1.jsp");
	                        
	                        rd.forward(request, response);
				}
			pst.close();
			con.close();
			}catch (Exception e) {		
				request.setAttribute("errorMessage7","itsSet");
	                    
	                        //out.println("Username and Password Incorrect");
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
	                        
	                        rd.forward(request, response);
			}
				
		
		
		
			%>
		
		</body>
		</html>