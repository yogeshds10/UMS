/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uec;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

/**
 *
 * @author Vinnu
 */
public class ApplicationBean {

    private long appid;
    private String fname;
    private String lname;
    private String year;
    private String mnth;
    private String date;
    private String gender;
    private String medium;
    private String nation;
    private String pucollname;
    private String pucourse;
    private String ppercent;
    private String spercent;
    private String address;
    private String email;
    private String phone;
    private String collname;
    private String coname;
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public long getAppid() {
        return appid;
    }

    public void setAppid(long appid) {
        this.appid = appid;
    }

    public String getConame() {
        return coname;
    }

    public void setConame(String coname) {
        this.coname = coname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCollname() {
        return collname;
    }

    public void setCollname(String collname) {
        this.collname = collname;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getMedium() {
        return medium;
    }

    public void setMedium(String medium) {
        this.medium = medium;
    }

    public String getMnth() {
        return mnth;
    }

    public void setMnth(String mnth) {
        this.mnth = mnth;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPpercent() {
        return ppercent;
    }

    public void setPpercent(String ppercent) {
        this.ppercent = ppercent;
    }

    public String getPucollname() {
        return pucollname;
    }

    public void setPucollname(String pucollname) {
        this.pucollname = pucollname;
    }

    public String getPucourse() {
        return pucourse;
    }

    public void setPucourse(String pucourse) {
        this.pucourse = pucourse;
    }

    public String getSpercent() {
        return spercent;
    }

    public void setSpercent(String spercent) {
        this.spercent = spercent;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public int addApplication() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uec", "root", "admin");
            Statement st = con.createStatement();
            st.executeUpdate("INSERT INTO uec.application"
                    + "(Name,lname,email,gender,phone,pcoll,ppercent,spercent,nationality,coll,course,status,remarks,dob,medium,pucourse,address)"
                    + "VALUES('" + fname + "','" + lname + "','" + email + "','" + gender + "','" + phone + "','" + pucollname + "'," + ppercent + "," + spercent + ",'" + nation + "'," + collname + "," + coname + ",'Downloaded','','" + year + "-" + mnth + "-" + date + "','" + medium + "','" + pucourse + "','"+address+"')");
            ResultSet rs = st.executeQuery("select appid "
                    + "from uec.application "
                    + "where Name='" + fname + "' and "
                    + "lname='" + lname + "' and "
                    + "email='" + email + "' and "
                    + "gender='" + gender + "'  and "
                    + "phone=" + phone + "   and "
                    + "ppercent=" + ppercent);
            rs.next();
            return rs.getInt(1);
        } catch (Exception e) {
            return -1;
        }
    }

    public static ApplicationBean getApplicationById(String appid) {
        try {
            ApplicationBean a = new ApplicationBean();
            Connection con = MyConnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from application where appid = " + appid);
            if (rs.next()) {
                a.setAppid(rs.getLong(1));
                a.setFname(rs.getString(2));
                a.setLname(rs.getString(3));
                a.setEmail(rs.getString(4));
                a.setGender(rs.getString(5));
                a.setPhone(rs.getString(6));
                a.setPucollname(rs.getString(7));
                a.setPpercent(rs.getString(8));
                a.setSpercent(rs.getString(9));
                a.setNation(rs.getString(10));
                a.setCollname(rs.getString(11));
                a.setConame(rs.getString(12));
                a.setStatus(rs.getString(13));
                a.setMedium(rs.getString(16));
                a.setPucourse(rs.getString(17));
                a.setAddress(rs.getString(18));
                String date[]=rs.getString(15).split("-");
                a.setYear(date[0]);
                a.setMnth(date[1]);
                a.setDate(date[2]);
//                System.out.println(a.getDate()+" "+a.getMnth()+" "+a.getYear());
                return a;
            }
            else{
                return null;
            }
        } catch (Exception e) {
            return null;
        }
    }
}
