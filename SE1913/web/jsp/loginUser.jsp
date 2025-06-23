<%-- 
    Document   : loginUser
    Created on : Mar 4, 2025, 10:52:49 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String message = (String)request.getAttribute("message");
        if(message!=null){
        %>
        <p style="color:red"><%=message%></p>
        <%}%>
        <form action="UserServlet_JSP" method="POST">
            UserID: <input type="text" name="userID" required=""><br/><br/>
            Password: <input type="password" name="password" required=""><br/><br/>
            <input type="submit" name="submit" value="Login"/>
            <input type="reset" value="Reset"/>
            <input type="hidden" name="service" value="loginUser">
        </form>
    </body>
</html>
