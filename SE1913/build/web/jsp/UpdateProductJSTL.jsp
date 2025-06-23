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
        <form action="ProductServlet_JSTL" method="POST">
            <table>
                <tr>
                    <td>productID</td>
                    <td><input type="text" name="productID" value="${product.getProductID()}" readonly=""></td>
                </tr>
                <tr>
                    <td>productName</td>
                    <td><input type="text" name="productName" value="${product.getProductName()}"></td>
                </tr>
                <tr>
                    <td>image</td>
                    <td><input type="text" name="image" value="${product.getImage()}"></td>
                </tr>
                <tr>
                    <td>price</td>
                    <td><input type="text" name="price" value="${product.getPrice()}"></td>
                </tr>
                <tr>
                    <td>quantity</td>
                    <td><input type="text" name="quantity" value="${product.getQuantity()}"></td>
                </tr>
                <tr>
                    <td>categoryID</td>
                    <td>
                        <select name="categoryID" >
                            <c:forEach var="ca" items="${vector}">
                            <option value="${ca.getCategoryID()}"${ca.getCategoryID().equals(product.getCategoryID())? "selected":""}>${ca.getCategoryName()}</option> 
                            </c:forEach>                          
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>importDate</td>
                    <td><input type="date" name="importDate" value="${product.getImportDate()}"></td>
                </tr>
                <tr>
                    <td>usingDate</td>
                    <td><input type="date" name="usingDate" value="${product.getUsingDate()}"></td>
                </tr>
                <tr>
                    <td>status</td>
                    <td>
                        <input type="radio" name="status" value="1" ${product.getStatus()==1?"checked":""}>Active
                        <input type="radio" name="status" value="0" ${product.getStatus()==0?"checked":""}>Deactive
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Update product"></td>
                    <td><input type="reset" value="Reset">
                        <input type="hidden" name="service" value="updateProduct">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
