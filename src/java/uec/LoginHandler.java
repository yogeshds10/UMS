package uec;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vinnu
 */
public class LoginHandler extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        if (request.getParameter("type").equals("1")) {
            //System.out.println("Administrator Login");
            if ((request.getParameter("uname").equalsIgnoreCase("admin")) && (request.getParameter("passwd").equals("admin"))) {
                HttpSession s=request.getSession(true);
                s.setAttribute("uid", "admin");
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("alogin.jsp");
            }
            
        } else if (request.getParameter("type").equalsIgnoreCase("2")) {
            //System.out.println("College Administrator Login");
            College c=new College();
            c.setCuname(request.getParameter("cuname"));
            c.setCpasswd(request.getParameter("cpasswd"));
            if (c.isValid()) {
                response.sendRedirect("cadmin.jsp");
                HttpSession s=request.getSession(true);
                s.setAttribute("uid", request.getParameter("cuname"));
            } else {
                response.sendRedirect("calogin.jsp");
            }
        }
    }
}