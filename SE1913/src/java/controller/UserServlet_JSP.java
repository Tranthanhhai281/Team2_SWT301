/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import dal.RoleDAO;
import dal.UserDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.Vector;
import model.Categories;
import model.Products;
import model.Roles;
import model.Users;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UserServlet_JSP", urlPatterns = {"/UserServlet_JSP"})
public class UserServlet_JSP extends HttpServlet {

    private static final String sql = "SELECT * FROM [dbo].[tblUsers]";

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
        HttpSession session = request.getSession(true);
        UserDAO dao = new UserDAO();
        String service = request.getParameter("service");
        if (service == null) {
            service = "listUser";
        }
        if (service.equals("logoutUser")) {
            session.invalidate();
            response.sendRedirect("UserServlet_JSP");
        }
        if (service.equals("loginUser")) {
            String submit = request.getParameter("submit");
            if (submit==null) {
                request.getRequestDispatcher("jsp/loginUser.jsp").forward(request, response);
            }else{
                String userID = request.getParameter("userID");
                String password =request.getParameter("password");
                boolean check =dao.checkLogin(userID, password);
                if (check) {//insert user into session
                    session.setAttribute("userID", userID);
                    response.sendRedirect("UserServlet_JSP");
                }else{
                String message = "login failed";
                request.setAttribute("message", message);
                request.getRequestDispatcher("jsp/loginUser.jsp").forward(request, response);
            }
            }
        }
        if (service.equals("deleteUser")) {
            String uId = request.getParameter("userID");
            dao.deleteUser(uId);
            response.sendRedirect("UserServlet_JSP");
        }
        if (service.equals("updateUser")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                String userID = request.getParameter("userID");
                Users user = dao.searchUser(userID);
                RoleDAO rDao = new RoleDAO();
                Vector<Roles> vector = rDao.getAllRole("SELECT *  FROM tblRoles");
//                for (Roles c : vector) {
//                    c.getRoleID()==user.getRoleID();
//                }
                request.setAttribute("user", user);
                request.setAttribute("vector", vector);
                request.getRequestDispatcher("jsp/UpdateUser.jsp").forward(request, response);
            } else {

                String userID = request.getParameter("userID"),
                        fullName = request.getParameter("fullName"),
                        password = request.getParameter("password");

                int roleID = Integer.parseInt(request.getParameter("roleID"));
                String address = request.getParameter("address"),
                        phone = request.getParameter("phone"),
                        email = request.getParameter("email");

                boolean activate = request.getParameter("activate").equals("True");
                Users u = new Users(userID, fullName, password, roleID, address, phone, email, activate);
                dao.updateUser(u);
//                Vector<Products> list = dao.getAllProduct(sql);
//                request.setAttribute("data", list);
//                request.setAttribute("pageTitle", "Product Manager");
//                request.setAttribute("tableTitle", "List of Product");
//
//                //select view
//                request.getRequestDispatcher("jsp/ProductJSP.jsp").forward(request, response);
//                request.getRequestDispatcher("ProductServlet_JSP?service=listProduct").forward(request, response);
                response.sendRedirect("UserServlet_JSP?service=listUser");
            }

        }
        if (service.equals("addUser")) {
            String submit = request.getParameter("submit");
            if (submit == null) {//show form insert
                //Call Models
                RoleDAO rDao = new RoleDAO();
                Vector<Roles> role = rDao.getAllRole("SELECT *  FROM tblRoles");

                //Set data for view
                request.setAttribute("role", role);
                //Select view
                request.setAttribute("pageTitle", "Insert User");
                request.getRequestDispatcher("jsp/InsertUser.jsp").forward(request, response);
            } else {//insert product to database
                String userID = request.getParameter("userID"),
                        fullName = request.getParameter("fullName"),
                        password = request.getParameter("password");

                int roleID = Integer.parseInt(request.getParameter("roleID"));
                String address = request.getParameter("address"),
                        phone = request.getParameter("phone"),
                        email = request.getParameter("email");

                boolean activate = request.getParameter("activate").equals("True");
                Users u = new Users(userID, fullName, password, roleID, address, phone, email, activate);
                boolean success = dao.insertUser(u);
                if (!success) {
                    request.setAttribute("errorMsg", "id da ton tai");
                    RoleDAO rDao = new RoleDAO();
                    Vector<Roles> role = rDao.getAllRole("SELECT * FROM tblRoles");
                    request.setAttribute("role", role);
                    request.getRequestDispatcher("jsp/InsertUser.jsp").forward(request, response);
                } else {
                    Vector<Users> list = dao.getAllUser(sql);
                    request.setAttribute("data", list);
                    request.setAttribute("pageTitle", "User Manager");
                    request.setAttribute("tableTitle", "List of User");

                    //select view
                    request.getRequestDispatcher("jsp/UserJSP.jsp").forward(request, response);
                }
//                request.getRequestDispatcher("ProductServlet_JSP?service=listProduct").forward(request, response);
//             response.sendRedirect("ProductServlet_JSP?service=listProduct");
            }
        }
        if (service.equals("listUser")) {
            //call model
            Vector<Users> list;
            String submit = request.getParameter("submit");
            String name = request.getParameter("fullName");
            if (submit == null) {
                list = dao.getAllUser(sql);
            } else {
                list = dao.getAllUser("select *\n"
                        + "from tblUsers\n"
                        + "where fullName like N'%" + name + "%'");
            }
            //set data for view
            request.setAttribute("data", list);
            request.setAttribute("pageTitle", "User Manager");
            request.setAttribute("tableTitle", "List of User");

            //select view
            RequestDispatcher dispath = request.getRequestDispatcher("jsp/UserJSP.jsp");
            dispath.forward(request, response);

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
        processRequest(request, response);
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
