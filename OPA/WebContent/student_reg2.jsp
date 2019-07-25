<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Emerald 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20120902

-->
<html xmlns="http://www.w3.org/1999/xhtml">
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
        height: 700px;
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
	float: right;
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
	padding-left: 30px;
	letter-spacing: -.5px;
	font-size: 1.8em;
	color: #616D79;
}

#sidebar p {
	margin: 0 0px;
	padding: 0px 30px 0px 30px;
	text-align: justify;
}

#sidebar a {
	border: none;
}

#sidebar a:hover {
	text-decoration: underline;
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
span1{
    color: red;
}
    </style>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>OPA System</title>
<link href='http://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
 <body onload="first()">
    <script>
        function first(){
            document.myform1.gid.focus();
        }
        function Gid(){
            var gd=document.myform1.gid;
            var patt=/^[G][CS|IT]{2}[1-4]{1}[3|4]{1}[0-8]{2}$/;
            if(gd.value.match(patt)){
                document.myform1.password.focus();
                return true;
            }
            else{
                alert("Enter valid Group ID");
                 gd.focus();
                return false;
            }
        }
        function ValidatePwd(mn,mx){
            var pwd=document.myform1.password;
            var pwd_len=pwd.value.length;
           
            if(pwd_len==0||pwd_len<mn||pwd_len>mx){
                alert("Password length must be in between 3 to 7");
                pwd.focus();
                return false;
            }
            else{
           
                document.myform1.cpassword.focus();
                return true;
            
        }
    }
    function ValidateConfirm(){
          document.myform1.question.focus();
                return true;
    }
    function ValidateQuestion(){
          document.myform1.answer.focus();
                return true;
    }
    function ValidateAns(){
        var ans=document.myform1.answer;
        var pat1=/^[a-zA-Z]*$/;
        if(ans.value.match(pat1)){
            document.myform1.Submit.focus();
            return true;
            
        }
        else{
            alert("Only Alphabets are allowed");
            ans.focus();
            return false;
        }
           
    }
        </script>
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
				<h2 class="title">Thank You for Connecting With Us</h2>
				
				<div style="clear: both;">&nbsp;</div>
                        </div><br>
                                 <%
                                            if(request.getAttribute("errorMessage6")!=null)
                                            {
                                            %>
                                          <span1 class="red" >Error In Data Insertion !!!</span1>
                                            <%}%>
                                         <%
                                            if(request.getAttribute("errorMessage")!=null)
                                            {
                                            %>
                                          <span1 class="red" >Password Didn't Match !!!</span1>
                                            <%}%>
                                          <%
                                            if(request.getAttribute("errorMessage25")!=null)
                                            {
                                            %>
                                          <span1 class="red" >You Can't Choose That Id !!!</span1>
                                            <%}%>
				
			
	<center>
		   <fieldset>	
		     <legend><h1>Registration Page 2</h1></legend>
		  	  <form name="myform1" action="s_regdb2.jsp" method="post">
		  		<table>
		  			<tr>
						<td>GROUP_ID :</td> <td><input type="text" name="gid" onblur="Gid()" required></td>
					</tr>
		  			<tr>
		  				<td>PASSWORD :</td> <td><input type="password" name="password" onblur="ValidatePwd(3,7)" required></td>
					</tr>
					<tr>
		  				<td>CONFIRM PASSWORD :</td> <td><input type="password" name="cpassword" onblur="ValidateConfirm()" required></td>
					</tr>
					<tr>	
						<td>HINT QUESTION :</td>
							<td><select name="question" onblur="ValidateQuestion()">
								 <option value="What is your favourite color?">What is your favourite color?</option>
								 <option value="What is your pet's name?">What is your pet's name?</option>
								 <option value="What is your school name?">What is your school name?</option>
								 <option value="Which is your favourite movie?">What is your favourite movie?</option>
						    </select></td>
					</tr>
					<tr>
						<td>ANSWER :</td>  <td><input type="text" name="answer" onblur="ValidateAns()" required>
							
					</tr>
					
					<tr>
						<td><br><input type="submit" value="SUBMIT"> <input type="reset" value="RESET"></td>
		  	  		</tr>
		  	  	</table>
		  	  </form>
		   </fieldset>	
		  </center>
                </div></div>
	<div class="container"><img src="images/img03.png" width="1000" height="40" alt="" /></div>
	<!-- end #page -->

<div id="footer-content"></div>
<div id="footer">
	<p>Copyright (c) 2012 Sitename.com. All rights reserved. Design by roopam gupta</p>
</div>
<!-- end #footer -->
</body>
</html>

