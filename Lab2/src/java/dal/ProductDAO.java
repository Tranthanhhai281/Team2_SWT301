/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Products;
import java.sql.*;
import model.Category;
/**
 *
 * @author TRAN ANH HAI
 */
public class ProductDAO extends DBContext{
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
    
    public List<Products> getAll(){
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM Products";
        try{
            PreparedStatement st = connection.prepareStatement(sql);    
            ResultSet rs = st.executeQuery();
            
            while(rs.next()){
                Products p = new Products();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getString("releaseDate"));
                p.setDescribe(rs.getString("describe"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                
                list.add(p);
                        
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public List<Products> getProductsByCid(int cid){
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE 1=1";
        if(cid != 0){
            sql += "and cid=" + cid; 
        }
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            
            while(rs.next()){
                Products p = new Products();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getString("releaseDate"));
                p.setDescribe(rs.getString("describe"));
                p.setDescribe(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                
                list.add(p);
                        
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public List<Products> search(String key, Date from, Date to,
                Double price1, Double price2,int cid){
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE 1=1";
        
        if(key != null && !key.equals("")){
            sql += "and name like '%" + key + "%' or describe like '%" + key + "%'"; 
        }
        if(from != null){
            sql += "and releaseDate>='" + from + "'";
        }
        if(to != null){
            sql += "and releaseDate=<'" + from + "'";
        }
        if(price1 != null){
            sql += "and price>=" + price1;
        }
        if(price2 != null){
            sql += "and price<=" + price2;
        }
        if(cid != 0){
            sql += "and cid =" + cid;
        }
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            
            while(rs.next()){
                Products p = new Products();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getString("releaseDate"));
                p.setDescribe(rs.getString("describe"));
                p.setDescribe(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setCategory(c);
                
                list.add(p);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public static void main(String[] args){
        ProductDAO p = new ProductDAO();
        List<Products> list = p.getAll();
        System.out.println(list.get(0).getName());
    }
}
