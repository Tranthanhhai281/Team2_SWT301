/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.Vector;
import model.Products;
import model.Users;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UserServlet", urlPatterns = {"/UserServletURL"})
public class UserServlet extends HttpServlet {

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
        UserDAO dao = new UserDAO();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String service = request.getParameter("service");
            if (service == null) {
                service = "listUser";
            }
            if (service.equals("deleteUser")) {
                String uId = request.getParameter("uId");
                dao.deleteUser(uId);
                response.sendRedirect("UserServletURL");
            }
            if (service.equals("addUser")) {
                try {
                    String userID = request.getParameter("userID"),
                            fullName = request.getParameter("fullName"),
                            password = request.getParameter("password");
                    
                    int roleID = Integer.parseInt(request.getParameter("roleID"));
                    String address = request.getParameter("address"),
                            phone = request.getParameter("phone"),
                            email = request.getParameter("email");
                    Boolean activate = request.getParameter("activate").equals("True");
                    
                    Users u = new Users(userID, fullName, password, roleID, address, phone, email, activate);
                    dao.insertUser(u);
                    response.sendRedirect("UserServletURL");
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }
            if (service.equals("listUser")) {

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet UserServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.print("<form action=\"UserServletURL\">\n"
                        + "            <p>Search by name:\n"
                        + "            <input type=\"text\" name=\"fullName\">\n"
                        + "            <input type=\"submit\" name=\"submit\" value=\"Search\">\n"
                        + "            <input type=\"reset\" value=\"Reset\">\n"
                        + "            <input type=\"hidden\" name=\"service\" value=\"listuser\">\n"
                        + "            </p>\n"
                        + "        </form>");
                out.println("<table border='1'>");
                out.println("<tr>");
                out.println("<th>userID</th>");
                out.println("<th>fullName</th>");
                out.println("<th>password</th>");
                out.println("<th>roleID</th>");
                out.println("<th>address</th>");
                out.println("<th>phone</th>");
                out.println("<th>email</th>");
                out.println("<th>activate</th>");
                
                out.println("<th>update</th>");
                out.println("<th>delete</th>");
                out.println("</tr>");
                Vector<Users> list;
                String submit = request.getParameter("submit");
                String name = request.getParameter("fullName");
                if (submit == null) {
                    list = dao.getAllUser(sql);
                } else {
                    list = dao.getAllUser("select *\n"
                            + "from tblUsers\n"
                            + "where fullName like '%"+name+"%'");
                }
                for (Users u : list) {
                    out.println("                    <tr>\n"
                            + "                        <td>" + u.getUserID() + "</td>\n"
                            + "                        <td>" + u.getFullName()+ "</td>\n"
                            + "                        <td>" + u.getPassword() + "</td>\n"
                            + "                        <td>" + u.getRoleID() + "</td>\n"
                            + "                        <td>" + u.getAddress() + "</td>\n"
                            + "                        <td>" + u.getPhone() + "</td>\n"
                            + "                        <td>" + u.getEmail() + "</td>\n"
                            + "                        <td>" + u.isActivate() + "</td>\n"
                            
                            + "                        <td>        <a href=\"UserServletURL?service=updateUser&uId="+u.getUserID()+"\">Update</a></td>\n"
                            + "                        <td>        <a href=\"UserServletURL?service=deleteUser&uId="+u.getUserID()+"\">Delete</a></td>\n"
                            + "                    </tr>");
                }
                out.println("</table>");
                out.println("</body>");
                out.println("</html>");
            }
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
