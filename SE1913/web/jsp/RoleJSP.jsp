<%-- 
    Document   : ProductJSP
    Created on : Feb 13, 2025, 8:51:14 AM
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
        <form action="RoleServlet_JSP">
            <p>Search Role by name:
                <input type="text" name="roleName" value="${param.roleName}">
                       <input type="submit" name="submit" value="Search">
                       <button type="submit" name="service" value="listRole">Reset</button>
                       <input type="hidden" name="service" value="listRole">
                </p>
            </form>
            <p><a href="RoleServlet_JSP?service=addRole">Insert new role</a></p>
            <table border="1">
                <caption>${tableTitle}</caption>

            <tr>
                <th>roleID</th>
                <th>roleName</th>
                
                <th>update</th>
                <th>delete</th>
            </tr>

            <c:forEach var="r" items="${data}">
                <tr>
                    <td>${r.roleID}</td>
                    <td>${r.roleName}</td>
                    
                    <td><a href="RoleServlet_JSP?service=updateRole&roleID=${r.getRoleID()}">update</a></td>
                    <td><a href="RoleServlet_JSP?service=deleteRole&roleID=${r.getRoleID()}">delete</a></td>
                </tr>
            </c:forEach>

    </body>
</html>
