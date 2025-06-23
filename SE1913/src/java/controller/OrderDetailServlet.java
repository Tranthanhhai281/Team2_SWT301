/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
import model.Products;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "OrderDetailServlet", urlPatterns = {"/OrderDetailServletURL"})
public class OrderDetailServlet extends HttpServlet {

    private static final String sql = "SELECT * FROM [dbo].[tblOrderDetails]";

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
        OrderDetailDAO dao = new OrderDetailDAO();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String service = request.getParameter("service");
            if (service == null) {
                service = "listOrderDetail";
            }
            if (service.equals("deleteOrderDetail")) {
                int odId = Integer.parseInt(request.getParameter("odId"));
                dao.deleteOrderDetail(odId);
                response.sendRedirect("OrderDetailServletURL");
            }
            if (service.equals("addOrderDetail")) {
                try {
                    double price = Double.parseDouble(request.getParameter("price"));
                    int quantity = Integer.parseInt(request.getParameter("quantity")),
                            orderID = Integer.parseInt(request.getParameter("orderID")),
                            productID = Integer.parseInt(request.getParameter("productID"));
                    OrderDetails od = new OrderDetails(orderID, price, quantity, orderID, productID);
                    dao.insertOrderDetail(od);
                    response.sendRedirect("OrderDetailServletURL");
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }
            if (service.equals("listOrderDetail")) {

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet OrderDetailServlet</title>");
                out.println("</head>");
                out.println("<body>");
//                out.print("<form action=\"OrderDetailServletURL\">\n"
//                        + "            <p>Search by detail:\n"
//                        + "            <input type=\"text\" name=\"detailID\">\n"
//                        + "            <input type=\"submit\" name=\"submit\" value=\"Search\">\n"
//                        + "            <input type=\"reset\" value=\"Reset\">\n"
//                        + "            <input type=\"hidden\" name=\"service\" value=\"listOrderDetail\">\n"
//                        + "            </p>\n"
//                        + "        </form>");
                out.println("<table border='1'>");
                out.println("<tr>");
                out.println("<th>detailID</th>");
 
                out.println("<th>price</th>");
                out.println("<th>quantity</th>");
                out.println("<th>orderID</th>");
                out.println("<th>productID</th>");
 
                out.println("<th>update</th>");
                out.println("<th>delete</th>");
                out.println("</tr>");
                Vector<OrderDetails> list = dao.getAllOrderDetail(sql);;
//                String submit = request.getParameter("submit");
//                String odID = request.getParameter("detailID");
//                if (submit == null) {
//                    list = dao.getAllOrderDetail(sql);
//                } else {
//                    list = dao.getAllOrderDetail("select *\n"
//                            + "from tblProducts\n"
//                            + "where productName like '%"+odID+"%'");
//                }
                for (OrderDetails od : list) {
                    out.println("                    <tr>\n"
                            + "                        <td>" + od.getDetailID() + "</td>\n"
                           
                            + "                        <td>" + od.getPrice() + "</td>\n"
                            + "                        <td>" + od.getQuantity() + "</td>\n"
                            + "                        <td>" + od.getOrderID()+ "</td>\n"
                            + "                        <td>" + od.getProductID() + "</td>\n"
                         
                            + "                        <td>        <a href=\"OrderDetailServletURL?service=updateOrderDetail&odId="+od.getDetailID()+"\">Update</a></td>\n"
                            + "                        <td>        <a href=\"OrderDetailServletURL?service=deleteOrderDetail&odId="+od.getDetailID()+"\">Delete</a></td>\n"
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
