/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uec;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
public class CourseData extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uec", "root", "admin");
            Statement st = con.createStatement();
            if (request.getParameter("cid") != null) {
                rs = st.executeQuery("select * from uec.course where courseid in ( select courseid from coll_course where collid=" + request.getParameter("cid") + ")");
            } else {
                rs = st.executeQuery("select * from uec.course");
            }
            String msg = "";
            while (rs.next()) {
                msg += rs.getString(1) + "|";
                msg += rs.getString(2) + "|";
                msg += rs.getString(5) + "|";
                msg += "viewCourse.jsp?courseid=" + rs.getString(1) + "&coname=" + rs.getString(2) + "&duration=" + rs.getString(5) + "\n";
            }
            pw.println(msg);
        } catch (Exception e) {
            pw.println("Error" + e);
        }
    }
}
