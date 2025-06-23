/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.*;

/**
 *
 * @author TRAN ANH HAI
 */
public class DBContext {
    protected Connection connection;

    public DBContext() {
        try{
            String url = "jdbc:sqlserver://localhost:1433;databaseName=PRJ301_Trading_2024";
            String username = "sa";
            String password = "123";         
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        }catch(ClassNotFoundException | SQLException ex){
            System.out.println(ex);
        }
    }
}
