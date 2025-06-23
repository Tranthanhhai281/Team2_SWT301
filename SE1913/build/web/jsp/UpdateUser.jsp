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
        <form action="UserServlet_JSP" method="POST">
            <table>
                <tr>
                    <td>userID</td>
                    <td><input type="text" name="userID" value="${user.getUserID()}" readonly=""></td>
                </tr>
                <tr>
                    <td>fullName</td>
                    <td><input type="text" name="fullName" value="${user.getFullName()}"></td>
                </tr>
                <tr>
                    <td>password</td>
                    <td><input type="text" name="password" value="${user.getPassword()}"></td>
                </tr>
                <tr>
                    <td>roleID</td>
                    <td>
                        <select name="roleID" >
                            <c:forEach var="r" items="${vector}">
                            <option value="${r.roleID}"${r.roleID==user.roleID? "selected":""}>${r.roleName}</option> 
                            </c:forEach>                          
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>address</td>
                    <td><input type="text" name="address" value="${user.getAddress()}"></td>
                </tr>
                <tr>
                    <td>phone</td>
                    <td><input type="text" name="phone" value="${user.getPhone()}"></td>
                </tr>
                
                <tr>
                    <td>email</td>
                    <td><input type="text" name="email" value="${user.getEmail()}"></td>
                </tr>
               
                <tr>
                    <td>activate</td>
                    <td>
                        <input type="radio" name="activate" value="True" ${user.isActivate()?"checked":""}>Active
                        <input type="radio" name="activate" value="False" ${!user.isActivate()?"checked":""}>Deactive
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Update user"></td>
                    <td><input type="reset" value="Reset">
                        <input type="hidden" name="service" value="updateUser">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
