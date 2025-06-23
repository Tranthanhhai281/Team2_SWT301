/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
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
import model.OrderDetails;
import model.Orders;
import model.Products;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "OrderDetailServlet_JSP", urlPatterns = {"/OrderDetailServlet_JSP"})
public class OrderDetailServlet_JSP extends HttpServlet {

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
        String service = request.getParameter("service");
        if (service == null) {
            service = "listOrderDetail";
        }
        if (service.equals("deleteOrderDetail")) {
            int odId = Integer.parseInt(request.getParameter("detailID"));
            dao.deleteOrderDetail(odId);
            response.sendRedirect("OrderDetailServlet_JSP");
        }
        if (service.equals("updateOrderDetail")) {
            String submit = request.getParameter("submit");
            if (submit==null) {
                int detailID = Integer.parseInt(request.getParameter("detailID"));
                OrderDetails detail = dao.searchOrderDetail(detailID);
                OrderDAO orderDao = new OrderDAO();
                Vector<Orders> vectorO = orderDao.getAllOrder("SELECT *  FROM tblOrders");
                ProductDAO proDao = new ProductDAO();
                Vector<Products> vectorP = proDao.getAllProduct("SELECT *  FROM tblProducts");
//                for (Categories c : vector) {
//                    c.getCategoryID().equals(product.getCategoryID());
//                }
                request.setAttribute("detail", detail);
                request.setAttribute("vectorO", vectorO);
                request.setAttribute("vectorP", vectorP);
                request.getRequestDispatcher("jsp/UpdateOrderDetail.jsp").forward(request,response);
            }else{
                int detailID = Integer.parseInt(request.getParameter("detailID"));
                
                double price = Double.parseDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int orderID = Integer.parseInt(request.getParameter("orderID"));
                int productID = Integer.parseInt(request.getParameter("productID"));
                
                OrderDetails od = new OrderDetails(detailID, price, quantity, orderID, productID);
                dao.updateOrderDetail(od);
//                Vector<Products> list = dao.getAllProduct(sql);
//                request.setAttribute("data", list);
//                request.setAttribute("pageTitle", "Product Manager");
//                request.setAttribute("tableTitle", "List of Product");
//
//                //select view
//                request.getRequestDispatcher("jsp/ProductJSP.jsp").forward(request, response);
//                request.getRequestDispatcher("ProductServlet_JSP?service=listProduct").forward(request, response);
             response.sendRedirect("OrderDetailServlet_JSP?service=listOrderDetail");
            }

        }
        if (service.equals("addOrderDetail")) {
            String submit = request.getParameter("submit");
            if (submit == null) {//show form insert
                //Call Models
                OrderDAO orderDao = new OrderDAO();
                Vector<Orders> order = orderDao.getAllOrder("SELECT *  FROM tblOrders");
                ProductDAO proDao = new ProductDAO();
                Vector<Products> product = proDao.getAllProduct("SELECT *  FROM tblProducts");

                //Set data for view
                request.setAttribute("order", order);
                request.setAttribute("product", product);
                //Select view
                request.setAttribute("pageTitle", "Insert OrderDetail");
                request.getRequestDispatcher("jsp/InsertOrderDetail.jsp").forward(request, response);
            } else {//insert product to database
                
                double price = Double.parseDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int orderID = Integer.parseInt(request.getParameter("orderID"));
                int productID = Integer.parseInt(request.getParameter("productID"));
                
                OrderDetails od = new OrderDetails(price, quantity, orderID, productID);
                dao.insertOrderDetail(od);
                Vector<OrderDetails> list = dao.getAllOrderDetail(sql);
                request.setAttribute("data", list);
                request.setAttribute("pageTitle", "Detail Manager");
                request.setAttribute("tableTitle", "List of Detail");

                //select view
                request.getRequestDispatcher("jsp/OrderDetailJSP.jsp").forward(request, response);
//                request.getRequestDispatcher("ProductServlet_JSP?service=listProduct").forward(request, response);
//             response.sendRedirect("ProductServlet_JSP?service=listProduct");
            }
        }
        if (service.equals("listOrderDetail")) {
            //call model
            Vector<OrderDetails> list;
            String submit = request.getParameter("submit");
            String detail = request.getParameter("detailID");
            int id=-1;
            if (detail !=null&&!detail.isEmpty()) {
                try {
                    id = Integer.parseInt(detail);
                } catch (Exception e) {
                    
                }
            }
            if (submit == null) {
                list = dao.getAllOrderDetail(sql);
            } else {
                list = dao.getAllOrderDetail("select *\n"
                        + "from tblOrderDetails\n"
                        + "where detailID = " + id);
            }
            //set data for view
            request.setAttribute("data", list);
            request.setAttribute("pageTitle", "Detail Manager");
            request.setAttribute("tableTitle", "List of Detail");

            //select view
            RequestDispatcher dispath = request.getRequestDispatcher("jsp/OrderDetailJSP.jsp");
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
