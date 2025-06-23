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
        <title>${JSP_Page}</title>
    </head>
    <body>
        <form action="ProductServlet_JSTL" method="POST">
            <table>
                <tr>
                    <td>productName</td>
                    <td><input type="text" name="productName"></td>
                </tr>
                <tr>
                    <td>image</td>
                    <td><input type="text" name="image"></td>
                </tr>
                <tr>
                    <td>price</td>
                    <td><input type="text" name="price"></td>
                </tr>
                <tr>
                    <td>quantity</td>
                    <td><input type="text" name="quantity"></td>
                </tr>
                <tr>
                    <td>categoryID</td>
                    <td>
                        <select name="categoryID">
                            <c:forEach var="ca" items="${category}">                            
                            <option value="${ca.getCategoryID()}">${ca.getCategoryName()}</option>                             
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>importDate</td>
                    <td><input type="date" name="importDate"></td>
                </tr>
                <tr>
                    <td>usingDate</td>
                    <td><input type="date" name="usingDate"></td>
                </tr>
                <tr>
                    <td>status</td>
                    <td>
                        <input type="radio" name="status" value="1">Active
                        <input type="radio" name="status" value="0">Deactive
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="add product"></td>
                    <td><input type="reset" value="Reset">
                        <input type="hidden" name="service" value="addProduct">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
