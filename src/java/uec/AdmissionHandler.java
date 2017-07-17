package uec;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vinnu
 */
public class AdmissionHandler extends HttpServlet {

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
        int x = abean.addApplication();
        if (x != -1) {
            abean.setAppid(x);
            //pw.println("Application Id : " + abean.getAppid());
            request.setAttribute("app", abean);
            RequestDispatcher rd = request.getRequestDispatcher("printappform.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("appFail.jsp");
        }
    }
}
