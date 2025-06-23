/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.web;

import dao.studentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Student;

/**
 *
 * @author kat20
 */
@WebServlet(name = "editStudent", urlPatterns = {"/editStudent"})
public class editStudent extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editStudent</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editStudent at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String old_id_stu = request.getParameter("old_id_stu");
        String new_id_stu = request.getParameter("new_id_stu");
        String name = request.getParameter("name");
        String DOB = request.getParameter("DOB");
        String user = request.getParameter("userName");
        String pass = request.getParameter("password");

        studentDAO sDAO = new studentDAO();
        List<Student> list_stu = sDAO.getAll();
        Student newStudent = new Student(new_id_stu, name, DOB, user, pass);

        // Kiểm tra nếu `new_bill_id` trùng với bất kỳ ID nào đã tồn tại trong danh sách 
        for (Student stu : list_stu) {
            if (new_id_stu.equals(stu.getId()) && !old_id_stu.equals(new_id_stu)) {
                request.setAttribute("mess_edit_stu", " id is deplicated!");
                request.getRequestDispatcher("student_management.jsp").forward(request, response);
                return;
            }
        }
        // Nếu không trùng ID, thực hiện cập nhật
        if (old_id_stu.equals(new_id_stu)) {
            // ID không thay đổi
            sDAO.updateStu(newStudent);
            request.setAttribute("mess_edit_stu", name + " bill is updated (ID not changed)");
        } else {
            // ID thay đổi
            sDAO.updateStu(newStudent, old_id_stu);
            request.setAttribute("mess_edit_stu", name + " bill is updated (ID changed)");
        }

        // Chuyển hướng đến trang quản lý
        request.getRequestDispatcher("student_management.jsp").forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
