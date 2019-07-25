

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownloadRecords
 */
@WebServlet("/DownloadRecords")
public class DownloadRecords extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// size of byte buffer to send file
    private static final int BUFFER_SIZE = 4096;

	// database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/mysql";
    private String dbUser = "root";
    private String dbPass = "root";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		// get GroupId from URL's parameter
				String gid=request.getParameter("gid");
				
		// get i from URL's parameter
				String i=request.getParameter("i");
				
		// get academic year from URL's parameter
				String academic_year=request.getParameter("a_year");
				
				Connection conn = null; // connection to the database
	
				 try {
			            // connects to the database
			            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
			            
			            char f;
			            String filetype,file_type;
			            
						if(i.equals("1")){
							System.out.println("1");
							// queries the database
				            String sql = "select project_title,abstract,file_type from "+academic_year+" WHERE gid=?";        
				            PreparedStatement statement = conn.prepareStatement(sql);
				            statement.setString(1, gid);
				            ResultSet result = statement.executeQuery();						
				            if (result.next()) {
				                // gets file name and file blob data
				            	
				               Blob blob = result.getBlob("abstract");
				               byte[] bdata = blob.getBytes(1, (int)blob.length());
				                
				                InputStream inputStream = blob.getBinaryStream();
				                int fileLength = inputStream.available();
				                 
				                System.out.println("fileLength = " + fileLength);
				 
				                ServletContext context = getServletContext();
				 
				                // sets MIME type for the file download
				                String mimeType = context.getMimeType("abstract");
				                if (mimeType == null) {        
				                    mimeType = "application/octet-stream";
				                }              
				                 
				                // set content properties and header attributes for the response
				                response.setContentType(mimeType);
				                response.setContentLength(fileLength);
				                String headerKey = "Content-Disposition";
		
				                //-----------extension code---------------------------------------		       
				                
				                String project_title = result.getString("project_title");
				                f = result.getString("file_type").charAt(0);
				                filetype = Character.toString(f);
				                file_type = extension(filetype);
				               
				                //---------------------------------------------------------------
				                String headerValue = String.format("attachment; filename=\"%s\"", "abstract_"+project_title+"."+file_type);
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

						}
						if(i.equals("2")){
							System.out.println("2");
							
							// queries the database
				            String sql = "select project_title,SRS,file_type from "+academic_year+" WHERE gid=?";        
				            PreparedStatement statement = conn.prepareStatement(sql);
				            statement.setString(1, gid);
				            ResultSet result = statement.executeQuery();						
				            if (result.next()) {
				                // gets file name and file blob data
				            	
				               Blob blob = result.getBlob("SRS");
				               byte[] bdata = blob.getBytes(1, (int)blob.length());
				                
				                InputStream inputStream = blob.getBinaryStream();
				                int fileLength = inputStream.available();
				                 
				                System.out.println("fileLength = " + fileLength);
				 
				                ServletContext context = getServletContext();
				 
				                // sets MIME type for the file download
				                String mimeType = context.getMimeType("SRS");
				                if (mimeType == null) {        
				                    mimeType = "application/octet-stream";
				                }              
				                 
				                // set content properties and header attributes for the response
				                response.setContentType(mimeType);
				                response.setContentLength(fileLength);
				                String headerKey = "Content-Disposition";
		
				                //-----------extension code---------------------------------------		       
				                
				                String project_title = result.getString("project_title");
				                f = result.getString("file_type").charAt(1);
				                filetype = Character.toString(f);
				                file_type = extension(filetype);
				               
				                //---------------------------------------------------------------
				                String headerValue = String.format("attachment; filename=\"%s\"", "SRS_"+project_title+"."+file_type);
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
						}
						if(i.equals("3")){
							System.out.println("3");
							
							// queries the database
				            String sql = "select project_title,diagrams,file_type from "+academic_year+" WHERE gid=?";        
				            PreparedStatement statement = conn.prepareStatement(sql);
				            statement.setString(1, gid);
				            ResultSet result = statement.executeQuery();						
				            if (result.next()) {
				                // gets file name and file blob data
				            	
				               Blob blob = result.getBlob("diagrams");
				               byte[] bdata = blob.getBytes(1, (int)blob.length());
				                
				                InputStream inputStream = blob.getBinaryStream();
				                int fileLength = inputStream.available();
				                 
				                System.out.println("fileLength = " + fileLength);
				 
				                ServletContext context = getServletContext();
				 
				                // sets MIME type for the file download
				                String mimeType = context.getMimeType("diagrams");
				                if (mimeType == null) {        
				                    mimeType = "application/octet-stream";
				                }              
				                 
				                // set content properties and header attributes for the response
				                response.setContentType(mimeType);
				                response.setContentLength(fileLength);
				                String headerKey = "Content-Disposition";
		
				                //-----------extension code---------------------------------------		       
				                
				                String project_title = result.getString("project_title");
				                f = result.getString("file_type").charAt(2);
				                filetype = Character.toString(f);
				                file_type = extension(filetype);
				               
				                //---------------------------------------------------------------
				                String headerValue = String.format("attachment; filename=\"%s\"", "diagrams_"+project_title+"."+file_type);
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
		
							
						}
						if(i.equals("4")){
							System.out.println("4");
							
							// queries the database
				            String sql = "select project_title,report,file_type from "+academic_year+" WHERE gid=?";        
				            PreparedStatement statement = conn.prepareStatement(sql);
				            statement.setString(1, gid);
				            ResultSet result = statement.executeQuery();						
				            if (result.next()) {
				                // gets file name and file blob data
				            	
				               Blob blob = result.getBlob("report");
				               byte[] bdata = blob.getBytes(1, (int)blob.length());
				                
				                InputStream inputStream = blob.getBinaryStream();
				                int fileLength = inputStream.available();
				                 
				                System.out.println("fileLength = " + fileLength);
				 
				                ServletContext context = getServletContext();
				 
				                // sets MIME type for the file download
				                String mimeType = context.getMimeType("report");
				                if (mimeType == null) {        
				                    mimeType = "application/octet-stream";
				                }              
				                 
				                // set content properties and header attributes for the response
				                response.setContentType(mimeType);
				                response.setContentLength(fileLength);
				                String headerKey = "Content-Disposition";
		
				                //-----------extension code---------------------------------------		       
				                
				                String project_title = result.getString("project_title");
				                f = result.getString("file_type").charAt(3);
				                filetype = Character.toString(f);
				                file_type = extension(filetype);
				               
				                //---------------------------------------------------------------
				                String headerValue = String.format("attachment; filename=\"%s\"", "report_"+project_title+"."+file_type);
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
		
						}
						if(i.equals("5")){
							System.out.println("5");
							
							// queries the database
				            String sql = "select project_title,sourcecode,file_type from "+academic_year+" WHERE gid=?";        
				            PreparedStatement statement = conn.prepareStatement(sql);
				            statement.setString(1, gid);
				            ResultSet result = statement.executeQuery();						
				            if (result.next()) {
				                // gets file name and file blob data
				            	
				               Blob blob = result.getBlob("sourcecode");
				               byte[] bdata = blob.getBytes(1, (int)blob.length());
				                
				                InputStream inputStream = blob.getBinaryStream();
				                int fileLength = inputStream.available();
				                 
				                System.out.println("fileLength = " + fileLength);
				 
				                ServletContext context = getServletContext();
				 
				                // sets MIME type for the file download
				                String mimeType = context.getMimeType("sourcecode");
				                if (mimeType == null) {        
				                    mimeType = "application/octet-stream";
				                }              
				                 
				                // set content properties and header attributes for the response
				                response.setContentType(mimeType);
				                response.setContentLength(fileLength);
				                String headerKey = "Content-Disposition";
		
				                //-----------extension code---------------------------------------		       
				                
				                String project_title = result.getString("project_title");
				                f = result.getString("file_type").charAt(4);
				                filetype = Character.toString(f);
				                file_type = extension(filetype);
				               
				                //---------------------------------------------------------------
				                String headerValue = String.format("attachment; filename=\"%s\"", "sourcecode_"+project_title+"."+file_type);
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
		
						}
						
				 } catch (SQLException ex) {
			            ex.printStackTrace();
			            response.getWriter().print("SQL Error: " + ex.getMessage());
			        }  finally {
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

	private String extension(String filetype) {
		// TODO Auto-generated method stub
		if(filetype.equals("d")){
			 filetype="docx";
		}
		if(filetype.equals("j")){
			 filetype="jpg";
		}
		if(filetype.equals("t")){
			 filetype="txt";
		}
		if(filetype.equals("r")){
			 filetype="rar";
		}
		if(filetype.equals("p")){
			 filetype="pdf";
		}
		return filetype;
		
	}

}
