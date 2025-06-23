/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.util.Vector;
import model.Products;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Categories;

/**
 *
 * @author ADMIN
 */
public class CategoryDAO extends DBContext {

    public Vector<Categories> getAllCategory(String sql) {
        Vector<Categories> listCategory = new Vector<>();
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                Categories c = new Categories(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3));
                listCategory.add(c);

            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return listCategory;
    }

    public boolean insertCategory(Categories c) {
        String sql = "INSERT INTO [dbo].[tblCategories]\n"
                + "           ([categoryID]\n"
                + "           ,[categoryName]\n"
                + "           ,[describe])\n"
                + "     VALUES(?,?,?)";
        String checkSQL = "SELECT COUNT(*) FROM [dbo].[tblCategories] WHERE categoryID = ?";
        try {
            PreparedStatement checkptm = connection.prepareStatement(checkSQL);
            checkptm.setString(1, c.getCategoryID());
            ResultSet rs = checkptm.executeQuery();
            if (rs.next()&&rs.getInt(1)>0) {
                System.out.println("id da ton tai");
            }else{
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, c.getCategoryID());
            ptm.setString(2, c.getCategoryName());
            ptm.setString(3, c.getDescribe());

            ptm.executeUpdate();
            return true;}
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return false;
    }

    
    public Categories searchCategory(String CategoryID) {
        String sql = "SELECT * FROM tblCategories\n"
                + "WHERE categoryID=?";

        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, CategoryID);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                Categories c = new Categories(CategoryID,
                        rs.getString(2), rs.getString(3));
                return c;
            }

        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return null;
    }

    public void updateCategory(Categories c) {
        String sql = "UPDATE [dbo].[tblCategories]\n"
                + "   SET          [categoryName] = ?\n"
                + "      ,[describe] = ?\n"
                + " WHERE categoryID=?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(3, c.getCategoryID());
            ptm.setString(1, c.getCategoryName());
            ptm.setString(2, c.getDescribe());
            ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
    }

    public void deleteCategory(String categoryID) {
        String sql = "DELETE FROM [dbo].[tblCategories]\n"
                + "      WHERE categoryID=?";
        
        PreparedStatement ptm;
        try {
            ptm = connection.prepareStatement(sql);
            ptm.setString(1, categoryID);
            ptm.executeUpdate();
        } catch (Exception ex) {
            ex.getStackTrace();
        }

    }
}
