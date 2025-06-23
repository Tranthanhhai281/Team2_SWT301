/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import dal.RoleDAO;
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
import model.Roles;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "RoleServlet", urlPatterns = {"/RoleServletURL"})
public class RoleServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String service = request.getParameter("service");
            if (service == null) {
                service = "listRole";
            }
            if (service.equals("deleteRole")) {
                int rId = Integer.parseInt(request.getParameter("roleID"));
                dao.deleteRole(rId);
                response.sendRedirect("RoleServletURL");
            }
            if (service.equals("addRole")) {
                try {
                    int roleID = Integer.parseInt(request.getParameter("roleID"));
                    String roleName = request.getParameter("roleName");
                            
                    Roles r = new Roles(roleID, roleName);
                    dao.insertRole(r);
                    response.sendRedirect("RoleServletURL");
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }
            if (service.equals("listRole")) {

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet RoleServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.print("<form action=\"RoleServletURL\">\n"
                        + "            <p>Search by name:\n"
                        + "            <input type=\"text\" name=\"roleName\">\n"
                        + "            <input type=\"submit\" name=\"submit\" value=\"Search\">\n"
                        + "            <input type=\"reset\" value=\"Reset\">\n"
                        + "            <input type=\"hidden\" name=\"service\" value=\"listRole\">\n"
                        + "            </p>\n"
                        + "        </form>");
                out.println("<table border='1'>");
                out.println("<tr>");
                out.println("<th>roleID</th>");
                out.println("<th>roleName</th>");
                
                out.println("<th>update</th>");
                out.println("<th>delete</th>");
                out.println("</tr>");
                Vector<Roles> list;
                String submit = request.getParameter("submit");
                String name = request.getParameter("roleName");
                if (submit == null) {
                    list = dao.getAllRole(sql);
                } else {
                    list = dao.getAllRole("select *\n"
                            + "from tblRoles\n"
                            + "where roleName like '%"+name+"%'");
                }
                for (Roles r : list) {
                    out.println("                    <tr>\n"
                            + "                        <td>" + r.getRoleID() + "</td>\n"
                            + "                        <td>" + r.getRoleName() + "</td>\n"
                            
                            + "                        <td>        <a href=\"RoleServletURL?service=updateRole&rId="+r.getRoleID()+"\">Update</a></td>\n"
                            + "                        <td>        <a href=\"RoleServletURL?service=deleteRole&rId="+r.getRoleID()+"\">Delete</a></td>\n"
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
