/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.image;

/**
 *
 * @author kat20
 */
public class imgDAO {
    public List<image> getAll() {
          List<image> list = new ArrayList<>();
          String sql = "select * from image";
          try {
              PreparedStatement st=DBContext.getconnect().prepareStatement(sql);
              ResultSet rs=st.executeQuery();
              while(rs.next()){
                  image i=new image(
                          rs.getString("id"),
                          rs.getString("type"),
                          rs.getString("humanCode"), 
                          rs.getString("url")
                  );
                   list.add(i);
              }
          } catch (SQLException e){
              System.out.print(e);
          }
          return list;
      }
        public int getSizeOfImg() {
          List<image> list = new ArrayList<>();
           list = getAll();
           int size_of_imgList=list.size();
          return size_of_imgList;
      }
      
                public void addImg(image i) {
        String sql = "INSERT INTO image (id, type, humanCode, url)  VALUES (?, ?, ?,?)";
        try {
            PreparedStatement st = DBContext.getconnect().prepareStatement(sql);             
             st.setString(1, i.getId());
            st.setString(2, i.getType());
            st.setString(3, i.getHumanCode()); 
             st.setString(4, i.getUrl()); 
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.print(e);
        }
                }
        
        
          public void deleImg(String humanCode,String type) {
    String query = "DELETE FROM image WHERE id = '"+humanCode+"' AND type = '"+ type +"';"; 
     try( Connection conn=DBContext.getconnect()) {
           PreparedStatement ps = conn.prepareStatement(query);
        ps.executeUpdate(); 
    } catch (SQLException e) {
     System.out.print(e);
    }
} 
        
        
              public static void main(String[] args) {
           imgDAO iDAO = new imgDAO();
     List<image> list = iDAO.getAll();
     image i = new image("001","student","001","nguyen van A.jpd");
     iDAO.deleImg("001","student");
    
              }
}

