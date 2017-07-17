/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uec;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

/**
 *
 * @author Vinnu
 */
public class Sub {

    private String sid;
    private String subname;
    private String subdesc;
    private String subtype;
    private List<String> questions;

    public List<String> getQuestions() {
        return questions;
    }

    public void setQuestions(List<String> questions) {
        this.questions = questions;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getSubdesc() {
        return subdesc;
    }

    public void setSubdesc(String subdesc) {
        this.subdesc = subdesc;
    }

    public String getSubname() {
        return subname;
    }

    public void setSubname(String subname) {
        this.subname = subname;
    }

    public String getSubtype() {
        return subtype;
    }

    public void setSubtype(String subtype) {
        this.subtype = subtype;
    }

    public boolean addSubject() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uec", "root", "admin");
            con.setAutoCommit(false);
            Statement st = con.createStatement();
            Statement s1 = con.createStatement();
            Statement s2 = con.createStatement();
            st.executeUpdate("insert into uec.subject (subname, subdesc, subtype) values ('" + subname + "', '" + subdesc + "', '" + subtype + "')");
            ResultSet rs = s2.executeQuery("select sid from uec.subject where subname='" + subname + "' and subdesc='" + subdesc + "' and subtype='" + subtype + "'");
            if (rs.next()) {
                System.out.println("Size : " + questions.size());
                for (int i = 0; i < questions.size(); ++i) {
//                    System.out.print("Question : " + questions.get(i));
                    s1.executeUpdate("insert into questions (sid, question) values (" + rs.getString(1) + ", '" + questions.get(i) + "')");
//                    System.out.println("   INSERTED");
                }
            }
            con.commit();
//            System.out.println("Everythng working well...!");
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean getSubById(String id) {
        try {
            Connection con = MyConnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from uec.subject where sid='" + id + "'");
            if (rs.next()) {
                setSid(rs.getString(1));
                setSubname(rs.getString(2));
                setSubdesc(rs.getString(3));
                setSubtype(rs.getString(4));
            }
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public static String getSubNameById(String id) {
        try {
            Connection con = MyConnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select subname from uec.subject where sid=" + id);
            if (rs.next()) {
                return rs.getString(1);
            }
            return null;
        } catch (Exception e) {
            return null;
        }
    }
}