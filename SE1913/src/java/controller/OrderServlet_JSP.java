/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import dal.UserDAO;
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
import model.Orders;
import model.Products;
import model.Users;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "OrderServlet_JSP", urlPatterns = {"/OrderServlet_JSP"})
public class OrderServlet_JSP extends HttpServlet {

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
        String service = request.getParameter("service");
        if (service == null) {
            service = "listOrder";
        }
        if (service.equals("deleteOrder")) {
            int oId = Integer.parseInt(request.getParameter("orderID"));
            dao.deleteOrder(oId);
            response.sendRedirect("OrderServlet_JSP");
        }
        if (service.equals("updateOrder")) {
            String submit = request.getParameter("submit");
            if (submit==null) {
                int orderID = Integer.parseInt(request.getParameter("orderID"));
                Orders order = dao.searchOrder(orderID);
                UserDAO userDao = new UserDAO();
                Vector<Users> vector = userDao.getAllUser("SELECT *  FROM tblUsers");
//                for (Categories c : vector) {
//                    c.getCategoryID().equals(product.getCategoryID());
//                }
                request.setAttribute("order", order);
                request.setAttribute("vector", vector);
                request.getRequestDispatcher("jsp/UpdateOrder.jsp").forward(request,response);
            }else{
                int orderID = Integer.parseInt(request.getParameter("orderID"));
                Date orderDate = Date.valueOf(request.getParameter("orderDate"));
                double total = Double.parseDouble(request.getParameter("total"));
                
                String userID = request.getParameter("userID");
                
                
                Orders o = new Orders(orderID, orderDate, total, userID);
                dao.updateOrder(o);
//                Vector<Products> list = dao.getAllProduct(sql);
//                request.setAttribute("data", list);
//                request.setAttribute("pageTitle", "Product Manager");
//                request.setAttribute("tableTitle", "List of Product");
//
//                //select view
//                request.getRequestDispatcher("jsp/ProductJSP.jsp").forward(request, response);
//                request.getRequestDispatcher("ProductServlet_JSP?service=listProduct").forward(request, response);
             response.sendRedirect("OrderServlet_JSP?service=listOrder");
            }

        }
        if (service.equals("addOrder")) {
            String submit = request.getParameter("submit");
            if (submit == null) {//show form insert
                //Call Models
                UserDAO userDao = new UserDAO();
                Vector<Users> user = userDao.getAllUser("SELECT *  FROM tblUsers");

                //Set data for view
                request.setAttribute("user", user);
                //Select view
                request.setAttribute("pageTitle", "Insert Order");
                request.getRequestDispatcher("jsp/InsertOrder.jsp").forward(request, response);
            } else {//insert product to database
                Date orderDate = Date.valueOf(request.getParameter("orderDate"));
//                double total = Double.parseDouble(request.getParameter("total"));
                
                String userID = request.getParameter("userID");
                
                
                Orders o = new Orders(orderDate, 0, userID);
                dao.insertOrder(o);
                Vector<Orders> list = dao.getAllOrder(sql);
                request.setAttribute("data", list);
                request.setAttribute("pageTitle", "Order Manager");
                request.setAttribute("tableTitle", "List of Order");

                //select view
                request.getRequestDispatcher("jsp/OrderJSP.jsp").forward(request, response);
//                request.getRequestDispatcher("ProductServlet_JSP?service=listProduct").forward(request, response);
//             response.sendRedirect("ProductServlet_JSP?service=listProduct");
            }
        }
        if (service.equals("listOrder")) {
            //call model
            Vector<Orders> list;
            String submit = request.getParameter("submit");
            String order = request.getParameter("orderID");
            int id=-1;
            if (order !=null&&!order.isEmpty()) {
                try {
                    id = Integer.parseInt(order);
                } catch (Exception e) {
                    
                }
            }
            if (submit == null) {
                list = dao.getAllOrder(sql);
            } else {
                list = dao.getAllOrder("select *\n"
                        + "from tblOrders\n"
                        + "where orderID = " + id);
            }
            //set data for view
            request.setAttribute("data", list);
            request.setAttribute("pageTitle", "Order Manager");
            request.setAttribute("tableTitle", "List of Order");

            //select view
            RequestDispatcher dispath = request.getRequestDispatcher("jsp/OrderJSP.jsp");
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
