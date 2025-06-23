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
import model.Form;

/**
 *
 * @author kat20
 */
public class formDAO {
    public List<Form> getAll() {
          List<Form> list = new ArrayList<>();
          String sql = "select * from form";
          try {
              // luu y
              PreparedStatement st=DBContext.getconnect().prepareStatement(sql);
              ResultSet rs=st.executeQuery();
              while(rs.next()){
                  Form fo=new Form(
                          rs.getString("formId"),
                          rs.getString("userIdRe"),
                          rs.getString("userIdSe"),
                          rs.getString("typeOfForm"),
                          rs.getString("reason")
                  );
                   list.add(fo);
              }
          } catch (SQLException e){
              System.out.print(e);
          }
          return list;
      }
        public int getSizeOfForm() {
          List<Form> list = new ArrayList<>();
           list = getAll();
           int size_of_List=list.size();
          return size_of_List;
      }
        
            public void addForm(Form fo) {
        String sql = "INSERT INTO form (formId, userIdRe, userIdSE, typeOfForm,reason)  VALUES (?,?, ?, ?,?)";
        try {
            PreparedStatement st = DBContext.getconnect().prepareStatement(sql);             
             st.setString(1, fo.getFormId());
            st.setString(2, fo.getUserIdRe());
            st.setString(3, fo.getUserIdSe());
            st.setString(4, fo.getTypeOfForm());
            st.setString(5, fo.getReason());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.print(e);
        }
    }
        
          public void deleForm(String form_id) {
    String query = "DELETE FROM form WHERE formId = ?"; // SQL để xóa hóa đơn có id tương ứng
    try( Connection conn=DBContext.getconnect()) {
           PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, form_id); // Giả sử bill có phương thức getBillId() để lấy id của bill
        ps.executeUpdate(); 
    } catch (SQLException e) {
        System.out.print(e);
    }
} 
         
      public static void main(String[] args) {
           formDAO cDAO = new formDAO();
     List<Form> list = cDAO.getAll();
     Form fo = new Form("1","admin","3","xxx","xxx");
      
 
    }
      
}
