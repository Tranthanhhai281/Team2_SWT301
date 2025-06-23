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
        <%
            String userID = (String)session.getAttribute("userID");
            if(userID==null){
        %>
        <p align="right"><a href="UserServlet_JSP?service=loginUser">login</a></p>
        <%}else{%>
        <p align="right">Welcome <%=userID%><a href="UserServlet_JSP?service=logoutUser"> logout</a></p>
        <%}%>
        <form action="UserServlet_JSP">
            <p>Search User by name:
                <input type="text" name="fullName" value="${param.fullName}">
                       <input type="submit" name="submit" value="Search">
                       <button type="submit" name="service" value="listUser">Reset</button>
                       <input type="hidden" name="service" value="listUser">
                </p>
            </form>
            <p><a href="UserServlet_JSP?service=addUser">Insert new user</a></p>
            <table border="1">
                <caption>${tableTitle}</caption>

            <tr>
                <th>userID</th>
                <th>fullName</th>
                <th>password</th>
                <th>roleID</th>
                <th>address</th>
                <th>phone</th>
                <th>email</th>
                <th>activate</th>
                
                <th>update</th>
                <th>delete</th>
            </tr>

            <c:forEach var="u" items="${data}">
                <tr>
                    <td>${u.userID}</td>
                    <td>${u.fullName}</td>
                    <td>******</td>
                    
                    
                    <td>${u.roleID}</td>
                    
                    
                    <td>${u.address}</td>
                    
                    
                    <td>${u.phone}</td>
                    <td>${u.email}</td>
                    <td>${u.activate}</td>
                    
                    <td><a href="UserServlet_JSP?service=updateUser&userID=${u.getUserID()}">update</a></td>
                    <td><a href="UserServlet_JSP?service=deleteUser&userID=${u.getUserID()}">delete</a></td>
                </tr>
            </c:forEach>

    </body>
</html>
