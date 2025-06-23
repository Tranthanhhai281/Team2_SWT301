<%-- 
    Document   : UpdateProduct
    Created on : Feb 20, 2025, 8:14:22 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${pageTitle}</title>
    </head>
    <body>
        <form action="OrderServlet_JSP" method="POST">
            <table>
                <tr>
                    <td>orderID</td>
                    <td><input type="text" name="orderID" value="${order.orderID}" readonly=""></td>
                </tr>
                <tr>
                    <td>orderDate</td>
                    <td><input type="date" name="orderDate" value="${order.getOrderDate()}"></td>
                </tr>
                <tr>
                    <td>total</td>
                    <td><input type="text" name="total" value="${order.getTotal()}" readonly=""></td>
                </tr>
                
                
                <tr>
                    <td>userID</td>
                    <td>
                        <select name="userID" >
                            <c:forEach var="u" items="${vector}">
                            <option value="${u.getUserID()}"${u.getUserID().equals(order.getUserID())? "selected":""}>${u.getFullName()}</option> 
                            </c:forEach>                          
                        </select>
                    </td>
                </tr>
                
                
                <tr>
                    <td><input type="submit" name="submit" value="Update order"></td>
                    <td><input type="reset" value="Reset">
                        <input type="hidden" name="service" value="updateOrder">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
