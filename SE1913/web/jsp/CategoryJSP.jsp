<%-- 
    Document   : ProductJSP
    Created on : Feb 13, 2025, 8:51:14 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, model.Categories" %>
<!DOCTYPE html>
<html>
    <%//get data from servlet(controller)
        Vector<Categories> list = (Vector<Categories>)request.getAttribute("data");
        String pageTitle = (String)request.getAttribute("pageTitle");
        String tableTitle = (String)request.getAttribute("tableTitle"); 
        String search = request.getParameter("categoryName");
        if(search==null){
            search="";
        }        
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=pageTitle%></title>
    </head>
    <body>
        <form action="CategoryServlet_JSP">
            <p>Search Category by name:
                <input type="text" name="categoryName" value="<%=search%>">
                <input type="submit" name="submit" value="Search">
                <input type="reset" value="Reset">
                <input type="hidden" name="service" value="listCategory">
            </p>
        </form>
        <p><a href="CategoryServlet_JSP?service=addCategory">Insert new category</a></p>
        <table border="1">
            <caption><%=tableTitle%></caption>

            <tr>
                <th>categoryID</th>
                <th>categoryName</th>
                <th>describe</th>
                <th>update</th>
                <th>delete</th>
            </tr>
            <%for (Categories c : list) {%>
            <tr>
                <td><%=c.getCategoryID()%></td>
                <td><%=c.getCategoryName()%></td>
                <td><%=c.getDescribe()%></td>
                <td><a href="CategoryServlet_JSP?service=updateCategory&categoryID=<%=c.getCategoryID()%>">update</a></td>
                <td>
    <a href="CategoryServlet_JSP?service=deleteCategory&categoryID=<%=c.getCategoryID()%>"
       onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">Delete</a>
</td>

            </tr>
            <%}%>
        </table>
<!--            <h2> 
                <% if (list != null && !list.isEmpty()) { %>
                <%= list.get(0).getCategoryName() %>
                <% } %>
            </h2>-->
            

    </body>
</html>
