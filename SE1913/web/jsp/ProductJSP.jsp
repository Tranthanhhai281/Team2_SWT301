    <%-- 
    Document   : ProductJSP
    Created on : Feb 13, 2025, 8:51:14 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, model.Products" %>
<!DOCTYPE html>
<html>
    <%//get data from servlet(controller)
        Vector<Products> list = (Vector<Products>)request.getAttribute("data");
        String pageTitle = (String)request.getAttribute("pageTitle");
        String tableTitle = (String)request.getAttribute("tableTitle"); 
        String search = request.getParameter("productName");
        if(search==null){
            search="";
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=pageTitle%></title>
    </head>
    <body>
        <form action="ProductServlet_JSP">
            <p>Search Product by name:
                <input type="text" name="productName" value="<%=search%>">
                <input type="submit" name="submit" value="Search">
                <input type="reset" value="Reset">
                <input type="hidden" name="service" value="listProduct">
            </p>
        </form>
        <p><a href="ProductServlet_JSP?service=addProduct">Insert new products</a></p>
        <table border="1">
            <caption><%=tableTitle%></caption>

            <tr>
                <th>productID</th>
                <th>productName</th>
                <th>image</th>
                <th>price</th>
                <th>quantity</th>
                <th>categoryID</th>
                <th>importDate</th>
                <th>usingDate</th>
                <th>status</th>
                <th>update</th>
                <th>delete</th>
            </tr>
            <%for (Products products : list) {%>
            <tr>
                <td><%=products.getProductID()%></td>
                <td><%=products.getProductName()%></td>
                <td><%=products.getImage()%></td>
                <td><%=products.getPrice()%></td>
                <td><%=products.getQuantity()%></td>
                <td><%=products.getCategoryID()%></td>
                <td><%=products.getImportDate()%></td>
                <td><%=products.getUsingDate()%></td>
                <td><%=products.getStatus()%></td>
                <td><a href="ProductServlet_JSP?service=updateProduct&productID=<%=products.getProductID()%>">update</a></td>
                <td><a href="ProductServlet_JSP?service=deleteProduct&productID=<%=products.getProductID()%>">delete</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
