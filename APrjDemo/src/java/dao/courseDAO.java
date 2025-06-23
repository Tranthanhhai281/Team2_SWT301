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
import model.Course;

/**
 *
 * @author kat20
 */
public class courseDAO {
    public List<Course> getAll() {
          List<Course> list = new ArrayList<>();
          String sql = "select * from Course";
          try {
              // luu y
              PreparedStatement st=DBContext.getconnect().prepareStatement(sql);
              ResultSet rs=st.executeQuery();
              while(rs.next()){
                  Course cou=new Course(
                          rs.getString("CourseID"),
                          rs.getString("CourseName"),
                          rs.getString("CourseCredit"),
                          rs.getString("CourseFee")  
                  );
                   list.add(cou);
              }
          } catch (SQLException e){
              System.out.print(e);
          }
          return list;
      }
        public int getSizeOfCou() {
          List<Course> list = new ArrayList<>();
           list = getAll();
           int size_of_couList=list.size();
          return size_of_couList;
      }
      
      
        public void addCou(Course cou) {
        String sql = "INSERT INTO Course (CourseID, CourseName, CourseCredit, CourseFee)  VALUES (?, ?, ?,?)";
        try {
            PreparedStatement st = DBContext.getconnect().prepareStatement(sql);             
             st.setString(1, cou.getId());
            st.setString(2, cou.getName());
            st.setString(3, cou.getCredit());
            st.setString(4, cou.getFee()); 
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.print(e);
        }
    }
        
    public void deleCou(String cou_id) {
    String query = "DELETE FROM Course WHERE CourseID = ?"; // SQL để xóa hóa đơn có id tương ứng
    try( Connection conn=DBContext.getconnect()) {
           PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, cou_id); // Giả sử bill có phương thức getBillId() để lấy id của bill
        ps.executeUpdate(); 
    } catch (SQLException e) {
        System.out.print(e);
    }
} 
   public void updateCou(Course s) {
    String query = "UPDATE Course SET CourseName = ?, CourseCredit = ?, CourseFee = ? WHERE CourseID = ?";
        try( Connection conn=DBContext.getconnect()) {
           PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, s.getName());
            ps.setString(2, s.getCredit());
            ps.setString(3, s.getFee());
            ps.setString(4, s.getId()); 
             ps.executeUpdate(); 
        } catch (SQLException e) {
            System.out.print(e);
        }
    } 
   
      public void updateCou(Course s,String old_cou_id) {
    String query = "UPDATE Course SET CourseID = ?, CourseName = ?, CourseCredit = ?, CourseFee = ? WHERE CourseID = ?";
           try( Connection conn=DBContext.getconnect()) {
           PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, s.getId());
            ps.setString(2, s.getName());
            ps.setString(3, s.getCredit());
            ps.setString(4, s.getFee());
            ps.setString(5,old_cou_id); 
             ps.executeUpdate(); 
        } catch (SQLException e) {
            System.out.print(e);
        }
    }
      
      
      public static void main(String[] args) {
           courseDAO cDAO = new courseDAO();
     List<Course> list = cDAO.getAll();
     Course cou = new Course("3","Database Management","3","350.00");
     
     cDAO.updateCou(cou,"2");
 
    }
      
   
}
