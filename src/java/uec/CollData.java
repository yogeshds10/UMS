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
public class CollData extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        try {
            Connection con = MyConnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from uec.college");
            String msg="";
            while (rs.next()) {
                msg+=rs.getString(1)+"|";
                msg+=rs.getString(2)+"|";
                msg+=rs.getString(3)+"|";
                msg+="viewColl.jsp?cid="+rs.getString(1)+"&cname="+rs.getString(2)+"&cadd="+rs.getString(3)+"\n";
            }
            pw.println(msg);
        } catch (Exception e) {
        }
    }
}
