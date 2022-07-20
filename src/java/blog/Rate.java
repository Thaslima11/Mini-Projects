package blog;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gobu
 */
public class Rate extends HttpServlet {

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
        HttpSession session = request.getSession();
        String bid = request.getParameter("bid");
        String uid = session.getAttribute("uid").toString();
        session.setAttribute("uid", uid);
        session.setAttribute("bid", bid);
        try {

            int s = 0;
            boolean s1 = false;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog", "root", "admin");
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();
            Statement st2 = con.createStatement();
            Statement st3 = con.createStatement();
            ResultSet rs1 = st3.executeQuery("select * from blike where uid='" + uid + "' and bid='" + bid + "'");
            if (rs1.next()) {
                
            }else{
                ResultSet rs = st.executeQuery("select * from blog where bid='" + bid + "'");
                while (rs.next()) {
                    int r = Integer.parseInt(rs.getString("blike"));
                    r += 1;
                    s = st1.executeUpdate("update blog set blike='" + r + "' where bid='" + bid + "'");
                    s1 = st2.execute("insert into blike(uid,bid) values('" + uid + "','" + bid + "')");
                }
            }

            if (s == 1 && s1) {
                response.sendRedirect("guest.jsp");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Already you liked');");
                out.println("location='guest.jsp';");
                out.println("</script>");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } 
        finally {
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
