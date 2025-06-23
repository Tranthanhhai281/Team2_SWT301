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
import model.Teacher;

/**
 *
 * @author kat20
 */
public class teacherDAO {
    public List<Teacher> getAll() {
          List<Teacher> list = new ArrayList<>();
          String sql = "select * from Teacher";
          try {
              PreparedStatement st=DBContext.getconnect().prepareStatement(sql);
              ResultSet rs=st.executeQuery();
              while(rs.next()){
                  Teacher tea=new Teacher(
                          rs.getString("teacherId"),
                   rs.getString("name"),
                    rs.getString("phone"),
                     rs.getString("discription")                   
                  );
                   list.add(tea);
              }
          } catch (SQLException e){
              System.out.print(e);
          }
          return list;
      }
     
     
        public int getSizeOfTea() {
          List<Teacher> list = new ArrayList<>();
           list = getAll();
           int size_of_TeaList=list.size();
          return size_of_TeaList;
      }
      
      
        public void addStu(Teacher te) {
        String sql = "INSERT INTO Teacher (teacherId, name, phone,discription)  VALUES (?, ?, ?,?)";
        
        try {
           
            PreparedStatement st = DBContext.getconnect().prepareStatement(sql);             
             st.setString(1, te.getTeacherId());
            st.setString(2, te.getName());
            st.setString(3, te.getPhone()); 
             st.setString(4, te.getDiscription());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.print(e);
        }
    }
        
    public void deleStu(String te_id) {
    String query = "DELETE FROM Teacher WHERE teacherId = ?"; // SQL để xóa hóa đơn có id tương ứng
     try( Connection conn=DBContext.getconnect()) {
           PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, te_id); // Giả sử bill có phương thức getBillId() để lấy id của bill
        ps.executeUpdate(); 
    } catch (SQLException e) {
     System.out.print(e);
    }
} 
    
          public static void main(String[] args) {
           teacherDAO sDAO = new teacherDAO();
     List<Teacher> list = sDAO.getAll();
     System.out.println(list.get(0).getTeacherId()); 
            System.out.println(sDAO.getSizeOfTea());  
   
    }
    
    
}
