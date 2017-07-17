/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uec;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Vinnu
 */
public class College {

    private String collid;
    private String collname;
    private String colladd;
    private String cuname;
    private String cpasswd;

    public String getCpasswd() {
        return cpasswd;
    }

    public void setCpasswd(String cpasswd) {
        this.cpasswd = cpasswd;
    }

    public String getCuname() {
        return cuname;
    }

    public void setCuname(String cuname) {
        this.cuname = cuname;
    }

    public String getColladd() {
        return colladd;
    }

    public void setColladd(String colladd) {
        this.colladd = colladd;
    }

    public String getCollid() {
        return collid;
    }

    public void setCollid(String collid) {
        this.collid = collid;
    }

    public String getCollname() {
        return collname;
    }

    public void setCollname(String collname) {
        this.collname = collname;
    }

    public boolean addColl() {
        Connection con = null;
        Statement st = null;
        try {
            con = MyConnection.getConnection();
            st = con.createStatement();
            st.executeUpdate("insert into college (collname, colladd, cuname, cpasswd) "
                    + "values ('" + collname + "', '" + colladd + "', '" + cuname + "','" + cpasswd + "')");
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public boolean isValidByName(String uid) {
        if (uid.equalsIgnoreCase(cuname)) {
            return true;
        } else {
            return false;
        }
    }

    public static College getCollById(String CollId) {
        try {
            Connection con = MyConnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from college where collid='" + CollId + "'");
            College c = new College();
            if (rs.next()) {
                c.setCollid(rs.getString(1));
                c.setCollname(rs.getString(2));
                c.setColladd(rs.getString(3));
                c.setCuname(rs.getString(4));
                c.setCpasswd(rs.getString(5));
            }
            return c;
        } catch (Exception e) {
            return null;
        }
    }

    public boolean updateCollege() {
        try {
            Connection con = MyConnection.getConnection();
            Statement st = con.createStatement();
            st.executeUpdate("update college set collid = " + collid + ", collname = '" + collname + "', colladd = '" + colladd + "' where collid =" + collid);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public static String getCollNameById(int id) {
        try {
            Connection con = MyConnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select collname from uec.college where collid=" + id);
            if (rs.next()) {
                return rs.getString(1);
            } else {
                return "NOTFOUND";
            }
        } catch (Exception e) {
            return "NOTFOUND";
        }
    }

    public Boolean isValid() {
        try {
            Connection con = MyConnection.getConnection();
            System.out.println("Getting Connection");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select cpasswd from uec.college where cuname = '" + cuname + "'");
            if (rs.next() && cpasswd.equals(rs.getString(1))) {
                //System.out.println("vALID Passwd");
                return true;

            } else {
                //System.out.println("Invalid Password");
                //System.out.println("Username : "+cuname);
                //System.out.println("Password : "+cpasswd);
                return false;
            }
        } catch (Exception e) {
            return false;
        }
    }

    public static String getCollIdByUname(String uname) {
        try {
            Connection con = MyConnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT collid from uec.college where cuname='" + uname + "'");
            if (rs.next()) {
                return rs.getString(1);
            } else {
                return null;
            }
        } catch (Exception e) {
            return null;
        }
    }
}
