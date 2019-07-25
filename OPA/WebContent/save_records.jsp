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
 <style>

body {
	margin: 0;
	padding: 0;
	background: #C5DA99 url(images/img01.jpg) repeat;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	color: #787878;
}

h1, h2, h3 {
	margin: 0;
	padding: 0;
	font-weight: initial;
	font-family: 'Abel', sans-serif;
	color: #3DA29B;
}

h1 {
	font-size: 2em;
}

h2 {
	font-size: 2.8em;
        color: #000000;
}

h3 {
	font-size: 1.6em;
        
}

p, ul, ol {
	margin-top: 0;
	line-height: 180%;
}

ul, ol {
}

a {
	text-decoration: none;
	color: #5E5E5E;
}

a:hover {
}

#wrapper {
	padding-top: 50px;
}

.container {
	width: 1000px;
	margin: 0px auto;
}

/* Header */

#header-wrapper {
	overflow: hidden;
	height: 140px;
}

#header {
	width: 900px;
	height: 100px;
	margin: 0 auto;
	padding: 0px 50px;
	background: url(images/img02.jpg) repeat;
}

/* Logo */

#logo {
	float: left;
	width: 800px;
	margin: 0;
	padding: 0;
	color: #FFFFFF;
}

#logo h1, #logo p {
}

#logo h1 {
  color: #FFFFFF;
	line-height: 100px;
	letter-spacing: -2px;
	text-transform: initial;
	font-size: 3.8em;
}

#logo h1 a {
	color: #FFFFFF;
	text-shadow: 1px 1px 0px rgba(0,0,0,.2);
}

#logo p {
	margin: 0;
	padding: 0px 0 0 0px;
	letter-spacing: -1px;
	font: normal 18px Georgia, "Times New Roman", Times, serif;
	font-style: italic;
	color: #8E8E8E;
}

#logo p a {
	color: #8E8E8E;
}

#logo a {
	border: none;
	background: none;
	text-decoration: none;
	color: #000000;
}

/* Splash */

#splash {
	width: 960px;
	height: 300px;
	margin: 0px auto;
}

/* Search */


#search form {
	height: 41px;
	margin: 0;
	padding: 10px 0 0 20px;
}

#search fieldset {
	margin: 0;
	padding: 0;
	border: none;
}

#search-text {
	width: 170px;
	padding: 6px 5px 2px 5px;
	border: 1px solid #E7EBED;
	background: #FFFFFF;
	text-transform: lowercase;
	font: normal 11px Arial, Helvetica, sans-serif;
	color: #5D781D;
}

#search-submit {
	width: 50px;
	height: 22px;
	border: none;
	background: #B9B9B9;
	color: #000000;
}

/* Menu */

#menu {
	float: right;
	width: 500px;
	height: 90px;
	margin: 0 auto;
	padding: 0;
}

#menu ul {
	float: right;
	margin: 0;
	padding: 0px 0px 0px 0px;
	list-style: none;
	line-height: normal;
}

#menu li {
	float: left;
}

#menu a {
	display: block;
	line-height: 100px;
	margin-right: 1px;
	padding: 0px 20px 0px 20px;
	text-decoration: none;
	text-align: center;
	text-shadow: 1px 1px 0px rgba(0,0,0,.2);
	text-transform: uppercase;
	font-family: 'Abel', sans-serif;
	font-size: 16px;
	font-weight: 300;
	color: #FFFFFF;
	border: none;
}

#menu a:hover, #menu .current_page_item a {
	text-decoration: none;
	color: #FFFFFF;
}

#menu .current_page_item a {
}

/* Page */

#page {
	width: 900px;
        height: 600px;
	margin: 0 auto;
	padding: 30px 50px;
	background: #FFFFFF;
}

/* Content */

#content {
	float: left;
	width: 590px;
	padding: 50px 0px 0px 0px;
}

.post {
	overflow: hidden;
	margin-bottom: 40px;
	border-bottom: 1px solid #E7EBED;
}

.post .title {
    color:  #000000;
	height: 41px;
	padding: 7px 0px 0px 0px;
	letter-spacing: -1px;
}

.post .title a {
	border: none;
	text-transform: initial;
	color: #3A4648;
}

