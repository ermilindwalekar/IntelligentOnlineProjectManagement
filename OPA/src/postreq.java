/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class postreq extends HttpServlet {

    /**
	 * 
	 */
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
            out.println("<title>Servlet postreq</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet postreq at " + request.getContextPath() + "</h1>");
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
            throws ServletException, IOException 
    {
        	   response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         HttpSession session=request.getSession();
         String uid=(String) session.getAttribute("uid");
         
		String project_title=request.getParameter("title");
		
		if(uid==null)
		{
			response.sendRedirect("invalid.jsp");
		}		
		response.setHeader("cache-control", "no-cache");
		response.addHeader("cache-control", "no-store");
		response.addHeader("Cache-Control", "must-revalidate");
		response.setHeader("pragma", "no-cache");
		try {
                    
					Class.forName("com.mysql.jdbc.Driver");
					System.out.println("Driver loaded");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","root");
					
					PreparedStatement pst,pst1,pst2;
					pst=con.prepareStatement("select gid from login where userid=?");
					pst.setString(1, uid);
					
					ResultSet rs=pst.executeQuery();
					if(rs.next())
					{
						//group id is fetched from table "groups"
						String t_gid=rs.getString("gid");
						
						//session (GROUPID)is started here and given name gid and this session 'gid' can be retrieved at FileUploadDBServlet.java to upload files	
						request.getSession();
						session.setAttribute("gid", t_gid);
						
						// project_title problem
						/*
						 * pst2=con.prepareStatement("select project_title from group_projects");
						ResultSet rs1=pst2.executeQuery();
						if(rs1.next())
						{   }
							*/
							
						pst1=con.prepareStatement("insert into group_projects(gid,project_title) values(?,?)");
						
						pst1.setString(1,t_gid);
						pst1.setString(2,project_title);
						
						int r=pst1.executeUpdate();
							if(r!=0)
							{
								
		                        request.setAttribute("errorMessage","itsSet");
		                    
		                        //out.println("Username and Password Incorrect");
		                        RequestDispatcher rd=request.getRequestDispatcher("postrequest.jsp");
		                        
		                        rd.forward(request, response);
					
							}
							else
							{
								out.println("Error in  data insertion ");
								response.sendRedirect("postrequest.jsp");
							}
					}
						pst.close();
						con.close();
					}catch (Exception e) 
						{	
							request.setAttribute("errorMessage7","itsSet");
			                    
			               //out.println("Username and Password Incorrect");
							RequestDispatcher rd=request.getRequestDispatcher("postrequest.jsp");
			                rd.forward(request, response);
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

}
