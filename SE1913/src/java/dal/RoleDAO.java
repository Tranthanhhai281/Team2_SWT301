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
import model.Roles;

/**
 *
 * @author ADMIN
 */
public class RoleDAO extends DBContext{
    public Vector<Roles> getAllRole(String sql) {
        Vector<Roles> listRole = new Vector<>();
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                Roles r = new Roles(rs.getInt(1),
                        rs.getString(2));
                listRole.add(r);

            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return listRole;
    }
    public void insertRole(Roles r) {
        String sql = "INSERT INTO [dbo].[tblRoles]\n"
                + "           ([roleName])\n"
                + "     VALUES(?)";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1,r.getRoleName());
 
            ptm.executeUpdate();
//            return n;
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
//        return 0;
    }
    public Roles searchRole(int roleID) {
        String sql = "SELECT * FROM tblRoles\n"
                + "WHERE roleID=?";

        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setInt(1, roleID);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                Roles r = new Roles(roleID,
                        
                        rs.getString(2));
                return r;
            }

        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return null;
    }

    public void updateRole(Roles r) {
        String sql = "UPDATE [dbo].[tblRoles]\n"
                + "   SET [roleName] = ?\n"
               
                + " WHERE roleID=?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
           
            ptm.setString(1, r.getRoleName());
            ptm.setInt(2, r.getRoleID());
            ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
    }
    public void deleteRole(int roleID) {
        String sql = "DELETE FROM [dbo].[tblRoles]\n"
                + "      WHERE roleID=?";
        PreparedStatement ptm;
        try {
            ptm = connection.prepareStatement(sql);
            ptm.setInt(1, roleID);
           ptm.executeUpdate();
        } catch (Exception ex) {
            ex.getStackTrace();
        }
    }
}
