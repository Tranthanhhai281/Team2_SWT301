/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
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

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CategoryServlet", urlPatterns = {"/CategoryServletURL"})
public class CategoryServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String service = request.getParameter("service");
            if (service == null) {
                service = "listCategory";
            }
            if (service.equals("deleteCategory")) {
                String cId = request.getParameter("cId");
                dao.deleteCategory(cId);
                response.sendRedirect("CategoryServletURL");
            }
            if (service.equals("addCategory")) {
                try {
                    String categoryID = request.getParameter("categoryID"),
                           categoryName = request.getParameter("categoryName"),
                           describe = request.getParameter("describe") ;
                    Categories c = new Categories(categoryID, categoryName, describe);
                    dao.insertCategory(c);
                    response.sendRedirect("CategoryServletURL");
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }
            
            if (service.equals("listCategory")) {

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet CategoryServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.print("<form action=\"CategoryServletURL\">\n"
                        + "            <p>Search by name:\n"
                        + "            <input type=\"text\" name=\"categoryName\">\n"
                        + "            <input type=\"submit\" name=\"submit\" value=\"Search\">\n"
                        + "            <input type=\"reset\" value=\"Reset\">\n"
                        + "            <input type=\"hidden\" name=\"service\" value=\"listCategory\">\n"
                        + "            </p>\n"
                        + "        </form>");
                out.println("<table border='1'>");
                out.println("<tr>");
                out.println("<th>categoryID</th>");
                out.println("<th>categoryName</th>");
                out.println("<th>describe</th>");        
                out.println("<th>update</th>");
                out.println("<th>delete</th>");
                out.println("</tr>");
                Vector<Categories> list;
                String submit = request.getParameter("submit");
                String name = request.getParameter("categoryName");
                if (submit == null) {
                    list = dao.getAllCategory(sql);
                } else {
                    list = dao.getAllCategory("select *\n"
                            + "from tblCategories\n"
                            + "where categoryName like '%"+name+"%'");
                }
                for (Categories c : list) {
                    out.println("                    <tr>\n"
                            + "                        <td>" + c.getCategoryID() + "</td>\n"
                            + "                        <td>" + c.getCategoryName() + "</td>\n"
                            + "                        <td>" + c.getDescribe()+ "</td>\n"
                            + "                        <td><a href=\"CategoryServletURL?service=updateCategory&cId="+c.getCategoryID()+"\">Update</a></td>\n"
                            + "                        <td><a href=\"CategoryServletURL?service=deleteCategory&cId="+c.getCategoryID()+"\">Delete</a></td>\n"
                            + "                    </tr>");
                }
                out.println("</table>");
                out.println("</body>");
                out.println("</html>");
            }
        }
    }
public static int gcd(int a, int b) {
        while (b != 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
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
