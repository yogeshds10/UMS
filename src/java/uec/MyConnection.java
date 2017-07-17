/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uec;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Vinnu
 */
public class MyConnection {

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uec", "root", "admin");
            return con;
        } catch (Exception e) {
            System.out.println("Error : " + e);
            return null;
        }
    }
}
