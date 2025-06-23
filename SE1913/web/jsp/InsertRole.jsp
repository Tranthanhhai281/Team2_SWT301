<%-- 
    Document   : InsertProduct
    Created on : Feb 18, 2025, 10:38:11 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, model.Products, model.Roles" %>

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
                    <td>roleName</td>
                    <td><input type="text" name="roleName"></td>
                </tr>
                
                <tr>
                    <td><input type="submit" name="submit" value="add role"></td>
                    <td><input type="reset" value="Reset">
                        <input type="hidden" name="service" value="addRole">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
