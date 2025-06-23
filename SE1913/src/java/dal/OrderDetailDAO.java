/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import model.OrderDetails;
import model.Products;

/**
 *
 * @author ADMIN
 */
public class OrderDetailDAO extends DBContext{
    public Vector<OrderDetails> getAllOrderDetail(String sql) {
        Vector<OrderDetails> listOrderDetail = new Vector<>();
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                OrderDetails od = new OrderDetails(rs.getInt(1),
                        rs.getDouble(2),
                        rs.getInt(3),
                rs.getInt(4),
                rs.getInt(5));
                listOrderDetail.add(od);

            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return listOrderDetail;
    }
    public void insertOrderDetail(OrderDetails od) {
        String sql = "INSERT INTO [dbo].[tblOrderDetails]\n"
                + "           ([price]\n"
                + "           ,[quantity]\n"
                + "           ,[orderID]\n"
                + "           ,[productID])\n"
                + "     VALUES(?,?,?,?)";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setDouble(1, od.getPrice());
            ptm.setInt(2, od.getQuantity());
            ptm.setInt(3, od.getOrderID());
            ptm.setInt(4, od.getProductID());
            ptm.executeUpdate();
//            return n;
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
//        return 0;
    }
    public OrderDetails searchOrderDetail(int DetailID) {
        String sql = "SELECT * FROM tblOrderDetails\n"
                + "WHERE detailID=?";

        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setInt(1, DetailID);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                OrderDetails p = new OrderDetails(DetailID,
                        rs.getDouble(2), rs.getInt(3),
                        rs.getInt(4), rs.getInt(5));
                return p;
            }

        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return null;
    }

    public void updateOrderDetail(OrderDetails od) {
        String sql = "UPDATE [dbo].[tblOrderDetails]\n"
                + "   SET [price] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[orderID] = ?\n"
                + "      ,[productID] = ?\n"
                + " WHERE detailID=?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setDouble(1, od.getPrice());
            ptm.setInt(2, od.getQuantity());
            ptm.setInt(3, od.getOrderID());
            ptm.setInt(4, od.getProductID());
            ptm.setInt(5, od.getDetailID());
            ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
    }
    public void deleteOrderDetail(int detailID) {
        String sql = "DELETE FROM [dbo].[tblOrderDetails]\n"
                + "      WHERE detailID=?";
        PreparedStatement ptm;
        try {
            ptm = connection.prepareStatement(sql);
            ptm.setInt(1, detailID);
            ptm.executeUpdate();
            connection.commit();
        } catch (Exception ex) {
            ex.getStackTrace();
        }
        
    }
}
