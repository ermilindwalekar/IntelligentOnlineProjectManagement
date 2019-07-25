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
			
			String f_uid=(String)session.getAttribute("uid");		// VALUES HAVE BEEN RETRIEVED THROUGH THE SESSION NAME "f_UID" 
			String name=(String)session.getAttribute("nm");
			String stream=(String)session.getAttribute("strm");
			String department=(String)session.getAttribute("dept");
			String email=(String)session.getAttribute("mail");
			String mobno=(String)session.getAttribute("mob");
			
			PreparedStatement pst=con.prepareStatement("insert into detail(userid,name,stream,department,email,mobno) values(?,?,?,?,?,?)");
			pst.setString(1, f_uid);
			pst.setString(2, name);
			pst.setString(3, stream);
			pst.setString(4, department);
			pst.setString(5, email);
			pst.setString(6, mobno);
			
			int r=pst.executeUpdate();
			if(r!=0)
			{
							String gid3_1=request.getParameter("gid3_1");
							String gid3_2=request.getParameter("gid3_2");
							String gid3_3=request.getParameter("gid3_3");
							String gid3_4=request.getParameter("gid3_4");
							String gid4_1=request.getParameter("gid4_1");
							String gid4_2=request.getParameter("gid4_2");
							String gid4_3=request.getParameter("gid4_3");
							String gid4_4=request.getParameter("gid4_4");
							
							String password=request.getParameter("password");
							String cpassword=request.getParameter("cpassword");
							String question=request.getParameter("question");
							String answer=request.getParameter("answer");
							
							if(!password.equals(cpassword))
							{
								 request.setAttribute("errorMessage","itsSet");
					                    
					                        //out.println("Username and Password Incorrect");
								RequestDispatcher rd=request.getRequestDispatcher("faculty_reg2.jsp");
					                        
					                        rd.forward(request, response);
							}
							else
							{
							try {
												
							
							PreparedStatement pst1=con.prepareStatement("insert into id(gid,fid) values(?,?),(?,?),(?,?),(?,?),(?,?),(?,?),(?,?),(?,?)");
							pst1.setString(1, gid3_1);
							pst1.setString(2, f_uid);
							pst1.setString(3, gid3_2);
							pst1.setString(4, f_uid);
							pst1.setString(5, gid3_3);
							pst1.setString(6, f_uid);
							pst1.setString(7, gid3_4);
							pst1.setString(8, f_uid);
							
							pst1.setString(9, gid4_1);
							pst1.setString(10, f_uid);
							pst1.setString(11, gid4_2);
							pst1.setString(12, f_uid);
							pst1.setString(13, gid4_3);
							pst1.setString(14, f_uid);
							pst1.setString(15, gid4_4);
							pst1.setString(16, f_uid);
							
							
							int r1=pst1.executeUpdate();
							
							if(r1!=0)
								{
									PreparedStatement pst2=con.prepareStatement("insert into login(userid,password,securityQ,securityA,role,gid) values(?,?,?,?,'faculty',?)");
									
									pst2.setString(1, f_uid);
									pst2.setString(2, password);
									pst2.setString(3, question);
									pst2.setString(4, answer);
									pst2.setString(5, gid3_1);
									
									int r2=pst2.executeUpdate();
									if(r2!=0)
										{
											 request.setAttribute("errorMessage8","itsSet");
					                    
					                        //out.println("Username and Password Incorrect");
								RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
					                        
					                        rd.forward(request, response);
										}
									else
										{
											 request.setAttribute("errorMessage9","itsSet");
					                    
					                        //out.println("Username and Password Incorrect");
								RequestDispatcher rd=request.getRequestDispatcher("faculty_reg2.jsp");
					                        
					                        rd.forward(request, response);
										}
									pst2.close();
								}	
							else
								{
									 request.setAttribute("errorMessage9","itsSet");
					                    
					                        //out.println("Username and Password Incorrect");
								RequestDispatcher rd=request.getRequestDispatcher("faculty_reg2.jsp");
					                        
					                        rd.forward(request, response);
								}
							pst1.close();
							con.close();
							}catch (Exception e) {		
								 request.setAttribute("errorMessage9","itsSet");
					                    
					                        //out.println("Username and Password Incorrect");
								RequestDispatcher rd=request.getRequestDispatcher("faculty_reg2.jsp");
					                        
					                        rd.forward(request, response);
							}
							}
										
				
				
			}
			else
				{
					 request.setAttribute("errorMessage7","itsSet");
	                    
	                        //out.println("Username and Password Incorrect");
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
	                        
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