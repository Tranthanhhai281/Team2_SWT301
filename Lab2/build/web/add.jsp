<%-- 
    Document   : add
    Created on : Jun 5, 2025, 5:28:59 PM
    Author     : TRAN ANH HAI
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a new category </title>
    </head>
    <body>
        <h1>Add new category</h1>
        <h3 style="color: red">${request.Scope.error}</h3>
        <form action="add" method="post">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" id="id" name="id"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" id="name" name="name"></td>
                </tr>
                <tr>
                    <td>Describe</td>
                    <td><input type="text" id="describe" name="describe"></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Save"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
