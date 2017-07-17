/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uec;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vinnu
 */
public class DetailedInsert extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        if (request.getParameter("type").equals("1")) {
            pw.println("College COurse");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uec", "root", "admin");
                con.setAutoCommit(false);
                Statement st = con.createStatement();
                for (int i = 0; i < Integer.parseInt(request.getParameter("nocourse")); ++i) {
                    st.executeUpdate("insert into coll_course (collid, courseid) values (" + request.getParameter("coname") + "," + request.getParameter("course" + i) + " )");
                }
                con.commit();
                response.sendRedirect("insdone.jsp");
            } catch (Exception e) {
                pw.println("Error : " + e);
            }
        } else {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uec", "root", "admin");
                con.setAutoCommit(false);
                Statement st = con.createStatement();
                for (int i = 0; i < Integer.parseInt(request.getParameter("nosub")); ++i) {
                    st.executeUpdate("insert into semester (semnumber, sid, courseid) values ("
                            + request.getParameter("sem") + "," + request.getParameter("sub" + i) + " ,"
                            + request.getParameter("coname") + " )");
                }
                con.commit();
                response.sendRedirect("insdone.jsp");
            } catch (Exception e) {
                pw.println("Error : " + e);
            }
        }
    }
}
