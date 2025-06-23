<%-- 
    Document   : InsertProduct
    Created on : Feb 18, 2025, 10:38:11 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, model.Products, model.Categories" %>
<!DOCTYPE html>
<html>
    <%//get data from controller
        Vector<Categories> category = (Vector<Categories>)request.getAttribute("category");
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
                    <td><input type="text" name="categoryID" required=""></td>
                </tr>
                <tr>
                    <td>categoryName</td>
                    <td><input type="text" name="categoryName" required=""></td>
                </tr>
                <tr>
                    <td>describe</td>
                    <td><input type="text" name="describe"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="add category"></td>
                    <td><input type="reset" value="Reset">
                        <input type="hidden" name="service" value="addCategory">
                    </td>
                </tr>
            </table>
            <% 
    String errorMsg = (String) request.getAttribute("errorMsg"); 
            %>

            <% if (errorMsg != null) { %>
            <p style="color: red;"><%= errorMsg %></p>
            <% } %>

        </form>
    </body>
</html>
