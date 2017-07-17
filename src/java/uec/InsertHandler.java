/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uec;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vinnu
 */
public class InsertHandler extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter pw = response.getWriter();
        if (request.getParameter("type").equals("1")) {
            College c = new College();
            c.setCollname(request.getParameter("collname"));
            c.setColladd(request.getParameter("colladd"));
            c.setCuname(request.getParameter("cuname"));
            c.setCpasswd(request.getParameter("cpasswd"));
            if (c.addColl()) {
                response.sendRedirect("insdone.jsp");
            } else {
                response.sendRedirect("ainsert.jsp");
            }
        } else if (request.getParameter("type").equals("2")) {
            Course co = new Course();
            co.setConame(request.getParameter("coname"));
            co.setCosname(request.getParameter("cosname"));
            co.setCodesc(request.getParameter("codesc"));
            co.setDuration(request.getParameter("duration"));
            if (co.addCourse()) {
                response.sendRedirect("insdone.jsp");
            } else {
                response.sendRedirect("ainsert.jsp");                
            }
        } else if (request.getParameter("type").equals("3")) {
            Sub s = new Sub();
            s.setSubname(request.getParameter("subname"));
            s.setSubdesc(request.getParameter("subdesc"));
            s.setSubtype(request.getParameter("subtype"));
            List<String> questions = new ArrayList<String>();
            for (int i = 1; i <= Integer.parseInt(request.getParameter("noque")); ++i) {
                if (!request.getParameter("question" + i).equals("")) {
                    questions.add(request.getParameter("question" + i));
//                    pw.println("Question : " + questions.get(i - 1) + "<br/>");
                }
            }
            s.setQuestions(questions);
            if (s.addSubject()) {
                response.sendRedirect("insdone.jsp");
            } else {
                response.sendRedirect("ainsert.jsp");
            }
        } else if (request.getParameter("type").equals("4")) {
            pw.println("TYPE _ 4");
            pw.println("Examiner UID : " + request.getParameter("euid"));
            pw.println("Examiner Password : " + request.getParameter("epasswd"));
            pw.println("College : " + College.getCollNameById(Integer.parseInt(request.getParameter("coll"))));
            pw.println("Course : " + Course.getCourseNameById(Integer.parseInt(request.getParameter("course"))));
            pw.println("Semester : " + request.getParameter("sem"));
            pw.println("Subject : " + request.getParameter("sub"));
            try {
                Connection con = MyConnection.getConnection();
                Statement st = con.createStatement();
                st.executeUpdate("INSERT INTO uec.examiner (euid, epasswd, college, course, sem, sub) "
                        + "VALUES ('" + request.getParameter("euid") + "', '"
                        + request.getParameter("epasswd") + "', " + request.getParameter("coll") + ", "
                        + request.getParameter("course") + ", " + request.getParameter("sem") + ", "
                        + request.getParameter("sub") + ")");
                response.sendRedirect("insdone.jsp");
            } catch (Exception e) {
                pw.println("Error : " + e);
                response.sendRedirect("error.jsp?msg=Examiner already exist for the subject or Trying to assign same examiner for more than one subject in the same semester!");
            }
        }
    }
}
