/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uec;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vinnu
 */
public class ViewSubHandler extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw=response.getWriter();
            Sub s=new Sub();
            if(s.getSubById(request.getParameter("sid")))
            {
                request.setAttribute("subject", s);
                RequestDispatcher r=request.getRequestDispatcher("viewSub.jsp");
                r.forward(request, response);
            }
    }
}
