/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uec;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Vinnu
 */
public class Course {

    private String coname;
    private String cosname;
    private String codesc;
    private String duration;

    public String getCodesc() {
        return codesc;
    }

    public void setCodesc(String codesc) {
        this.codesc = codesc;
    }

    public String getConame() {
        return coname;
    }

    public void setConame(String coname) {
        this.coname = coname;
    }

    public String getCosname() {
        return cosname;
    }

    public void setCosname(String cosname) {
        this.cosname = cosname;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public boolean addCourse() {

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uec", "root", "admin");
            Statement st = con.createStatement();
            st.executeUpdate("insert into course (coname, codesc, cosname, duration) values ('" + coname + "', '" + codesc + "', '" + cosname + "'," + duration + " )");
        } catch (Exception e) {           
            return false;          
        }
        return true;
    }

    public static String getCourseNameById(int id) {
        try {
            Connection con = MyConnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select coname from uec.course where courseid=" + id);
            if (rs.next()) {
                return rs.getString(1);
            } else {
                return "NOTFOUND";
            }
        } catch (Exception e) {
            return "NOTFOUND";
        }
    }
}