.post .meta {
	margin-bottom: 30px;
	padding: 10px 0px 0px 0px;
	text-align: left;
	font-family: 'Abel', sans-serif;
	font-size: 16px;
	font-weight: 300;
}

.post .meta .date {
	float: left;
}

.post .meta .posted {
	float: right;
}

.post .meta a {
}

.post .entry {
	padding: 0px 0px 20px 0px;
	padding-bottom: 20px;
	text-align: justify;
}

.links {
	padding-top: 20px;
	margin-bottom: 30px;
}

.more {
	display: block;
	float: left;
	width: 88px;
	height: 25px;
	padding: 2px 0px 0px 0px;
	margin-right: 10px;
	background: url(images/img08.jpg) no-repeat left top;
	text-align: center;
}

.comments {
	display: block;
	float: left;
	width: 88px;
	height: 25px;
	padding: 2px 0px 0px 0px;
	background: url(images/img08.jpg) no-repeat left top;
	text-align: center;
}

/* Sidebar */

#sidebar {
	float: right ;
	width: 280px;
	margin: 0px;
	padding: 30px 0px 0px 0px;
}

#sidebar ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

#sidebar li {
	margin: 0;
	padding: 0;
}

#sidebar li ul {
	margin: 0px 0px;
	padding-bottom: 30px;
}

#sidebar li li {
	line-height: 35px;
	border-bottom: 1px solid #E7EBED;
	margin: 0px 30px;
	border-left: none;
}

#sidebar li li span {
	display: block;
	margin-top: -20px;
	padding: 0;
	font-size: 11px;
	font-style: italic;
}

#sidebar li li a {
	padding: 0px 0px 0px 15px;
       
}

#sidebar h2 {
	height: 38px;
	color: #345E9B;
	letter-spacing: -.5px;
	font-size: 1.8em;
	color: #000000;
}

#sidebar p {
	margin: 0 0px;
	padding: 0px 30px 0px 30px;
	text-align: justify;
}

#sidebar a {
	border: none;
        text-decoration-style:  dashed;
        color: #345E9B;
        
}

#sidebar a:hover {
	text-decoration: underline;
        color: coral;
}
/* Calendar */

#calendar {
}

#calendar_wrap {
	padding: 20px;
}

#calendar table {
	width: 100%;
}

#calendar tbody td {
	text-align: center;
}

#calendar #next {
	text-align: right;
}

/* Three Column Footer Content */

#footer-content {
	color: #D6E2F0;
}

#footer-content a {
	color: #92A9B6;
}

#footer-bg {
	overflow: hidden;
	width: 890px;
	padding: 30px 55px 50px 55px;
}

#footer-content h2 {
	margin: 0px;
	padding: 0px 0px 20px 0px;
	letter-spacing: -1px;
	text-transform: lowercase;
	font-size: 26px;
	color: #FFFFFF;
}

#footer-content ul {
	margin: 0px;
	padding: 0px 0px 0px 20px;
}

#footer-content a {
}

#column1 {
	float: left;
	width: 290px;
	margin-right: 30px;
}

#column2 {
	float: left;
	width: 280px;
}

#column3 {
	float: right;
	width: 260px;
}

/* Footer */

#footer {
	height: 100px;
	margin: 0 auto;
	padding: 0px 0 15px 0;
	font-family: 'Abel', sans-serif;
}

#footer p {
	margin: 0;
	padding-top: 10px;
	letter-spacing: 1px;
	line-height: normal;
	font-size: 14px;
	text-transform: uppercase;
	text-align: center;
	color: #527800;
}

#footer a {
	color: #527800;
}

#marketing {
	overflow: hidden;
	margin-bottom: 30px;
	padding: 20px 0px 10px 0px;
	border-top: 1px solid #E7EBED;
	border-bottom: 1px solid #E7EBED;
}

#marketing .text1 {
	float: left;
	margin: 0px;
	padding: 0px;
	letter-spacing: -2px;
	text-transform: lowercase;
	font-size: 34px;
	color: #345E9B;
}

#marketing .text2 {
	float: right;
}

#marketing .text2 a {
	display: block;
	width: 252px;
	height: 38px;
	padding: 15px 0px 0px 0px;
	background: url(images/img07.jpg) no-repeat left top;
	letter-spacing: -2px;
	text-align: center;
	text-transform: lowercase;
	font-size: 30px;
	color: #FFFFFF;
}




    </style>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>OPA System</title>
