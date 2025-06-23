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
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDAO extends DBContext {

    public Vector<Products> getAllProduct(String sql) {
        Vector<Products> listProduct = new Vector<>();
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                Products p = new Products(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getInt(9));
                listProduct.add(p);

            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return listProduct;
    }

    public void insertProduct(Products p) {
        String sql = "INSERT INTO [dbo].[tblProducts]\n"
                + "           ([productName]\n"
                + "           ,[image]\n"
                + "           ,[price]\n"
                + "           ,[quantity]\n"
                + "           ,[categoryID]\n"
                + "           ,[importDate]\n"
                + "           ,[usingDate]\n"
                + "           ,[status])\n"
                + "     VALUES(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, p.getProductName());
            ptm.setString(2, p.getImage());
            ptm.setDouble(3, p.getPrice());
            ptm.setInt(4, p.getQuantity());
            ptm.setString(5, p.getCategoryID());
            ptm.setDate(6, p.getImportDate());
            ptm.setDate(7, p.getUsingDate());
            ptm.setInt(8, p.getStatus());
            ptm.executeUpdate();
//            return n;
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
//        return 0;
    }

    public Products searchProduct(int ProductID) {
        String sql = "SELECT * FROM tblProducts\n"
                + "WHERE productID=?";

        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setInt(1, ProductID);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                Products p = new Products(ProductID,
                        rs.getString(2), rs.getString(3),
                        rs.getDouble(4), rs.getInt(5),
                        rs.getString(6), rs.getDate(7),
                        rs.getDate(8), rs.getInt(9));
                return p;
            }

        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return null;
    }

    public void updateProduct(Products p) {
        String sql = "UPDATE [dbo].[tblProducts]\n"
                + "   SET [productName] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[categoryID] = ?\n"
                + "      ,[importDate] = ?\n"
                + "      ,[usingDate] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE productID=?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, p.getProductName());
            ptm.setString(2, p.getImage());
            ptm.setDouble(3, p.getPrice());
            ptm.setInt(4, p.getQuantity());
            ptm.setString(5, p.getCategoryID());
            ptm.setDate(6, p.getImportDate());
            ptm.setDate(7, p.getUsingDate());
            ptm.setInt(8, p.getStatus());
            ptm.setInt(9, p.getProductID());
            ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
    }

    public void changeStatus(int productID, int newStatus) {
        String sql = "UPDATE [dbo].[tblProducts] SET status = ? WHERE productID = ?";
        try (PreparedStatement ptm = connection.prepareStatement(sql)) {
            ptm.setInt(1, newStatus);
            ptm.setInt(2, productID);
            ptm.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public int deleteProduct(int productID) {
        String sql = "DELETE FROM [dbo].[tblProducts]\n"
                + "      WHERE productID=?";
        int n = 0;
        PreparedStatement ptm;
        try {
            ptm = connection.prepareStatement(sql);
            ptm.setInt(1, productID);
            ResultSet rs = getData("SELECT *\n"
                    + "  FROM [dbo].[tblProducts]\n"
                    + "  where productID=" + productID);
            if (rs.next()) {
                changeStatus(productID, 0);
                return n;
            }
            n = ptm.executeUpdate();
        } catch (Exception ex) {
            ex.getStackTrace();
        }
        return n;
    }

    public static void main(String[] args) {
        String sql = "SELECT * FROM [dbo].[tblProducts]";
        SimpleDateFormat time = new SimpleDateFormat("dd/MM/yyyy");

        ProductDAO pDAO = new ProductDAO();
        Vector<Products> list = pDAO.getAllProduct(sql);
        for (Products p : list) {
            System.out.println(p);
        }

//        Products p = new Products("Ao Len", "gfdgf",
//                100, 2, "C001", new Date(2025 - 1900, 1, 15),
//                new Date(2025 - 1900, 1, 16), 1);
////        Products pSearch = pDAO.searchProduct(p.getProductID());
////        if (pSearch!=null) {
////            System.out.println("Product is exist");
////        }else{
////            pDAO.insertProduct(p);
////        for (Products products : list) {
////            System.out.println(products);
////        }
////        }
////        pDAO.insertProduct(p);
////        for (Products products : list) {
////            System.out.println(products);
////        }
//        Products pro = pDAO.searchProduct(3);
//        if (pro != null) {
//            pDAO.updateProduct(new Products(pro.getProductID(), "Tai nghe AirPods 25", "gsrg", 10, 1, "C001", new Date(2025 - 1900, 1, 15), new Date(2025 - 1900, 1, 16), 1));
//            System.out.println("Updated");
//        } else {
//            System.out.println("Not updated");
//        }
////        pDAO.updateProduct(pro);
////        for (Products products : list) {
////            System.out.println(products);
////        }
        Products p1 = pDAO.searchProduct(5);
        if (p1 != null) {
            pDAO.deleteProduct(p1.getProductID());
            System.out.println("deleted");
        } else {
            System.out.println("false delete");
        }
    }
}
