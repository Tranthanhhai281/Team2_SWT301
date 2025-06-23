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
@WebServlet(name = "ProductServlet_JSP", urlPatterns = {"/ProductServlet_JSP"})
public class ProductServlet_JSP extends HttpServlet {

    private static final String sql = "SELECT * FROM [dbo].[tblProducts]";

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
        ProductDAO dao = new ProductDAO();
        String service = request.getParameter("service");
        if (service == null) {
            service = "listProduct";
        }
        if (service.equals("deleteProduct")) {
            int pId = Integer.parseInt(request.getParameter("productID"));
            int n = dao.deleteProduct(pId);
            response.sendRedirect("ProductServlet_JSP");
        }
        if (service.equals("updateProduct")) {
            String submit = request.getParameter("submit");
            if (submit==null) {
                int productID = Integer.parseInt(request.getParameter("productID"));
                Products product = dao.searchProduct(productID);
                CategoryDAO cateDao = new CategoryDAO();
                Vector<Categories> vector = cateDao.getAllCategory("SELECT *  FROM tblCategories");
                for (Categories c : vector) {
                    c.getCategoryID().equals(product.getCategoryID());
                }
                request.setAttribute("product", product);
                request.setAttribute("vector", vector);
                request.getRequestDispatcher("jsp/UpdateProduct.jsp").forward(request,response);
            }else{
                int productID = Integer.parseInt(request.getParameter("productID"));
                String productName = request.getParameter("productName"),
                image = request.getParameter("image");
                double price = Double.parseDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String categoryID = request.getParameter("categoryID");
                Date importDate = Date.valueOf(request.getParameter("importDate")),
                        usingDate = Date.valueOf(request.getParameter("usingDate"));
                int status = Integer.parseInt(request.getParameter("status"));
                Products p = new Products(productID,productName, image, price, quantity, categoryID, importDate, usingDate, status);
                dao.updateProduct(p);
//                Vector<Products> list = dao.getAllProduct(sql);
//                request.setAttribute("data", list);
//                request.setAttribute("pageTitle", "Product Manager");
//                request.setAttribute("tableTitle", "List of Product");
//
//                //select view
//                request.getRequestDispatcher("jsp/ProductJSP.jsp").forward(request, response);
//                request.getRequestDispatcher("ProductServlet_JSP?service=listProduct").forward(request, response);
             response.sendRedirect("ProductServlet_JSP?service=listProduct");
            }

        }
        if (service.equals("addProduct")) {
            String submit = request.getParameter("submit");
            if (submit == null) {//show form insert
                //Call Models
                CategoryDAO cateDao = new CategoryDAO();
                Vector<Categories> category = cateDao.getAllCategory("SELECT *  FROM tblCategories");

                //Set data for view
                request.setAttribute("category", category);
                //Select view
                request.setAttribute("pageTitle", "Insert Product");
                request.getRequestDispatcher("jsp/InsertProduct.jsp").forward(request, response);
            } else {//insert product to database
                String productName = request.getParameter("productName"),
                        image = request.getParameter("image");
                double price = Double.parseDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String categoryID = request.getParameter("categoryID");
                Date importDate = Date.valueOf(request.getParameter("importDate")),
                        usingDate = Date.valueOf(request.getParameter("usingDate"));
                int status = Integer.parseInt(request.getParameter("status"));
                Products p = new Products(productName, image, price, quantity, categoryID, importDate, usingDate, status);
                dao.insertProduct(p);
                Vector<Products> list = dao.getAllProduct(sql);
                request.setAttribute("data", list);
                request.setAttribute("pageTitle", "Product Manager");
                request.setAttribute("tableTitle", "List of Product");

                //select view
                request.getRequestDispatcher("jsp/ProductJSP.jsp").forward(request, response);
//                request.getRequestDispatcher("ProductServlet_JSP?service=listProduct").forward(request, response);
//             response.sendRedirect("ProductServlet_JSP?service=listProduct");
            }
        }
        if (service.equals("listProduct")) {
            //call model
            Vector<Products> list;
            String submit = request.getParameter("submit");
            String name = request.getParameter("productName");
            if (submit == null) {
                list = dao.getAllProduct(sql);
            } else {
                list = dao.getAllProduct("select *\n"
                        + "from tblProducts\n"
                        + "where productName like N'%" + name + "%'");
            }
            //set data for view
            request.setAttribute("data", list);
            request.setAttribute("pageTitle", "Product Manager");
            request.setAttribute("tableTitle", "List of Product");

            //select view
            RequestDispatcher dispath = request.getRequestDispatcher("jsp/ProductJSP.jsp");
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
