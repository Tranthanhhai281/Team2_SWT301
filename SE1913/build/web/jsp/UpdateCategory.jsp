<%-- 
    Document   : UpdateProduct
    Created on : Feb 20, 2025, 8:14:22 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, model.Products, model.Categories" %>

<!DOCTYPE html>
<html>
    <%
        Categories category = (Categories)request.getAttribute("category");
        Vector<Categories> vector = (Vector<Categories>)request.getAttribute("vector");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="CategoryServlet_JSP" method="POST">
            <table>
                <tr>
                    <td>categoryID</td>
                    <td><input type="text" name="categoryID" value="<%=category.getCategoryID()%>" readonly=""></td>
                </tr>
                <tr>
                    <td>categoryName</td>
                    <td><input type="text" name="categoryName" value="<%=category.getCategoryName()%>" ></td>
                </tr>
                <tr>
                    <td>describe</td>
                    <td><input type="text" name="describe" value="<%=category.getDescribe()%>"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Update category"></td>
                    <td><input type="reset" value="Reset">
                        <input type="hidden" name="service" value="updateCategory">
                    </td>
                </tr>
            </table>
        </form>
                <c:if test="${not empty errorMsg}">
    <p style="color:red;">${errorMsg}</p>
</c:if>

    </body>
</html>
