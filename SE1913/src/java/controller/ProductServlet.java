/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
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

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/ProductServletURL"})
public class ProductServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String service = request.getParameter("service");
            if (service == null) {
                service = "listProduct";
            }
            if (service.equals("deleteProduct")) {
                int pId = Integer.parseInt(request.getParameter("pId"));
                int n = dao.deleteProduct(pId);
                response.sendRedirect("ProductServletURL");
            }
            if (service.equals("addProduct")) {
                try {
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
                    response.sendRedirect("ProductServletURL");
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }
            if (service.equals("listProduct")) {

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet ProductServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.print("<form action=\"ProductServletURL\">\n"
                        + "            <p>Search by name:\n"
                        + "            <input type=\"text\" name=\"productName\">\n"
                        + "            <input type=\"submit\" name=\"submit\" value=\"Search\">\n"
                        + "            <input type=\"reset\" value=\"Reset\">\n"
                        + "            <input type=\"hidden\" name=\"service\" value=\"listProduct\">\n"
                        + "            </p>\n"
                        + "        </form>");
                out.println("<table border='1'>");
                out.println("<tr>");
                out.println("<th>productID</th>");
                out.println("<th>productName</th>");
                out.println("<th>image</th>");
                out.println("<th>price</th>");
                out.println("<th>quantity</th>");
                out.println("<th>categoryID</th>");
                out.println("<th>importDate</th>");
                out.println("<th>usingDate</th>");
                out.println("<th>status</th>");
                out.println("<th>update</th>");
                out.println("<th>delete</th>");
                out.println("</tr>");
                Vector<Products> list;
                String submit = request.getParameter("submit");
                String name = request.getParameter("productName");
                if (submit == null) {
                    list = dao.getAllProduct(sql);
                } else {
                    list = dao.getAllProduct("select *\n"
                            + "from tblProducts\n"
                            + "where productName like '%"+name+"%'");
                }
                for (Products products : list) {
                    out.println("                    <tr>\n"
                            + "                        <td>" + products.getProductID() + "</td>\n"
                            + "                        <td>" + products.getProductName() + "</td>\n"
                            + "                        <td>" + products.getImage() + "</td>\n"
                            + "                        <td>" + products.getPrice() + "</td>\n"
                            + "                        <td>" + products.getQuantity() + "</td>\n"
                            + "                        <td>" + products.getCategoryID() + "</td>\n"
                            + "                        <td>" + products.getImportDate() + "</td>\n"
                            + "                        <td>" + products.getUsingDate() + "</td>\n"
                            + "                        <td>" + products.getStatus() + "</td>\n"
                            + "                        <td>        <a href=\"ProductServletURL?service=updateProduct&pId="+products.getProductID()+"\">Update</a></td>\n"
                            + "                        <td>        <a href=\"ProductServletURL?service=deleteProduct&pId="+products.getProductID()+"\">Delete</a></td>\n"
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
