/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
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

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CategoryServlet_JSP", urlPatterns = {"/CategoryServlet_JSP"})
public class CategoryServlet_JSP extends HttpServlet {

    private static final String sql = "SELECT * FROM [dbo].[tblCategories]";

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
        CategoryDAO dao = new CategoryDAO();
        String service = request.getParameter("service");
        if (service == null) {
            service = "listCategory";
        }
        if (service.equals("getCategory")) {
            String categoryID = request.getParameter("categoryID");
            Categories category = dao.searchCategory(categoryID); // Hàm tìm Category theo ID
            request.setAttribute("selectedCategory", category);

            Vector<Categories> list = dao.getAllCategory(sql);
            request.setAttribute("data", list);

            request.getRequestDispatcher("jsp/CategoryJSP.jsp").forward(request, response);
        }

        if (service.equals("deleteCategory")) {
            String cId = request.getParameter("categoryID");
            dao.deleteCategory(cId);
            response.sendRedirect("CategoryServlet_JSP");
        }
        if (service.equals("updateCategory")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                String categoryID = request.getParameter("categoryID");
                Categories category = dao.searchCategory(categoryID);
//                CategoryDAO cateDao = new CategoryDAO();
//                Vector<Categories> vector = cateDao.getAllCategory("SELECT *  FROM tblCategories");
//                for (Categories c : vector) {
//                    c.getCategoryID().equals(product.getCategoryID());
//                }
                request.setAttribute("category", category);
//                request.setAttribute("vector", vector);
                request.getRequestDispatcher("jsp/UpdateCategory.jsp").forward(request, response);
            } else {

                String categoryID = request.getParameter("categoryID"),
                        categoryName = request.getParameter("categoryName"),
                        describe = request.getParameter("describe");
// Kiểm tra categoryName
if (categoryName == null || categoryName.trim().isEmpty()) {
    request.setAttribute("errorMsg", "categoryName phải từ 1 đến 255 ký tự.");
    Categories c = dao.searchCategory(categoryID);
    request.setAttribute("category", c);
    request.getRequestDispatcher("jsp/UpdateCategory.jsp").forward(request, response);
    return;
}

// Kiểm tra describe (nếu có)
if (describe != null && describe.length() > 255) {
    request.setAttribute("errorMsg", "describe không được quá 255 ký tự.");
    Categories c = dao.searchCategory(categoryID);
    request.setAttribute("category", c);
    request.getRequestDispatcher("jsp/UpdateCategory.jsp").forward(request, response);
    return;
}
                Categories c = new Categories(categoryID, categoryName, describe);
                dao.updateCategory(c);
//                Vector<Products> list = dao.getAllProduct(sql);
//                request.setAttribute("data", list);
//                request.setAttribute("pageTitle", "Product Manager");
//                request.setAttribute("tableTitle", "List of Product");
//
//                //select view
//                request.getRequestDispatcher("jsp/ProductJSP.jsp").forward(request, response);
//                request.getRequestDispatcher("ProductServlet_JSP?service=listProduct").forward(request, response);
                response.sendRedirect("CategoryServlet_JSP?service=listCategory");
            }

        }
        if (service.equals("addCategory")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                // show form insert
                CategoryDAO cateDao = new CategoryDAO();
                Vector<Categories> category = cateDao.getAllCategory("SELECT *  FROM tblCategories");
                request.setAttribute("category", category);
                request.getRequestDispatcher("jsp/InsertCategory.jsp").forward(request, response);
            } else {
                String categoryID = request.getParameter("categoryID"),
                        categoryName = request.getParameter("categoryName"),
                        describe = request.getParameter("describe");

                // ⚠️ Kiểm tra độ dài categoryID
                if (categoryID == null || categoryID.trim().isEmpty()) {
                    request.setAttribute("errorMsg", "categoryID là bắt buộc.");
                    request.getRequestDispatcher("jsp/InsertCategory.jsp").forward(request, response);
                    return;
                }

//                if (categoryID.length() > 10) {
//                    request.setAttribute("errorMsg", "categoryID không được vượt quá 10 ký tự.");
//                    request.getRequestDispatcher("jsp/InsertCategory.jsp").forward(request, response);
//                    return;
//                }
//                if (categoryName != null && categoryName.length() > 255) {
//                    request.setAttribute("errorMsg", "categoryName không được vượt quá 255 ký tự.");
//                    request.getRequestDispatcher("jsp/InsertCategory.jsp").forward(request, response);
//                    return;
//                }

                if (describe != null && describe.length() > 255) {
                    request.setAttribute("errorMsg", "describe không được vượt quá 255 ký tự.");
                    request.getRequestDispatcher("jsp/InsertCategory.jsp").forward(request, response);
                    return;
                }
                Categories c = new Categories(categoryID, categoryName, describe);
                boolean success = dao.insertCategory(c);

                if (!success) {
                    request.setAttribute("errorMsg", "ID đã tồn tại.");
                    request.getRequestDispatcher("jsp/InsertCategory.jsp").forward(request, response);
                } else {
                    Vector<Categories> list = dao.getAllCategory(sql);
                    request.setAttribute("data", list);
                    request.setAttribute("pageTitle", "Category Manager");
                    request.setAttribute("tableTitle", "List of Category");
                    request.getRequestDispatcher("jsp/CategoryJSP.jsp").forward(request, response);
                }
            }
        }

        if (service.equals("listCategory")) {
            //call model
            Vector<Categories> list;
            String submit = request.getParameter("submit");
            String name = request.getParameter("categoryName");
            if (submit == null) {
                list = dao.getAllCategory(sql);
            } else {
                list = dao.getAllCategory("select *\n"
                        + "from tblCategories\n"
                        + "where categoryName like N'%" + name + "%'");
            }
            //set data for view
            request.setAttribute("data", list);
            request.setAttribute("pageTitle", "Category Manager");
            request.setAttribute("tableTitle", "List of Category");

            //select view
            RequestDispatcher dispath = request.getRequestDispatcher("jsp/CategoryJSP.jsp");
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
