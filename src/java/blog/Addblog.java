/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package blog;


import java.io.IOException;
import java.io.PrintWriter;
 import java.sql.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import java.util.Enumeration;
/**
 *
 * @author gobu
 */
public class Addblog extends HttpServlet {

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
        PrintWriter out = response.getWriter();
//        String title=request.getParameter("title");
//        String pic=request.getParameter("bimg");
//        String un=request.getParameter("uname");
//        String dat=request.getParameter("bdate");
//        String fol=request.getParameter("fol");
//        String tag=request.getParameter("tag");
//        String msg=request.getParameter("message");
        String title="";
        String pic="";
        String un="";
        String dat="";
        String fol="";
        String tag="";
        String msg="";
        boolean c=false;
        String paramname = null;
        ServletContext context=getServletContext();
        String dest=context.getRealPath("");
        String dest1[]=dest.split("build");
        
        out.print(dest1[0]+"web/img/content/");

        MultipartRequest m = new MultipartRequest(request, dest1[0]+"web/img/content/");  
        Enumeration params = m.getParameterNames();
        while (params.hasMoreElements()) {
            paramname = (String) params.nextElement();
            if (paramname.equalsIgnoreCase("title")) {
                title = m.getParameter(paramname);
            }
            if (paramname.equalsIgnoreCase("uname")) {
                un = m.getParameter(paramname);
            }
            if (paramname.equalsIgnoreCase("bdate")) {
                dat = m.getParameter(paramname);
            }
            if (paramname.equalsIgnoreCase("fol")) {
                fol = m.getParameter(paramname);
            }
            if (paramname.equalsIgnoreCase("tag")) {
                tag = m.getParameter(paramname);
            }
            if (paramname.equalsIgnoreCase("message")) {
                msg = m.getParameter(paramname);
            }
        }
        Enumeration files = m.getFileNames();
        while (files.hasMoreElements()) {
            String pict = (String) files.nextElement();
            pic = m.getFilesystemName(pict);
            
        }
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/blog", "root", "admin");
            Statement st=con.createStatement();
            c=st.execute("insert into blog(title,bimage,username,bdate,categories,tag,message,bcomment,blike) values('"+title+"','"+pic+"','"+un+"','"+dat+"','"+fol+"','"+tag+"','"+msg+"','0','0')");
            
            if (c) {
                response.sendRedirect("addblog.jsp?ms=3");
            } else {
                response.sendRedirect("addblog.jsp?ms=2");
            }
            
        }catch(Exception e){
            e.printStackTrace();
        } finally {
            out.close();
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
        processRequest(request, response);
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
