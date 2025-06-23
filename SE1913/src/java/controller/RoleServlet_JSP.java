/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import dal.RoleDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.Vector;
import model.Categories;
import model.Products;
import model.Roles;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "RoleServlet_JSP", urlPatterns = {"/RoleServlet_JSP"})
public class RoleServlet_JSP extends HttpServlet {

    private static final String sql = "SELECT * FROM [dbo].[tblRoles]";

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
        RoleDAO dao = new RoleDAO();
        String service = request.getParameter("service");
        if (service == null) {
            service = "listRole";
        }
        if (service.equals("deleteRole")) {
            int rId = Integer.parseInt(request.getParameter("roleID"));
            dao.deleteRole(rId);
            response.sendRedirect("RoleServlet_JSP");
        }
        if (service.equals("updateRole")) {
            String submit = request.getParameter("submit");
            if (submit==null) {
                int roleID = Integer.parseInt(request.getParameter("roleID"));
                Roles role = dao.searchRole(roleID);
//                CategoryDAO cateDao = new CategoryDAO();
//                Vector<Categories> vector = cateDao.getAllCategory("SELECT *  FROM tblCategories");
//                for (Categories c : vector) {
//                    c.getCategoryID().equals(product.getCategoryID());
//                }
                request.setAttribute("role", role);
//                request.setAttribute("vector", vector);
                request.getRequestDispatcher("jsp/UpdateRole.jsp").forward(request,response);
            }else{
                int roleID = Integer.parseInt(request.getParameter("roleID"));
                String roleName = request.getParameter("roleName");
                
                Roles r = new Roles(roleID, roleName);
                dao.updateRole(r);
//                Vector<Products> list = dao.getAllProduct(sql);
//                request.setAttribute("data", list);
//                request.setAttribute("pageTitle", "Product Manager");
//                request.setAttribute("tableTitle", "List of Product");
//
//                //select view
//                request.getRequestDispatcher("jsp/ProductJSP.jsp").forward(request, response);
//                request.getRequestDispatcher("ProductServlet_JSP?service=listProduct").forward(request, response);
             response.sendRedirect("RoleServlet_JSP?service=listRole");
            }

        }
        if (service.equals("addRole")) {
            String submit = request.getParameter("submit");
            if (submit == null) {//show form insert
                //Call Models
//                CategoryDAO cateDao = new CategoryDAO();
//                Vector<Categories> category = cateDao.getAllCategory("SELECT *  FROM tblCategories");
//
//                //Set data for view
//                request.setAttribute("category", category);
                //Select view
                request.getRequestDispatcher("jsp/InsertRole.jsp").forward(request, response);
            } else {//insert product to database
                String RoleName = request.getParameter("roleName");
                        
                Roles r = new Roles( RoleName);
                dao.insertRole(r);
                Vector<Roles> list = dao.getAllRole(sql);
                request.setAttribute("data", list);
                request.setAttribute("pageTitle", "Role Manager");
                request.setAttribute("tableTitle", "List of Role");

                //select view
                request.getRequestDispatcher("jsp/RoleJSP.jsp").forward(request, response);
//                request.getRequestDispatcher("ProductServlet_JSP?service=listProduct").forward(request, response);
//             response.sendRedirect("ProductServlet_JSP?service=listProduct");
            }
        }
        if (service.equals("listRole")) {
            //call model
            Vector<Roles> list;
            String submit = request.getParameter("submit");
            String name = request.getParameter("roleName");
            if (submit == null) {
                list = dao.getAllRole(sql);
            } else {
                list = dao.getAllRole("select *\n"
                        + "from tblRoles\n"
                        + "where RoleName like N'%" + name + "%'");
            }
            //set data for view
            request.setAttribute("data", list);
            request.setAttribute("pageTitle", "Role Manager");
            request.setAttribute("tableTitle", "List of Role");

            //select view
            RequestDispatcher dispath = request.getRequestDispatcher("jsp/RoleJSP.jsp");
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
