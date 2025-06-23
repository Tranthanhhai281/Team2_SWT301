<%-- 
    Document   : MyJSP
    Created on : Feb 13, 2025, 7:48:32 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, model.Products" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>JSP Script</p>
        <%//code java
        int MAX = 1000;//local variable
        out.print("<h1>MAX = "+MAX+"</h1>");
        %>
        <p>JSP Expression</p>
        <h1>double MAX = <%=MAX*2%></h1>
        <% for(int i = 20;i<MAX;i+=20){%>
        <hr width="<%=i%>"/>           
        <%}%>
        <p>JSP Declare</p>
        <%! int MIN = 1;//bien global
        String welcome(String name){
            return "Welcome "+name+"!";
        }
        %>
        <h2><%=welcome("Huan")%></h2>
        <h2>MIN = <%=MIN%></h2>
        <h2>MAX = <%=MAX%></h2>
        <h1>Hello World!</h1>
    </body>
</html>
