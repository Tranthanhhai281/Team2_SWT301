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
        <form action="OrderServlet_JSP" method="POST">
            <table>
                <tr>
                    <td>orderDate</td>
                    <td><input type="date" name="orderDate"></td>
                </tr>
<!--                <tr>
                    <td>total</td>
                    <td><input type="text" name="total"></td>
                </tr>-->
                
                <tr>
                    <td>userID</td>
                    <td>
                        <select name="userID">
                            <c:forEach var="u" items="${user}">                            
                                <option value="${u.userID}">${u.userID}</option>                             
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                
                
                <tr>
                    <td><input type="submit" name="submit" value="add order"></td>
                    <td><input type="reset" value="Reset">
                        <input type="hidden" name="service" value="addOrder">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
