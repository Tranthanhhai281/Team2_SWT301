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
        <form action="RoleServlet_JSP" method="POST">
            <table>
                <tr>
                    <td>roleID</td>
                    <td><input type="text" name="roleID" value="${role.getRoleID()}" readonly=""></td>
                </tr>
                <tr>
                    <td>roleName</td>
                    <td><input type="text" name="roleName" value="${role.getRoleName()}"></td>
                </tr>
                
                <tr>
                    <td><input type="submit" name="submit" value="Update role"></td>
                    <td><input type="reset" value="Reset">
                        <input type="hidden" name="service" value="updateRole">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
