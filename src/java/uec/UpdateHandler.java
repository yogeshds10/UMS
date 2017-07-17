/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uec;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vinnu
 */
public class UpdateHandler extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("type").equals("1")) {
            College c = College.getCollById(request.getParameter("cid"));
            if (c!=null) {
                request.setAttribute("coll", c);
                RequestDispatcher r = request.getRequestDispatcher("aupdcoll.jsp");
                r.forward(request, response);
            }
        }
    }
}
