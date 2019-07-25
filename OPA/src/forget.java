/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(urlPatterns = {"/forget"})
public class forget extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet forget</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet forget at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter out=response.getWriter();
      String uid=request.getParameter("uid");
       String sq=request.getParameter("question");
        String sqa=request.getParameter("answer");
        Boolean status=checksq(uid,sq,sqa);
        if(!status){
              request.setAttribute("errorMessage","itsSet");
                    
                        //out.println("Username and Password Incorrect");
			RequestDispatcher rd=request.getRequestDispatcher("forgetpassword.jsp");
                        
                        rd.forward(request, response);
       
    }
        else{
             Boolean status3=email2(uid);
             if(!status3){
                  request.setAttribute("errorMessage1","itsSet");
                    
                        //out.println("Username and Password Incorrect");
			RequestDispatcher rd=request.getRequestDispatcher("forgetpassword.jsp");
                        
                        rd.forward(request, response);
       
             }
             else{
              request.setAttribute("errorMessage2","itsSet");
                    
                        //out.println("Username and Password Incorrect");
			RequestDispatcher rd=request.getRequestDispatcher("forgetpassword.jsp");
                        
                        rd.forward(request, response);
        }
    }
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private Boolean checksq(String uid, String sq, String sqa) {
        Statement st = null;
        ResultSet rs = null;
        
         String sq1=null;
         String sqA1=null;
        Boolean status1 = false;
         try{
    	 Class.forName("com.mysql.jdbc.Driver");
     }catch (ClassNotFoundException ex) {
            System.out.println("Driver not ound" +ex);
        } 
        
        
        Connection connection = null;
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","root");
                    
            st = connection.createStatement();
            String query="SELECT securityQ,securityA from login where userid='"+uid+"'";
            rs = st.executeQuery(query);
             if (rs.next()) {
                sq1=rs.getString(1);
                sqA1=rs.getString(2);
            }
             
             if(sq1.equals(sq))
             {
                 if(sqA1.equals(sqa))
                 status1=true;
           
             }
             else{
                 
                     status1=false;}
                     
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
       
        
        
       return status1;
    }

    private Boolean email2(String uid) {
         Statement st = null;
        ResultSet rs = null;
         Statement st1 = null;
        ResultSet rs1 = null;
        String id=null;
        String pass=null;
        String name=null;
                String emal=null;
       
         try{
    	 Class.forName("com.mysql.jdbc.Driver");
     }catch (ClassNotFoundException ex) {
            System.out.println("Driver not ound" +ex);
        } 
        
        
        Connection connection = null;
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","root");
                    
            st = connection.createStatement();
            String query="SELECT email,name from detail where userid='"+uid+"'";
           st1 = connection.createStatement();
            String query1="SELECT userid,password from login where userid='"+uid+"'";
             
            rs = st.executeQuery(query);
           
             if (rs.next()) {
                emal=rs.getString(1);
                name=rs.getString(2);
                  rs1 = st1.executeQuery(query1);
                if(rs1.next()){
               
                 id=rs1.getString(1);
                 pass=rs1.getString(2);
                }
            }
    }
         catch (SQLException ex) {
            ex.printStackTrace();
        }
        boolean status2=false;
         String to=emal;
  
  //Get the session object  
  Properties props = new Properties();  
  props.put("mail.smtp.host", "smtp.gmail.com");  
  props.put("mail.smtp.socketFactory.port", "587");  
  props.put("mail.smtp.socketFactory.class",  
            "javax.net.ssl.SSLSocketFactory"); 
   props.put("mail.smtp.starttls.enable","true");
  props.put("mail.smtp.auth", "true");  
  props.put("mail.smtp.port", "587");   
 

  Session session = Session.getInstance(props,  
   new javax.mail.Authenticator() {  
   protected PasswordAuthentication getPasswordAuthentication() {  
   return new PasswordAuthentication("opasystem@gmail.com","opasystem1$");//change accordingly  
   }  
   
          });
          
          
    
  //compose message  
  try {  
   MimeMessage message = new MimeMessage(session);  
   message.setFrom(new InternetAddress("opasystem@gmail.com"));//change accordingly  
   message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
   message.setSubject("Welcome "+name);  
   //message.setText("Your id is" +id +"And your Password is" +pass);  
   message.setText("Description of Your Account is : "+"\r\n"+"\r\n"+"Your id is : "+id+"\r\n"+"\r\n"+"Your Password is : "+pass+"\r\n"+"\r\n"+"Try To Remember Next Time"); 
  // message.setText("Your Password is : "+pass);
     
   //send message 
      System.out.println("Hiiiiii transport");
   Transport.send(message);  
  
   System.out.println("message sent successfully");  
   status2=true;
   //out.println("Successful");
  }     catch (MessagingException ex) {
           status2=false;
           ex.printStackTrace();
        }
        return status2;
   
    } 

}     



