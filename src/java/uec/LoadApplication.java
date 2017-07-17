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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vinnu
 */
public class LoadApplication extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            ApplicationBean a = ApplicationBean.getApplicationById(request.getParameter("appid"));
            HttpSession s = request.getSession(false);
//            out.println("College Admin User Name : " + s.getAttribute("uid").toString());
            if (a != null) {
                College c = College.getCollById(a.getCollname());
                if (c != null) {
                    if (c.isValidByName(s.getAttribute("uid").toString())) {
                        request.setAttribute("appBean", a);
                        RequestDispatcher rd = request.getRequestDispatcher("caviewapp.jsp");
                        rd.forward(request, response);
                    } else {
//                        out.println("Application doesn't belongs to your college...!");
                        response.sendRedirect("error.jsp?msg=Application doesn't belongs to your college...!");
                    }
                } else {
//                    out.println("Unable to determine to which college the application belongs....");
                    response.sendRedirect("error.jsp?msg=Unable to determine to which college the application belongs....");
                }

            } else {
//                out.println("Sorry Invalid Application Number, Try Again ");
                response.sendRedirect("error.jsp?msg=Sorry Invalid Application Number, Try Again");
            }
        } catch (Exception e) {
            out.println("Error :" + e);
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
