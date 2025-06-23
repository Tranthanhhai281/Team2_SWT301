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
        <form action="ProductServlet_JSTL">
            <p>Search Product by name:
                <input type="text" name="productName" value="${not empty param.productName ? param.productName : ''}">
                       <input type="submit" name="submit" value="Search">
                       <button type="submit" name="service" value="listProduct">Reset</button>
                       <input type="hidden" name="service" value="listProduct">
                </p>
            </form>
            <p><a href="ProductServlet_JSTL?service=addProduct">Insert new products</a></p>
            <table border="1">
                <caption>${tableTitle}</caption>

            <tr>
                <th>productID</th>
                <th>productName</th>
                <th>image</th>
                <th>price</th>
                <th>quantity</th>
                <th>categoryID</th>
                <th>importDate</th>
                <th>usingDate</th>
                <th>status</th>
                <th>update</th>
                <th>delete</th>
            </tr>

            <c:forEach var="p" items="${data}">
                <tr>
                    <td>${p.productID}</td>
                    <td>${p.productName}</td>
                    <td>${p.image}</td>
                    
                    
                    <td>${p.price}</td>
                    
                    
                    <td>${p.quantity}</td>
                    
                    
                    <td>${p.categoryID}</td>
                    <td>${p.importDate}</td>
                    <td>${p.usingDate}</td>
                    <td>${p.status}</td>
                    <td><a href="ProductServlet_JSP?service=updateProduct&productID=${p.getProductID()}">update</a></td>
                    <td><a href="ProductServlet_JSP?service=deleteProduct&productID=${p.getProductID()}">delete</a></td>
                </tr>
            </c:forEach>

    </body>
</html>
