/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import model.OrderDetails;
import model.Orders;
import model.Products;

/**
 *
 * @author ADMIN
 */
public class OrderDAO extends DBContext{
    public Vector<Orders> getAllOrder(String sql) {
        Vector<Orders> listOrder = new Vector<>();
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                Orders o = new Orders(rs.getInt(1),
                        rs.getDate(2),
                        rs.getDouble(3),
                rs.getString(4));
                listOrder.add(o);

            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return listOrder;
    }
    public void insertOrder(Orders o) {
        String sql = "INSERT INTO [dbo].[tblOrders]\n"
                + "           ([orderDate]\n"
                + "           ,[total]\n"
                + "           ,[userID])\n"
                + "     VALUES(?,?,?)";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setDate(1, o.getOrderDate());
            ptm.setDouble(2, o.getTotal());
            ptm.setString(3, o.getUserID());
            ptm.executeUpdate();
//            return n;
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
//        return 0;
    }
    public Orders searchOrder(int orderID) {
        String sql = "SELECT * FROM tblOrders\n"
                + "WHERE orderID=?";

        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setInt(1, orderID);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                Orders p = new Orders(orderID,
                        rs.getDate(2), rs.getDouble(3),
                        rs.getString(4));
                return p;
            }

        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return null;
    }

    public void updateOrder(Orders o) {
        String sql = "UPDATE [dbo].[tblOrders]\n"
                + "   SET [orderDate] = ?\n"
                + "      ,[total] = ?\n"
                + "      ,[userID] = ?\n"
                + " WHERE orderID=?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setDate(1, o.getOrderDate());
            ptm.setDouble(2, o.getTotal());
            ptm.setString(3, o.getUserID());
            ptm.setInt(4, o.getOrderID());
            ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
    }
    public void deleteOrder(int orderID) {
        String sql = "DELETE FROM [dbo].[tblOrders]\n"
                + "      WHERE orderID=?";
        PreparedStatement ptm;
        try {
            ptm = connection.prepareStatement(sql);
            ptm.setInt(1, orderID);
           ptm.executeUpdate();
        } catch (Exception ex) {
            ex.getStackTrace();
        }
    }
}
