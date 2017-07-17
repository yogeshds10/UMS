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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vinnu
 */
public class GetQuestions extends HttpServlet {

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
            int x, y;
            int stusem = -1;
            int stucoll = -1;
            int stucourse = -1;
            int exasem = -1;
            int exacoll = -1;
            int exacourse = -1;
            int exasub = -1;
            String q1, q2;
            List<String> questions = new ArrayList<String>();
            out.println("Student Id : " + request.getParameter("stuid"));
            out.println("Examiner Uid : " + request.getParameter("euid"));
            out.println("Examiner Password : " + request.getParameter("epasswd"));
            Connection con = MyConnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select collid, courseid, sem from uec.stusem where stuid=" + request.getParameter("stuid"));
            if (rs.next()) {
                stucoll = rs.getInt(1);
                stucourse = rs.getInt(2);
                stusem = rs.getInt(3);
                rs.close();
            }
            if (stusem == -1 || stucourse == -1 || stucoll == -1) {
                response.sendRedirect("error.jsp?msg=Student Not found...!");
            }
            rs = st.executeQuery("SELECT epasswd, college, course,sem, sub FROM uec.examiner where euid='" + request.getParameter("euid") + "'");
            if (rs.next()) {
                if (rs.getString(1).equals(request.getParameter("epasswd"))) {
                    exacoll = rs.getInt(2);
                    exacourse = rs.getInt(3);
                    exasem = rs.getInt(4);
                    exasub = rs.getInt(5);
                    rs.close();
                } else {
                    response.sendRedirect("error.jsp?msg=Invalid Examiner Password!");
                }
            }
            if (exacoll == -1 || exacourse == -1 || exasem == -1 || exasub == -1) {
                response.sendRedirect("error.jsp?msg=Invalid Examiner..!");
            }
            if (stucoll == exacoll && stucourse == exacourse && stusem == exasem) {
                out.println("All Valid");
                rs = st.executeQuery("SELECT question FROM marks where sid=" + exasub + " and stuid=" + request.getParameter("stuid"));
                while (rs.next()) {
//                    out.println("<br/>" + rs.getString(1));
                    questions.add(rs.getString(1));
                }
                rs.close();
                if (questions.isEmpty()) {
                    rs = st.executeQuery("SELECT question FROM uec.questions where sid=" + exasub);
                    while (rs.next()) {
//                    out.println("<br/>" + rs.getString(1));
                        questions.add(rs.getString(1));
                    }
                    while (true) {
                        x = (int) (Math.random() * questions.size());
                        y = (int) (Math.random() * questions.size());
                        if (x != y) {
                            break;
                        }
                    }
                    st.executeUpdate("INSERT INTO uec.marks (stuid, sid, question) VALUES (" + request.getParameter("stuid") + ", " + exasub + ", '" + questions.get(x) + "')");
                    st.executeUpdate("INSERT INTO uec.marks (stuid, sid, question) VALUES (" + request.getParameter("stuid") + ", " + exasub + ", '" + questions.get(y) + "')");
                    out.println("<br/>Questions Generated for the first time");
                    q1 = questions.get(x);
                    q2 = questions.get(y);
                } else {
                    out.println("<br/>Questions Exists");
                    q1 = questions.get(0);
                    q2 = questions.get(1);
                }
                out.println("<br/>Question 1 : " + q1);
                out.println("<br/>Question 2 : " + q2);
                request.setAttribute("question1", q1);
                request.setAttribute("question2", q2);
                request.setAttribute("subject", exasub);
                RequestDispatcher rd = request.getRequestDispatcher("viewQuestions.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("error.jsp?msg=Examiner is unauthorized to conduct exam for this student!");
            }
        } catch (Exception e) {
            out.println("Error : " + e);
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