<link href='http://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


       
<div id="wrapper">
	<div id="header-wrapper" class="container">
	<div id="header" class="container">
		<div id="logo">
                    <h1>Online Project Approval System</h1>
		</div>
		
		
	</div>
	<div><img src="images/img03.png" width="1000" height="40" alt="" /></div>
	</div>
	<!-- end #header -->
	<div id="page">
		<div id="content">
		<div class="post">
                    <h2>Save Student Records :</h2></div>
			
			 <% 
			 
			//session (USERID) is retrieved here from login.jsp	
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
				try {
							Class.forName("com.mysql.jdbc.Driver");
							System.out.println("Driver loaded");
							Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","root");
								System.out.println("connected");
							PreparedStatement pst=con.prepareStatement("SELECT gp.gid,gp.project_title,COUNT(pd.status) AS approvedRecord,d.year FROM group_projects gp,project_details pd,detail d WHERE pd.userid=d.userid AND EXISTS(SELECT gid FROM group_projects WHERE pd.gid=gp.gid) AND STATUS='approved' GROUP BY gid");
    
							ResultSet rs=pst.executeQuery();
							
							if(rs.next())
							    {   %>
		                              	
		                               <fieldset>
		                                 <legend><h3>Approved Group Records</h3></legend>
									<div style="height:350px; overflow:auto">
		                                     <table border="0" cellpadding='4' cellspacing='4'>
		                                                            
									<tr bgcolor='#FBDEC4'>				
												
									<th>Group Id</th>
									
									<th>Project Title</th>
									
									<th>Records Approved</th>
									
									<th>Year</th>
																		
									</tr>
								<%	boolean b=false;
										do{
											//Here gid is taken from session
											String gid=rs.getString("gid");
											String project_title=rs.getString("project_title");
											int records=rs.getInt("approvedRecord");
											String year=rs.getString("year");
											if(b)
											out.println("<tr bgcolor='#FFFFFF'>");
											else
											out.println("<tr bgcolor='#FFFFFF'>");
											
											b=!b;
								%>
											<td>
												<center>
												<%=gid%>
												</center>
											</td>
											<td>
												<center>
												<%=project_title%>
												</center>
											</td>
											<td>
												<center>
												<%=records+"/5"%>
												</center>
											</td>
											<td>
												<center>
												<%=year%>
												</center>
											</td>
											
											</tr>
								
								<%			  }while(rs.next());         %>
											</table>
											</div>
											</fieldset>
											<br>
											
											<form action="SaveRecordsdb">
											<center>
											<input type="submit" value="Save">
											</center>
											</form>
											
									           <%
                                            if(request.getAttribute("errorMsg2")!=null)
                                            {
                                            %>
                                        &nbsp;&nbsp; &nbsp; &nbsp;   <span1 class="red" >Not all groups have submitted all files</span1>
                                            <%}%>
                                  
							<%  	}
							else
								{
									out.println("| No Records found |");
								}		
							
							rs.close();
							pst.close();
							con.close();
						
			} catch(Exception e)
				{
					System.out.println("error "+e);
					e.printStackTrace();
					}
				
			 
			 %>
			 		
		</div>
		<!-- end #content -->
                <div id="sidebar"><br><br><br>
                    
                        <ul><br><br><br><br>
				
                        <h2> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Records </h2>
                            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="save_records.jsp">Save Records</a><br></li>
			   			<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="search_records.jsp">Search Records</a><br></li>
			<br>
                            <li>	
                         <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Account Settings </h2>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="a_changepassword.jsp">Change Password</a><br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.jsp">Logout</a><br>
 			
                            </li></ul>	
				
			
		</div>
		<!-- end #sidebar -->
		<div style="clear: both;">&nbsp;</div>
        </div>
	<div class="container"><img src="images/img03.png" width="1000" height="40" alt="" /></div>
	<div id="footer-content"></div>
<div id="footer">
	<p>Copyright (c) 2012 Sitename.com. All rights reserved. Design by RSS</p>
</div>
	<!-- end #page -->
</div>

  
    
</body>
</html>