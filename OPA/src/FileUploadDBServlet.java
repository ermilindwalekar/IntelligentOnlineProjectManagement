import java.io.*;
import java.sql.*;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class FileUploadDBServlet
 */
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class FileUploadDBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static int document_typeId;
	// database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/mysql";
    private String dbUser = "root";
    private String dbPass = "root";
     
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// gets values of drop down box
        String document_type = request.getParameter("document_type");
        String file_type = request.getParameter("file_type");
        String s_comment= request.getParameter("s_comment");
        
        if(document_type.equals("Abstract"))
        {
        	document_typeId=1;
        }
        if(document_type.equals("SRS"))
        {
        	document_typeId=2;
        }
        if(document_type.equals("Diagrams"))
        {
        	document_typeId=3;
        }
        if(document_type.equals("Final Report"))
        {
        	document_typeId=4;
        }
        if(document_type.equals("Source Code"))
        {
        	document_typeId=5;
        }
      //here group id is retrieved through session 'gid'
      		HttpSession session=request.getSession();
      		String gid=(String)session.getAttribute("gid");
      		
		//here userid is retrieved through session 'uid from login.jsp
		String uid=(String)session.getAttribute("uid");
		
						if(uid==null)
						{
							response.sendRedirect("invalid.jsp");
						}		
					
				  		response.setHeader("cache-control", "no-cache");
						response.addHeader("cache-control", "no-store");
						response.addHeader("Cache-Control", "must-revalidate");
						response.setHeader("pragma", "no-cache");

			
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("file_upload");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
        Connection conn = null; // connection to the database
      
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            
            
            
		    String querySetLimit = "SET GLOBAL max_allowed_packet=198205600;";	// 10 MB
			Statement stSetLimit = conn.createStatement();
			stSetLimit.execute(querySetLimit);
			
			PreparedStatement pst = conn.prepareStatement("select status from project_details where inc=(select max(inc) from project_details where gid=?)");
			pst.setString(1, gid);
			ResultSet rs=pst.executeQuery();
			
			if(rs.next())
				{
					   
						String status_fetch = rs.getString("status");
						if(status_fetch.equals("Pending"))
						      {
						
											 request.setAttribute("errorMessage1","itsSet");
                    
                        //out.println("Username and Password Incorrect");
			RequestDispatcher rd=request.getRequestDispatcher("upload.jsp");
                        
                        rd.forward(request, response);
						      }
						else
							  {
											// constructs SQL statement
								 			String sql = "insert into project_details (document_type,file_type,file_upload,status,gid,userid,s_comment,s_date,s_time,document_typeId) values (?,?,?,?,?,?,?,curdate(),curtime(),?)";   
								            PreparedStatement statement = conn.prepareStatement(sql);
								            statement.setString(1, document_type);
								            statement.setString(2, file_type);
								            			             
								            if (inputStream != null) {
								                // fetches input stream of the upload file for the blob column
								                statement.setBlob(3, inputStream);
								            }
								 
								            statement.setString(4,"Pending");
								            statement.setString(5, gid);
								            statement.setString(6, uid);
								            statement.setString(7, s_comment);
								            statement.setInt(8, document_typeId);
								            
								            // sends the statement to the database server
								            int row = statement.executeUpdate();
								            out.println(statement);
								            if (row>0) 
									            {
									               request.setAttribute("errorMessage2","itsSet");
                    
                        //out.println("Username and Password Incorrect");
			RequestDispatcher rd=request.getRequestDispatcher("upload.jsp");
                        
                        rd.forward(request, response);
									            }
									        else
										        {
									            	 request.setAttribute("errorMessage3","itsSet");
                    
                        //out.println("Username and Password Incorrect");
			RequestDispatcher rd=request.getRequestDispatcher("upload.jsp");
                        
                        rd.forward(request, response);
										        }		
							  }
				 }else
				 		{
					 
								// constructs SQL statement
					 			String sql = "insert into project_details (document_type,file_type,file_upload,status,gid,userid,s_comment,s_date,s_time) values (?,?,?,?,?,?,?,curdate(),curtime())";   
					            PreparedStatement statement = conn.prepareStatement(sql);
					            statement.setString(1, document_type);
					            statement.setString(2, file_type);
					            			             
					            if (inputStream != null) {
					                // fetches input stream of the upload file for the blob column
					                statement.setBlob(3, inputStream);
					            }
					 
					            statement.setString(4,"Pending");
					            statement.setString(5, gid);
					            statement.setString(6, uid);
					            statement.setString(7, s_comment);
					            
					            // sends the statement to the database server
					            int row = statement.executeUpdate();
					            out.println(statement);
					            if (row>0) 
						            {
						                request.setAttribute("errorMessage4","itsSet");
                    
                        //out.println("Username and Password Incorrect");
			RequestDispatcher rd=request.getRequestDispatcher("upload.jsp");
                        
                        rd.forward(request, response);
						            }
						        else
							        {
						            	 request.setAttribute("errorMessage5","itsSet");
                    
                        //out.println("Username and Password Incorrect");
			RequestDispatcher rd=request.getRequestDispatcher("upload.jsp");
                        
                        rd.forward(request, response);
							        }		
							 
							 
				 		}
				
        } catch (SQLException ex) {
        	out.println("<br>Error "+ex);
            ex.printStackTrace();
        } finally {
			            if (conn != null) {
			                // closes the database connection
			                try {
			                    conn.close();
			                } catch (SQLException ex) {
			                	
			                	out.println("<br>Error "+ex);
			                	ex.printStackTrace();
			                }
			            }
	         	   }
		
	}

}
