/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package blog;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gobu
 */
public class Comment extends HttpServlet {

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
        Date date = new Date();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String bid = session.getAttribute("bid").toString();
        String uid = session.getAttribute("uid").toString();
        
        session.setAttribute("uid", uid);
        session.setAttribute("bid", bid);
   
        
        String msg = request.getParameter("comm");
        String reply = session.getAttribute("reply").toString();
//        out.printf("%s %tB %<te, %<tY", "Due date:", date);
        String d = String.format("%s %tB %<te, %<tY", "Due date:", date);
//        out.print(d);
        String[] d1 = d.split(": ");
//        out.print(d1[1]);
        boolean c = false;
        int s = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog", "root", "admin");
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();
            Statement st2 = con.createStatement();
            ResultSet rs = st.executeQuery("select * from blog where bid='" + bid + "'");
            while (rs.next()) {
                int r = Integer.parseInt(rs.getString("bcomment"));
                r += 1;
                s = st1.executeUpdate("update blog set bcomment='" + r + "' where bid='" + bid + "'");
                c = st2.execute("insert into comment(bid,uid,cdate,message,reply) values('" + bid + "','" + uid + "','" + d1[1] + "','" + msg + "','" + reply + "')");
            }
            if (uid.equals("0")) {
                response.sendRedirect("blog.jsp");
                
            } else {
                response.sendRedirect("blog1.jsp");
            }

        } catch (Exception e) {
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
