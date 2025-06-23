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
        <form action="OrderServlet_JSP">
            <p>Search Order by userID:
                <input type="text" name="orderID" value="${param.orderID}">
                       <input type="submit" name="submit" value="Search">
                       <button type="submit" name="service" value="listOrder">Reset</button>
                       <input type="hidden" name="service" value="listOrder">
                </p>
            </form>
            <p><a href="OrderServlet_JSP?service=addOrder">Insert new order</a></p>
            <table border="1">
                <caption>${tableTitle}</caption>

            <tr>
                <th>orderID</th>
                <th>orderDate</th>
                <th>total</th>
                <th>userID</th>
                
                <th>update</th>
                <th>delete</th>
            </tr>

            <c:forEach var="o" items="${data}">
                <tr>
                    <td>${o.orderID}</td>
                    <td>${o.orderDate}</td>
                    <td>${o.total}</td>
                    
                    
                    <td>${o.userID}</td>
                    
                    
                    
                    <td><a href="OrderServlet_JSP?service=updateOrder&orderID=${o.orderID}">update</a></td>
                    <td><a href="OrderServlet_JSP?service=deleteOrder&orderID=${o.orderID}">delete</a></td>
                </tr>
            </c:forEach>

    </body>
</html>
