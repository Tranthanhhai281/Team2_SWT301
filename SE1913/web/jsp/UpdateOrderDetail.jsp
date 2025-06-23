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
        <form action="OrderDetailServlet_JSP" method="POST">
            <table>
                <tr>
                    <td>detailID</td>
                    <td><input type="text" name="detailID" value="${detail.getDetailID()}" readonly=""></td>
                </tr>
                
                
                <tr>
                    <td>price</td>
                    <td><input type="text" name="price" value="${detail.getPrice()}"></td>
                </tr>
                <tr>
                    <td>quantity</td>
                    <td><input type="text" name="quantity" value="${detail.getQuantity()}"></td>
                </tr>
                <tr>
                    <td>orderID</td>
                    <td>
                        <select name="orderID" >
                            <c:forEach var="o" items="${vectorO}">
                            <option value="${o.getOrderID()}"${o.getOrderID()==(detail.getOrderID())? "selected":""}>${o.getOrderID()}</option> 
                            </c:forEach>                          
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>productID</td>
                    <td>
                        <select name="productID" >
                            <c:forEach var="p" items="${vectorP}">
                            <option value="${p.getProductID()}"${p.getProductID().equals(detail.getProductID())? "selected":""}>${p.getProductName()}</option> 
                            </c:forEach>                          
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td><input type="submit" name="submit" value="Update detail"></td>
                    <td><input type="reset" value="Reset">
                        <input type="hidden" name="service" value="updateOrderDetail">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
