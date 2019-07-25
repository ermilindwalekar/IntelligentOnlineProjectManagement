<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OPA System</title>
    </head>
    <body>
       <%
           String uid=(String)session.getAttribute("uid");	
		String CP=request.getParameter("cp");
		String NP=request.getParameter("np");
		String NP1=request.getParameter("np1");
		Boolean pwd=retrieve(uid,CP);
                 if(!pwd){
              request.setAttribute("errorMessage","itsSet");
                    
                        //out.println("Username and Password Incorrect");
			RequestDispatcher rd=request.getRequestDispatcher("a_changepassword.jsp");
                        
                        rd.forward(request, response);
            
            }
            else{
                if(NP.equals(NP1)){
                     Boolean update=Update(uid,NP,CP,NP1);
                    
                       request.setAttribute("errorMessage1","itsSet");
                    
                        //out.println("Username and Password Incorrect");
			RequestDispatcher rd=request.getRequestDispatcher("a_changepassword.jsp");
                        
                        rd.forward(request, response);
                     }
                
                     else{
                        request.setAttribute("errorMessage2","itsSet");
                    
                        //out.println("Username and Password Incorrect");
			RequestDispatcher rd=request.getRequestDispatcher("a_changepassword.jsp");
                        
                        rd.forward(request, response);
                     }
                }
          
      
             
	%>	
		
    



<%!
    private Boolean retrieve(String uid,String CP) {
           Statement st = null;
        ResultSet rs = null;
        String passwd = "" ;
        Boolean status = false;
        try {
		Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException ex){
            ex.printStackTrace();
        }
        try{
		System.out.println("Driver loaded");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","root");
		
                    
            st = con.createStatement();
            String query="SELECT password from admin where userid='"+uid+"'";
            rs = st.executeQuery(query);
             if (rs.next()) {
                passwd = rs.getString("password").trim();
            }
             
             if(passwd.equals(""))
             {
                 status=false;
           
             }
             else{
                 if(passwd.equals(CP)){
                      status=true;}
                 else{
                     status=false;}
                     
        }
        }
        
        catch (SQLException ex) {
            ex.printStackTrace();
        }
       
        
      
       return status;
    }     
        
        
        
        
        %>
       <%!
       private Boolean Update(String uid, String NP,String CP,String NP1) {
         Statement st = null;
        ResultSet rs = null;
       String pwd1="";
       Boolean status1 = false;
        try {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver loaded");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","root");
       
      PreparedStatement pst=con.prepareStatement("select password from admin where userid=?");
	pst.setString(1,uid);
	
	rs=pst.executeQuery();
	
	PreparedStatement pst1=con.prepareStatement("update admin set password=? where userid=?");
	pst1.setString(1,NP);
	pst1.setString(2,uid);
	if(rs.next())
	{
		String pwd=rs.getString("password");
		if(pwd.equals(CP))
		{
			if(NP.equals(NP1))
			{
				pst1.executeUpdate();
				status1=true;
			}
			else
			{
				status1=false;	
			}
		}
        }
        }
                catch(Exception e)
{
	
	e.printStackTrace();	
}
                return status1;
       }
       %>





</body>
</html>
