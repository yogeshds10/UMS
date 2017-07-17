/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uec;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vinnu
 */
public class UpdateMarks extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            out.println("UPDATING MARKS");
            out.println(request.getParameter("stuid"));
            out.println(request.getParameter("subject"));
            out.println(request.getParameter("sid"));
            out.println(request.getParameter("q1"));
            out.println(request.getParameter("q2"));
            out.println(request.getParameter("marks1"));
            out.println(request.getParameter("marks2"));
            out.println(request.getParameter("euid"));
            out.println(request.getParameter("epasswd"));
            Connection con = MyConnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT epasswd, sub FROM uec.examiner where euid='" + request.getParameter("euid") + "'");
            if (rs.next()) {
                if (rs.getString(1).equals(request.getParameter("epasswd")) && (rs.getString(2).equals(request.getParameter("sid")))) {
                    rs.close();
                    st.executeUpdate("update uec.marks set marks=" + request.getParameter("marks1") + " "
                            + "where stuid=" + request.getParameter("stuid") + " and sid=" + request.getParameter("sid") + " and question='" + request.getParameter("q1") + "' and marks is null");
                    st.executeUpdate("update uec.marks set marks=" + request.getParameter("marks2") + " "
                            + "where stuid=" + request.getParameter("stuid") + " and sid=" + request.getParameter("sid") + " and question='" + request.getParameter("q2") + "' and marks is null");
                    response.sendRedirect("insdone.jsp?msg=Marks Updated Successfully");
                } else {
                    response.sendRedirect("error.jsp?msg=Invalid Examiner Password !");
                }
            } else {
                response.sendRedirect("error.jsp?msg=Invalid Examiner !");
            }
        } catch (Exception e) {
            response.sendRedirect("error.jsp?msg=Unknow Error ! ");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
