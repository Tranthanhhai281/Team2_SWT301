<%-- 
    Document   : ProductJSP
    Created on : Feb 13, 2025, 8:51:14 AM
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
        <form action="OrderDetailServlet_JSP">
            <p>Search detail by id:
                <input type="text" name="detailID" value="${param.detailID}">
                       <input type="submit" name="submit" value="Search">
                       <button type="submit" name="service" value="listOrderDetail">Reset</button>
                       <input type="hidden" name="service" value="listOrderDetail">
                </p>
            </form>
            <p><a href="OrderDetailServlet_JSP?service=addOrderDetail">Insert new detail</a></p>
            <table border="1">
                <caption>${tableTitle}</caption>

            <tr>
                <th>detailID</th>
                
                <th>price</th>
                <th>quantity</th>
                <th>orderID</th>
                <th>productID</th>
                
                <th>update</th>
                <th>delete</th>
            </tr>

            <c:forEach var="od" items="${data}">
                <tr>
                    <td>${od.detailID}</td>
                    
                    
                    
                    <td>${od.price}</td>
                    
                    
                    <td>${od.quantity}</td>
                    
                    
                    <td>${od.orderID}</td>
                    <td>${od.productID}</td>
                    
                    <td><a href="OrderDetailServlet_JSP?service=updateOrderDetail&detailID=${od.getDetailID()}">update</a></td>
                    <td><a href="OrderDetailServlet_JSP?service=deleteOrderDetail&detailID=${od.getDetailID()}">delete</a></td>
                </tr>
            </c:forEach>

    </body>
</html>
