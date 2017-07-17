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
public class ProcessApplication extends HttpServlet {

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
            Connection con = MyConnection.getConnection();
            Statement st = con.createStatement();
            con.setAutoCommit(false);
            st.executeUpdate("update uec.application set status = '" + request.getParameter("type") + "' where appid =" + request.getParameter("appid"));
            if (request.getParameter("type").equals("Admitted")) {
                ApplicationBean ab = ApplicationBean.getApplicationById(request.getParameter("appid"));
                st.executeUpdate("insert into student (name, lname, email, gender, phone, pcoll, ppercent, spercent, nationality, dob, medium, pucourse, address) "
                        + "values ('" + ab.getFname() + "', '" + ab.getLname() + "', '" + ab.getEmail() + "', '" + ab.getGender() + "', '" + ab.getPhone() + "', '"
                        + ab.getPucollname() + "', '" + ab.getPpercent() + "', '" + ab.getSpercent() + "', '" + ab.getNation() + "', '" + ab.getYear() + "-" + ab.getMnth() + "-" + ab.getDate() + "', '" + ab.getMedium() + "', '" + ab.getPucourse() + "', '" + ab.getAddress() + "')");
                ResultSet rs = st.executeQuery("select stuid from uec.student where name='" + ab.getFname() + "' and lname='" + ab.getLname() + "' "
                        + "and email='" + ab.getEmail() + "' and gender='" + ab.getGender() + "' and dob='" + ab.getYear() + "-" + ab.getMnth() + "-" + ab.getDate() + "' "
                        + "and ppercent='" + ab.getPpercent() + "' and spercent='" + ab.getSpercent() + "'");
                if (rs.next()) {
                    st.executeUpdate("insert into stusem (stuid, collid, courseid, sem) values ("+rs.getString(1) +","+ab.getCollname()+" ,"+ab.getConame()+" ,1 )");
                }
            }
            con.commit();
            response.sendRedirect("insdone.jsp?msg=Application Status Updated Successfully!");
        } catch (Exception e) {
            out.println("Error : " + e);
            response.sendRedirect("error.jsp?msg=Unable to Update Application Status!");
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
