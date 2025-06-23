/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;


import java.sql.*;

/**
 *
 * @author Kieu Tri Hung
 */
public class DBContext {
//    protected Connection connection;
   public static Connection getconnect() {
       try {
           String url = "jdbc:sqlserver://localhost:1433;databaseName=StudentManagerment";
           String username = "sa";
           String password = "123";
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           return  DriverManager.getConnection(url,username,password);
       } catch (Exception e) {
           System.err.println("Connection failed: " + e.getMessage());
           return null;
       }
    
}
   
}
