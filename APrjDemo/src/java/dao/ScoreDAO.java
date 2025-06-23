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
import model.Score;

/**
 *
 * @author kat20
 */
public class ScoreDAO {
  public List<Score> getAll() {
    List<Score> list = new ArrayList<>();
    String sql = "SELECT s.SID, stu.SName AS studentName, c.CourseID, c.CourseName, " +
                 "s.ProgessTest1, s.ProgessTest2, s.SmallTest1, s.SmallTest2, " +
                 "s.PracticeExam, s.FinalExam, s.TotalPoint " + // Thêm TotalPoint
                 "FROM score s " +
                 "JOIN Student stu ON s.SID = stu.SID " +
                 "JOIN Course c ON s.CourseID = c.CourseID;";
    try {
        PreparedStatement st = DBContext.getconnect().prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) { 
            double totalPoint = rs.getObject("TotalPoint") != null ? rs.getDouble("TotalPoint") : -1;
            
            Score sco = new Score(
                    rs.getString("SID"),
                    rs.getString("studentName"),
                    rs.getString("courseID"),
                    rs.getString("courseName"),
                    rs.getDouble("ProgessTest1"),
                    rs.getDouble("ProgessTest2"),
                    rs.getDouble("SmallTest1"),
                    rs.getDouble("SmallTest2"),
                    rs.getDouble("PracticeExam"),
                    rs.getDouble("FinalExam"),
                    totalPoint 
            );
            list.add(sco);
        }
    } catch (SQLException e) {
        System.out.print(e);
    }
    return list;
}
 
 // hoàn thiện sửa hàm này cho phù hợp 
    public List<Score> getAll(String coOrStu,String search, String sort,String inOrDe) {
        List<Score> list = new ArrayList<>();
        String query = "SELECT s.SID, stu.SName AS studentName, c.CourseID, c.CourseName, " +
                 "s.ProgessTest1, s.ProgessTest2, s.SmallTest1, s.SmallTest2, " +
                 "s.PracticeExam, s.FinalExam, s.TotalPoint " + // Thêm TotalPoint
                 "FROM score s " +
                 "JOIN Student stu ON s.SID = stu.SID " +
                 "JOIN Course c ON s.CourseID = c.CourseID";

        // Thêm điều kiện sắp xếp
        if(inOrDe.equals("none")){
            inOrDe = " ";
        } else if(inOrDe.equals("ASC")){
            inOrDe = " "+"ASC";
        } else {
            inOrDe = " "+"DESC";
        }
        
        if (!search.equals("")) {
            if(coOrStu.equals("student")){
                       query += " WHERE stu.SName LIKE '%"+search+"%'";
            } else {
                       query += " WHERE c.CourseName LIKE '%"+search+"%'";
            }
        } 
        
        if ("SID".equals(sort)) {
            query += " ORDER BY s.SID";
              query+= " " + inOrDe;
        } else if ("CID".equals(sort)) {
            query += " ORDER BY s.CourseID";
              query+= " " + inOrDe;
          } else if ("SmallTest1".equals(sort)) {
            query += " ORDER BY s.SmallTest1";
              query+= " " + inOrDe;
          } else if ("SmallTest2".equals(sort)) {
            query += " ORDER BY s.SmallTest2";
              query+= " " + inOrDe;
          } else if ("PracticeExam".equals(sort)) {
            query += " ORDER BY s.PracticeExam";
              query+= " " + inOrDe;
          } else if ("ProgressTest1".equals(sort)) {
            query += " ORDER BY s.ProgessTest1";
              query+= " " + inOrDe;
          } else if ("ProgressTest2".equals(sort)) {
            query += " ORDER BY s.ProgessTest2";
              query+= " " + inOrDe;
          } else if ("FinalExam".equals(sort)) {
            query += " ORDER BY s.FinalExam";
              query+= " " + inOrDe;
          } else if ("totalPoint".equals(sort)) {
            query += " ORDER BY s.TotalPoint";
              query+= " " + inOrDe;
          }  
         System.out.print(query);
        try {
        PreparedStatement st = DBContext.getconnect().prepareStatement(query );
        ResultSet rs = st.executeQuery();
        while (rs.next()) { 
            double totalPoint = rs.getObject("TotalPoint") != null ? rs.getDouble("TotalPoint") : -1;
            
            Score sco = new Score(
                    rs.getString("SID"),
                    rs.getString("studentName"),
                    rs.getString("courseID"),
                    rs.getString("courseName"),
                    rs.getDouble("ProgessTest1"),
                    rs.getDouble("ProgessTest2"),
                    rs.getDouble("SmallTest1"),
                    rs.getDouble("SmallTest2"),
                    rs.getDouble("PracticeExam"),
                    rs.getDouble("FinalExam"),
                    totalPoint 
            );
            list.add(sco);
        }
    } catch (SQLException e) {
        System.out.print(e);
    }
    return list;
    }

    public int getSizeOfScore() {
        return getAll().size();
    }
    
    public void addScore(Score sco) {
        String sql = "INSERT INTO score (studentID, studentName, courseID, courseName, ProgessTest1, ProgessTest2, SmallTest1, SmallTest2, PracticeExam, FinalExam, TotalPoint) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = DBContext.getconnect().prepareStatement(sql);
            st.setString(1, sco.getSID());
            st.setString(2, sco.getSName());
            st.setString(3, sco.getCID());
            st.setString(4, sco.getCName());
            st.setDouble(5, sco.getProgressTest1());
            st.setDouble(6, sco.getProgressTest2());
            st.setDouble(7, sco.getSmallTest1());
            st.setDouble(8, sco.getSmallTest2());
            st.setDouble(9, sco.getPracticeExam());
            st.setDouble(10, sco.getFinalExam());
            st.setDouble(11, sco.getTotalPoint());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.print(e);
        }
    }
    
    public void updateTotalPoint(Score s, double ttp) {
        String query = "UPDATE score SET TotalPoint = ? WHERE studentID = ? AND courseID = ?";
        try (Connection conn = DBContext.getconnect()) {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setDouble(1, ttp);
            ps.setString(2, s.getSID());
            ps.setString(3, s.getCID());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.print(e);
        }
    }
    
    public void updateScore(Score sco) {
        String query = "UPDATE score SET ProgessTest1=?, ProgessTest2=?, SmallTest1=?, SmallTest2=?, PracticeExam=?, FinalExam=? WHERE studentID = ? AND courseID = ?";
        try (Connection conn = DBContext.getconnect()) {
            PreparedStatement st = conn.prepareStatement(query);
            st.setDouble(1, sco.getProgressTest1());
            st.setDouble(2, sco.getProgressTest2());
            st.setDouble(3, sco.getSmallTest1());
            st.setDouble(4, sco.getSmallTest2());
            st.setDouble(5, sco.getPracticeExam());
            st.setDouble(6, sco.getFinalExam());
            st.setString(7, sco.getSID());
            st.setString(8, sco.getCID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.print(e);
        }
    }
    
    public static void main(String[] args) {
        ScoreDAO sDAO = new ScoreDAO();
        List<Score> list = sDAO.getAll("course","Web","","");
        System.out.println("\n"+list.get(0).getTotalPoint());
    }
}
