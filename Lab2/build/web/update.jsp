<%-- 
    Document   : update
    Created on : Jun 5, 2025, 5:29:31 PM
    Author     : TRAN ANH HAI
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Record</title>
    </head>
    <body>
        <h1>Update Information</h1>
        <c:set value="${requestScope.category}" var="c"/>
        <form action="update" method="post">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" id="id" readonly name="id" value="${c.id}"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" id="name" name="name" value="${c.name}"></td>
                </tr>
                <tr>
                    <td>Describe</td>
                    <td><input type="text" id="describe" name="describe" value="${c.describe}"></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Update"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
