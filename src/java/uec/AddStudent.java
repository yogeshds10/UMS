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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vinnu
 */
public class AddStudent extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        pw.println("Admission Handler....!!!<br/>");
        HttpSession s = request.getSession(false);
        ApplicationBean abean = (ApplicationBean) s.getAttribute("applicationBean");
        abean.setConame(request.getParameter("coname"));
        pw.println("First Name : " + abean.getFname() + "<br/>");
        pw.println("Last Name : " + abean.getLname() + "<br/>");
        pw.println("Year : " + abean.getYear() + "<br/>");
        pw.println("Month : " + abean.getMnth() + "<br/>");
        pw.println("Date : " + abean.getDate() + "<br/>");
        pw.println("Date of Birth : " + abean.getYear() + "-" + abean.getMnth() + "-" + abean.getDate() + "<br/>");
        pw.println("Gender : " + abean.getGender() + "<br/>");
        pw.println("Medium : " + abean.getMedium() + "<br/>");
        pw.println("Nationality : " + abean.getNation() + "<br/>");
        pw.println("PUC College Name : " + abean.getPucollname() + "<br/>");
        pw.println("PUC Course Name : " + abean.getPucourse() + "<br/>");
        pw.println("PUC Percentage : " + abean.getPpercent() + "<br/>");
        pw.println("SSLC Percentage : " + abean.getSpercent() + "<br/>");
        pw.println("Address : " + abean.getAddress() + "<br/>");
        pw.println("Email : " + abean.getEmail() + "<br/>");
        pw.println("Phone : " + abean.getPhone() + "<br/>");
        pw.println("College Name : " + abean.getCollname() + "<br/>");
        pw.println("Course Name : " + abean.getConame() + "<br/>");
        try {
            Connection con = MyConnection.getConnection();
            con.setAutoCommit(false);
            Statement st = con.createStatement();
            st.executeUpdate("insert into student (name, lname, email, gender, phone, pcoll, ppercent, spercent, nationality, dob, medium, pucourse, address) "
                    + "values ('" + abean.getFname() + "', '" + abean.getLname() + "', '" + abean.getEmail() + "', '" + abean.getGender() + "', '" + abean.getPhone() + "', '"
                    + abean.getPucollname() + "', '" + abean.getPpercent() + "', '" + abean.getSpercent() + "', '" + abean.getNation() + "', '" + abean.getYear() + "-" + abean.getMnth() + "-" + abean.getDate() + "', '" + abean.getMedium() + "', '" + abean.getPucourse() + "', '" + abean.getAddress() + "')");
            ResultSet rs = st.executeQuery("select stuid from uec.student where name='" + abean.getFname() + "' and lname='" + abean.getLname() + "' "
                    + "and email='" + abean.getEmail() + "' and gender='" + abean.getGender() + "' and dob='" + abean.getYear() + "-" + abean.getMnth() + "-" + abean.getDate() + "' "
                    + "and ppercent='" + abean.getPpercent() + "' and spercent='" + abean.getSpercent() + "'");
            if (rs.next()) {
                st.executeUpdate("insert into stusem (stuid, collid, courseid, sem) values (" + rs.getString(1) + "," + abean.getCollname() + " ," + abean.getConame() + " ," + request.getParameter("sem") + " )");
            }
            con.commit();
            response.sendRedirect("cainsstu.jsp?msg=Student added!");
            pw.println("Student inserted Successfully.....!");
        } catch (Exception e) {
            pw.println("Error : " + e);
            response.sendRedirect("error.jsp?msg=Unable to insert student");
        }
    }
}