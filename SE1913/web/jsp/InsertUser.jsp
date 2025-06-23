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
        <form action="UserServlet_JSP" method="POST">
            <table>
                <tr>
                    <td>userID</td>
                    <td><input type="text" name="userID"></td>
                </tr>
                <tr>
                    <td>fullName</td>
                    <td><input type="text" name="fullName"></td>
                </tr>
                <tr>
                    <td>password</td>
                    <td><input type="text" name="password"></td>
                </tr>
                <tr>
                    <td>roleID</td>
                    <td>
                        <select name="roleID">
                            <c:forEach var="r" items="${role}">                            
                                <option value="${r.getRoleID()}">${r.getRoleName()}</option>                             
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>addresss</td>
                    <td><input type="text" name="address"></td>
                </tr>

                <tr>
                    <td>phone</td>
                    <td><input type="text" name="phone"></td>
                </tr>
                <tr>
                    <td>email</td>
                    <td><input type="text" name="email"></td>
                </tr>
                <tr>
                    <td>activate</td>
                    <td>
                        <input type="radio" name="activate" value="True">Active
                        <input type="radio" name="activate" value="False">Deactive
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="add user"></td>
                    <td><input type="reset" value="Reset">
                        <input type="hidden" name="service" value="addUser">
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
