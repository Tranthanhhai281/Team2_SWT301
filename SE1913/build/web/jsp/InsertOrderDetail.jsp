<%-- 
    Document   : InsertProduct
    Created on : Feb 18, 2025, 10:38:11 AM
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
                    <td>price</td>
                    <td><input type="text" name="price"></td>
                </tr>
                <tr>
                    <td>quantity</td>
                    <td><input type="text" name="quantity"></td>
                </tr>
                <tr>
                    <td>orderID</td>
                    <td>
                        <select name="orderID">
                            <c:forEach var="o" items="${order}">                            
                            <option>${o.getOrderID()}</option>                             
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>productID</td>
                    <td>
                        <select name="productID">
                            <c:forEach var="p" items="${product}">                            
                            <option value="${p.getProductID()}">${p.getProductName()}</option>                             
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                
                
                <tr>
                    <td><input type="submit" name="submit" value="add detail"></td>
                    <td><input type="reset" value="Reset">
                        <input type="hidden" name="service" value="addOrderDetail">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
