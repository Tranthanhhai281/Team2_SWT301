/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Category;
import java.sql.*;

/**
 *
 * @author TRAN ANH HAI
 */
public class CategoryDAO extends DBContext{
    public List<Category> getAll(){
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM Categories";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            
            while(rs.next()){
                Category c = new Category(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("describe")
                );
                list.add(c);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public void insert(Category c){
        String sql = "INSERT INTO Categories (id, name, describe) VALUES (?, ?, ?)";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getId());
            st.setString(2, c.getName());
            st.setString(3, c.getDescribe());
            
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public Category getCategoryById(int id){
        String sql = "SELECT * FROM Categories WHERE id = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            
            if(rs.next()){
                Category c = new Category(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("describe")
                );
                return c;
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    
    public void Delete(int id){
        String sql = "DELETE FROM Categories WHERE id=?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            
            int rowsAffected = st.executeUpdate();
            
            if(rowsAffected > 0){
                System.out.println("Category with ID " + id + " was deleted successfully");
            }else{
                System.out.println("No Category found with ID " + id + ".");
            }
            
        }catch(SQLException e){
            System.out.println("SQL Error: " + e.getMessage());
        }
    }
    
    public void Update(Category c){
        String sql = "UPDATE Categories SET name=?,describe=? WHERE id=?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setString(2, c.getDescribe());
            st.setInt(3, c.getId());
            
            st.executeUpdate();
            
        }catch(SQLException e){
            System.out.println("SQL Error: " + e.getMessage());
        }
    }
    
    public static void main(String[] args){
        CategoryDAO c = new CategoryDAO();
        List<Category> list = c.getAll();
        System.out.println(list.get(0).getName());
    }
}
