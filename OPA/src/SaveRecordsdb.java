

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import  java.sql.*;
/**
 * Servlet implementation class SaveRecordsdb
 */
@WebServlet("/SaveRecordsdb")
public class SaveRecordsdb extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 static int size=0;
	 static String a_year=null;
	 	// database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/mysql";
    private String dbUser = "root";
    private String dbPass = "root";
	
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String gidQ="SELECT pd.gid,gp.project_title FROM project_details pd,group_projects gp WHERE pd.gid=gp.gid GROUP BY pd.gid,STATUS HAVING COUNT(pd.STATUS) = 5 and status='approved'";
        String check_gid="SELECT COUNT(gid) AS gid_count FROM group_projects";
        String year="SELECT DISTINCT academic_year FROM detail WHERE userid IN(SELECT userid FROM project_details WHERE gid IN(SELECT gid FROM project_details GROUP BY gid,STATUS HAVING COUNT(STATUS) = 5 and status='approved'))";
    	
    	resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        PreparedStatement pst,pst1,pst2,pst3,pst4,pst5,pst6;
   	 
        ResultSet rs = null,rs1=null,rs2=null,rs4=null,rs5=null,rs6=null;
        Connection con;
        try
         {
        	 Class.forName("com.mysql.jdbc.Driver");
        	 con = DriverManager.getConnection(dbURL,dbUser,dbPass);
        	 
        	 String querySetLimit = "SET GLOBAL max_allowed_packet=198205600;";	// 10 MB
    		 Statement stSetLimit = con.createStatement();
    		 stSetLimit.execute(querySetLimit);
    			
        	 pst=con.prepareStatement(gidQ);
        	 pst1=con.prepareStatement(check_gid);
        	 pst2=con.prepareStatement(year);
        	 
        	 rs=pst.executeQuery();
        	
        	 while(rs.next()){
        		size++;
        	 }
        	 
        	 rs1=pst1.executeQuery();
			
        	 rs1.next();
        	 if(rs1.getInt(1)==size)
        	 {				//checks for completed group records
        		 rs2=pst2.executeQuery();
        		
        		 while(rs2.next())
        		 {
        			 a_year=rs2.getString("academic_year");   	//Gives Academic year
        			 System.out.println(a_year+"Gives right academic year Distinct");
        		 
        		 //Fetching Table Name that exist or not
        		 pst5=con.prepareStatement("SELECT table_name FROM information_schema.TABLES WHERE table_Type='base table' AND table_schema='mysql'");
        		 rs5=pst5.executeQuery();
        		 rs5.next();
        		  System.out.println(a_year+"xxxxxaaaaa");
        			 String yeardb=rs5.getString(1);
        			 if(yeardb.equals(a_year))
        			 {
        				 
        				 pst6=con.prepareStatement("SELECT pd.gid,gp.project_title FROM project_details pd,group_projects gp,detail d WHERE pd.userid=d.userid AND pd.gid=gp.gid AND academic_year=? GROUP BY pd.gid,STATUS HAVING COUNT(pd.STATUS) = 5 AND STATUS='approved'");
        				 pst6.setString(1,a_year);
        				 rs6=pst6.executeQuery();
                     	 while(rs6.next())
                     	 {
                     		 String newgid=rs6.getString("gid");
                     		 String project_title=rs6.getString("project_title");
                     		 char ftype='\0';
                     	     String filetype="";
                     		 
                     		 for(int i=1;i<=5;i++)
                             { 	
                               // queries the database
                               pst4 = con.prepareStatement("SELECT pd.gid,pd.file_upload,pd.file_type FROM project_details pd,detail d WHERE pd.userid=d.userid and gid=? AND STATUS='approved' AND document_typeId=? and academic_year=?");														
                               pst4.setString(1,newgid);
                               pst4.setInt(2,i);
                               pst4.setString(3,a_year);
                               rs4 = pst4.executeQuery();						
                               
                               //---------------------------------
                               rs4.next();
                               ftype=rs4.getString("file_type").charAt(0);
                               filetype+=Character.toString(ftype);
                               
                               System.out.println(filetype);
                               
                               rs4.beforeFirst();
                               
                               //----------------------------------
                   		       
                               if(i==1){
                   		            		
                   		            	if (rs4.next()) 
                   		                {
                   		                    // gets file name and file blob data
                   		                   String gid=rs4.getString("gid");
                   		                   Blob blob = rs4.getBlob("file_upload");
                   		               
                   		               //***************************************************************************//
                   		                   String sql1 = "insert into " +a_year+ " (gid,project_title,abstract) values (?,?,?)";   
                   		                   
                   		                   PreparedStatement statement1 = con.prepareStatement(sql1);
                   		                   
                   		                statement1.setString(1, gid);
                   		                statement1.setString(2, project_title);
                   		                statement1.setBlob(3, blob);
                   		             
                   		                   int row = statement1.executeUpdate();
                   		                   
                   		       			//out.println(statement1);
                   		                   
                   		                   if (row>0) 
                   		                   {
                   		                   	out.println("Data 1 saved successfully for future use");
                   		                   }
                   		                   else
                   		                   {
                   		                   	out.println("Data 1 not saved");
                   		                   }
                   		                      
                   		                } else {
                   		                    // no file found
                   		                    resp.getWriter().print("File not found");  
                   		                }
                   		            
                   		            }
                   		            if(i==2){
                   		            
                   		            	if (rs4.next()) 
                   		                {
                   		                    // gets file name and file blob data
                   		                   String gid=rs4.getString("gid");
                   		                   Blob blob = rs4.getBlob("file_upload");
                   		               
                   		               //***************************************************************************//
                   		                   String sql1 = "update " +a_year+ " set SRS=? where gid=?";   
                   		                   PreparedStatement statement1 = con.prepareStatement(sql1);
                   		                   
                   		                   statement1.setBlob(1, blob);
                   		                   statement1.setString(2, gid);
                   		                   int row = statement1.executeUpdate();
                   		                   
                   		       			//out.println(statement1);
                   		                   
                   		                   if (row>0) 
                   		                   {
                   		                   	out.println("Data 2 saved successfully for future use");
                   		                   }
                   		                   else
                   		                   {
                   		                   	out.println("Data 2 not saved");
                   		                   }
                   		                      
                   		                } else {
                   		                    // no file found
                   		                    resp.getWriter().print("File not found");  
                   		                }
                   		            
                   		            }
                   		            if(i==3){
                   		            	
                   		            	if (rs4.next()) 
                   		                {
                   		                    // gets file name and file blob data
                   		                   String gid=rs4.getString("gid");
                   		                   Blob blob = rs4.getBlob("file_upload");
                   		               
                   		               //***************************************************************************//
                   		                   String sql1 = "update " +a_year+ " set diagrams=? where gid=?";   
                   		                   PreparedStatement statement1 = con.prepareStatement(sql1);
                   		                   
                   		                   statement1.setBlob(1, blob);
                   		                   statement1.setString(2, gid);
                   		                   int row = statement1.executeUpdate();
                   		                   
                   		       			//out.println(statement1);
                   		                   
                   		                   if (row>0) 
                   		                   {
                   		                   	out.println("Data 3 saved successfully for future use");
                   		                   }
                   		                   else
                   		                   {
                   		                   	out.println("Data 3 not saved");
                   		                   }
                   		                      
                   		                } else {
                   		                    // no file found
                   		                    resp.getWriter().print("File not found");  
                   		                }
                   		            	
                   		            }
                   		         if(i==4){
                    		            
                		            	if (rs4.next()) 
                		                {
                		                    // gets file name and file blob data
                		                   String gid=rs4.getString("gid");
                		                   Blob blob = rs4.getBlob("file_upload");
                		               
                		               //***************************************************************************//
                		                   String sql1 = "update " +a_year+ " set report=? where gid=?";   
                		                   PreparedStatement statement1 = con.prepareStatement(sql1);
                		                   
                		                   statement1.setBlob(1, blob);
                		                   statement1.setString(2, gid);
                		                   int row = statement1.executeUpdate();
                		                   
                		       			//out.println(statement1);
                		                   
                		                   if (row>0) 
                		                   {
                		                   	out.println("Data 4 saved successfully for future use");
                		                   }
                		                   else
                		                   {
                		                   	out.println("Data 4 not saved");
                		                   }
                		                      
                		                } else {
                		                    // no file found
                		                    resp.getWriter().print("File not found");  
                		                }
                		            
                		            }
                   		      if(i==5){
                 		            
             		            	if (rs4.next()) 
             		                {
             		                    // gets file name and file blob data
             		                   String gid=rs4.getString("gid");
             		                   Blob blob = rs4.getBlob("file_upload");
             		               
             		               //***************************************************************************//
             		                   String sql1 = "update " +a_year+ " set sourcecode=?,file_type=? where gid=?";   
             		                   PreparedStatement statement1 = con.prepareStatement(sql1);
             		                   
             		                   statement1.setBlob(1, blob);
             		                   statement1.setString(2, filetype);
             		                   statement1.setString(3, gid);
             		                   int row = statement1.executeUpdate();
             		                   
             		       			//out.println(statement1);
             		                   
             		                   if (row>0) 
             		                   {
             		                   	out.println("Data 5 saved successfully for future use");
             		                   }
             		                   else
             		                   {
             		                   	out.println("Data 5 not saved");
             		                   }
             		                      
             		                } else {
             		                    // no file found
             		                    resp.getWriter().print("File not found");  
             		                }
             		            
             		            }
             		            
                              }
                     	 }
                    
                		 
                     	 resp.sendRedirect("admin.jsp");	 
        			 }
        			 else
        			 {
        				 System.out.println(a_year+"Hiiiii");
        				 pst3=con.prepareStatement("create table "+a_year+" (gid varchar(30), project_title varchar(30), abstract mediumblob, SRS mediumblob, diagrams mediumblob, report mediumblob, sourcecode mediumblob, file_type varchar(6), primary key(gid))");
                		 pst3.executeUpdate();
                		 
                		 System.out.println("Repository Created");
                	
                		 pst6=con.prepareStatement("SELECT pd.gid,gp.project_title FROM project_details pd,group_projects gp,detail d WHERE pd.userid=d.userid AND pd.gid=gp.gid AND academic_year=? GROUP BY pd.gid,STATUS HAVING COUNT(pd.STATUS) = 5 AND STATUS='approved'");
        				 pst6.setString(1,a_year);
        				 rs6=pst6.executeQuery();
                     	 while(rs6.next())
                     	 {
                     		 String newgid=rs6.getString("gid");
                     		 String project_title=rs6.getString("project_title");
                     		 char ftype='\0';
                    	     String filetype="";
                    		 
                     		 for(int i=1;i<=5;i++)
                             { 	
                               // queries the database
                               pst4 = con.prepareStatement("SELECT pd.gid,pd.file_upload,pd.file_type FROM project_details pd,detail d WHERE pd.userid=d.userid and gid=? AND STATUS='approved' AND document_typeId=? and academic_year=?");														
                               pst4.setString(1,newgid);
                               pst4.setInt(2,i);
                               pst4.setString(3,a_year);
                               rs4 = pst4.executeQuery();						
                             
                               //---------------------------------
                               rs4.next();
                               ftype=rs4.getString("file_type").charAt(0);
                               filetype+=Character.toString(ftype);
                               System.out.println(filetype);
                               rs4.beforeFirst();
                               //----------------------------------
                   		      
                   		            if(i==1){
                   		            		
                   		            	if (rs4.next()) 
                   		                {
                   		                    // gets file name and file blob data
                   		                   String gid=rs4.getString("gid");
                   		                   Blob blob = rs4.getBlob("file_upload");
                   		               
                   		               //***************************************************************************//
                   		                   String sql1 = "insert into " +a_year+ " (gid,project_title,abstract) values (?,?,?)";   
                   		                   PreparedStatement statement1 = con.prepareStatement(sql1);
                   		                   
                   		                statement1.setString(1, gid);
                   		                statement1.setString(2, project_title);
                   		                statement1.setBlob(3, blob);
                   		                   int row = statement1.executeUpdate();
                   		                   
                   		       			//out.println(statement1);
                   		                   
                   		                   if (row>0) 
                   		                   {
                   		                   	out.println("Data 1 saved successfully for future use");
                   		                   }
                   		                   else
                   		                   {
                   		                   	out.println("Data 1 not saved");
                   		                   }
                   		                      
                   		                } else {
                   		                    // no file found
                   		                    resp.getWriter().print("File not found");  
                   		                }
                   		            
                   		            }
                   		            if(i==2){
                   		            
                   		            	if (rs4.next()) 
                   		                {
                   		                    // gets file name and file blob data
                   		                   String gid=rs4.getString("gid");
                   		                   Blob blob = rs4.getBlob("file_upload");
                   		               
                   		               //***************************************************************************//
                   		                   String sql1 = "update " +a_year+ " set SRS=? where gid=?";   
                   		                   PreparedStatement statement1 = con.prepareStatement(sql1);
                   		                   
                   		                   statement1.setBlob(1, blob);
                   		                   statement1.setString(2, gid);
                   		                   int row = statement1.executeUpdate();
                   		                   
                   		       			//out.println(statement1);
                   		                   
                   		                   if (row>0) 
                   		                   {
                   		                   	out.println("Data 2 saved successfully for future use");
                   		                   }
                   		                   else
                   		                   {
                   		                   	out.println("Data 2 not saved");
                   		                   }
                   		                      
                   		                } else {
                   		                    // no file found
                   		                    resp.getWriter().print("File not found");  
                   		                }
                   		            
                   		            }
                   		            if(i==3){
                   		            	
                   		            	if (rs4.next()) 
                   		                {
                   		                    // gets file name and file blob data
                   		                   String gid=rs4.getString("gid");
                   		                   Blob blob = rs4.getBlob("file_upload");
                   		               
                   		               //***************************************************************************//
                   		                   String sql1 = "update " +a_year+ " set diagrams=? where gid=?";   
                   		                   PreparedStatement statement1 = con.prepareStatement(sql1);
                   		                   
                   		                   statement1.setBlob(1, blob);
                   		                   statement1.setString(2, gid);
                   		                   int row = statement1.executeUpdate();
                   		                   
                   		       			//out.println(statement1);
                   		                   
                   		                   if (row>0) 
                   		                   {
                   		                   	out.println("Data 3 saved successfully for future use");
                   		                   }
                   		                   else
                   		                   {
                   		                   	out.println("Data 3 not saved");
                   		                   }
                   		                      
                   		                } else {
                   		                    // no file found
                   		                    resp.getWriter().print("File not found");  
                   		                }
                   		            	
                   		            }
                   		         if(i==4){
                    		            
                		            	if (rs4.next()) 
                		                {
                		                    // gets file name and file blob data
                		                   String gid=rs4.getString("gid");
                		                   Blob blob = rs4.getBlob("file_upload");
                		               
                		               //***************************************************************************//
                		                   String sql1 = "update " +a_year+ " set report=? where gid=?";   
                		                   PreparedStatement statement1 = con.prepareStatement(sql1);
                		                   
                		                   statement1.setBlob(1, blob);
                		                   statement1.setString(2, gid);
                		                   int row = statement1.executeUpdate();
                		                   
                		       			//out.println(statement1);
                		                   
                		                   if (row>0) 
                		                   {
                		                   	out.println("Data 4 saved successfully for future use");
                		                   }
                		                   else
                		                   {
                		                   	out.println("Data 4 not saved");
                		                   }
                		                      
                		                } else {
                		                    // no file found
                		                    resp.getWriter().print("File not found");  
                		                }
                		            
                		            }
                   		      if(i==5){
                 		            
             		            	if (rs4.next()) 
             		                {
             		                    // gets file name and file blob data
             		                   String gid=rs4.getString("gid");
             		                   Blob blob = rs4.getBlob("file_upload");
             		               
             		               //***************************************************************************//
             		                   String sql1 = "update " +a_year+ " set sourcecode=?,file_type=? where gid=?";   
             		                   PreparedStatement statement1 = con.prepareStatement(sql1);
             		                   
             		                   statement1.setBlob(1, blob);
             		                   statement1.setString(2, filetype);
             		                   statement1.setString(3, gid);
             		                   int row = statement1.executeUpdate();
             		                   
             		       			//out.println(statement1);
             		                   
             		                   if (row>0) 
             		                   {
             		                   	out.println("Data 5 saved successfully for future use");
             		                   }
             		                   else
             		                   {
             		                   	out.println("Data 5 not saved");
             		                   }
             		                      
             		                } else {
             		                    // no file found
             		                    resp.getWriter().print("File not found");  
             		                }
             		            
             		            }
             		            
                              }
                     	 }
                    
                     	req.setAttribute("errorMsg1","itsSet");
               		 RequestDispatcher rd=req.getRequestDispatcher("admin_home.jsp");
                        rd.forward(req, resp);
       	

                     	 	//resp.sendRedirect("admin_instruction.jsp");	 
                	 }
                	
        		
        	}		 
        	}
        		 
        	else
        	 {
        		// System.out.println("Not all groups have submitted all files");
        		 req.setAttribute("errorMsg2","itsSet");
        		 RequestDispatcher rd=req.getRequestDispatcher("save_records.jsp");
                 rd.forward(req, resp);
	
        	 }
        	 
        	 
        	 //AFTER SAVING ALL THE FILES WE WILL DELETE ALL THE STUDENT RECORD FROM TEMPORARY TABLE FOR 
        	 //WHICH CODE WILL BE WRITTEN HERE
        	 //taki jab bhi admin saveRecord khole toh "No Record" msg dikhe kyoki woh data ab permanant table me save ho chuka he aur ab temporary table me naya record aayega
        	 
        	 con.close();
        	         
         }catch (SQLException ex) {
            ex.printStackTrace();
            resp.getWriter().print("SQL Error: " + ex.getMessage());
        } catch (IOException ex) {
            ex.printStackTrace();
            resp.getWriter().print("IO Error: " + ex.getMessage());
        }
        catch(Exception e){
        	out.println(e.toString());
        }
        
        out.close();
      
    }
}