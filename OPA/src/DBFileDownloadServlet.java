

import java.io.*;
import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DBFileDownloadServlet
 */
@WebServlet("/downloadFileServlet")
public class DBFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// size of byte buffer to send file
    private static final int BUFFER_SIZE = 4096;

	// database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/mysql";
    private String dbUser = "root";
    private String dbPass = "root";

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// get GroupId from URL's parameter
		String gid=request.getParameter("gid");
		
		Connection conn = null; // connection to the database
        
	        try {
	            // connects to the database
	            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
	            
	            // queries the database
	            String sql = "select document_type,file_type,file_upload from project_details WHERE gid = ? AND status='Pending'";
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setString(1, gid);
	            																			
	            ResultSet result = statement.executeQuery();						
	            if (result.next()) {
	                // gets file name and file blob data
	            	
	                String fileName = result.getString("document_type");
	                String file_type=result.getString("file_type");
					
	                Blob blob = result.getBlob("file_upload");
	                
	                InputStream inputStream = blob.getBinaryStream();
	                int fileLength = inputStream.available();
	                 
	                System.out.println("fileLength = " + fileLength);
	 
	                ServletContext context = getServletContext();
	 
	                // sets MIME type for the file download
	                String mimeType = context.getMimeType(fileName);
	                if (mimeType == null) {        
	                    mimeType = "application/octet-stream";
	                }              
	                 
	                // set content properties and header attributes for the response
	                response.setContentType(mimeType);
	                response.setContentLength(fileLength);
	                String headerKey = "Content-Disposition";
	                
		             	String headerValue = String.format("attachment; filename=\"%s\"", fileName+"."+file_type);
	 	               	response.setHeader(headerKey, headerValue);
		       
 	               	// writes the file to the client
	                OutputStream outStream = response.getOutputStream();
	                 
	                byte[] buffer = new byte[BUFFER_SIZE];
	                int bytesRead = -1;
	                 
	                while ((bytesRead = inputStream.read(buffer)) != -1) {
	                    outStream.write(buffer, 0, bytesRead);
	                }
	                 
	                inputStream.close();
	                outStream.close();             
	            } else {
	                // no file found
	                response.getWriter().print("File not found for the gid: " + gid);  
	            }
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	            response.getWriter().print("SQL Error: " + ex.getMessage());
	        } catch (IOException ex) {
	            ex.printStackTrace();
	            response.getWriter().print("IO Error: " + ex.getMessage());
	        } finally {
	            if (conn != null) {
	                // closes the database connection
	                try {
	                    conn.close();
	                } catch (SQLException ex) {
	                    ex.printStackTrace();
	                }
	            }          
	        }

		
	
	}

}
