/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import dal.OrderDetailDAO;
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
import model.OrderDetails;
import model.Orders;
import model.Products;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "OrderServlet", urlPatterns = {"/OrderServletURL"})
public class OrderServlet extends HttpServlet {

    private static final String sql = "SELECT * FROM [dbo].[tblOrders]";

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
        OrderDAO dao = new OrderDAO();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String service = request.getParameter("service");
            if (service == null) {
                service = "listOrder";
            }
            if (service.equals("deleteOrder")) {
                int oId = Integer.parseInt(request.getParameter("oId"));
                dao.deleteOrder(oId);
                response.sendRedirect("OrderServletURL");
            }
            if (service.equals("addOrder")) {
                try {
                    Date orderDate = Date.valueOf(request.getParameter("orderDate"));
                    double total = Double.parseDouble(request.getParameter("total"));
                    
                    String userID = request.getParameter("userID");
                           
                    Orders o = new Orders(orderDate, total, userID);
                    dao.insertOrder(o);
                    response.sendRedirect("OrderServletURL");
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }
            if (service.equals("listOrder")) {

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet OrderServlet</title>");
                out.println("</head>");
                out.println("<body>");
//                out.print("<form action=\"OrderServletURL\">\n"
//                        + "            <p>Search by order:\n"
//                        + "            <input type=\"text\" name=\"orderlID\">\n"
//                        + "            <input type=\"submit\" name=\"submit\" value=\"Search\">\n"
//                        + "            <input type=\"reset\" value=\"Reset\">\n"
//                        + "            <input type=\"hidden\" name=\"service\" value=\"listOrder\">\n"
//                        + "            </p>\n"
//                        + "        </form>");
                out.println("<table border='1'>");
                out.println("<tr>");
                out.println("<th>orderID</th>");
 
                out.println("<th>orderDate</th>");
                out.println("<th>total</th>");
                out.println("<th>userID</th>");
                
 
                out.println("<th>update</th>");
                out.println("<th>delete</th>");
                out.println("</tr>");
                Vector<Orders> list = dao.getAllOrder(sql);
//                String submit = request.getParameter("submit");
//                String odID = request.getParameter("orderID");
//                if (submit == null) {
//                    list = dao.getAllOrder(sql);
//                } else {
//                    list = dao.getAllOrder("select *\n"
//                            + "from tblProducts\n"
//                            + "where productName like '%"+odID+"%'");
//                }
                for (Orders o : list) {
                    out.println("                    <tr>\n"
                            + "                        <td>" + o.getOrderID() + "</td>\n"
                           
                            + "                        <td>" + o.getOrderDate() + "</td>\n"
                            + "                        <td>" + o.getTotal() + "</td>\n"
                            + "                        <td>" + o.getUserID()+ "</td>\n"
                            
                         
                            + "                        <td>        <a href=\"OrderDetailServletURL?service=updateOrderDetail&odId="+o.getOrderID()+"\">Update</a></td>\n"
                            + "                        <td>        <a href=\"OrderDetailServletURL?service=deleteOrderDetail&odId="+o.getOrderID()+"\">Delete</a></td>\n"
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
