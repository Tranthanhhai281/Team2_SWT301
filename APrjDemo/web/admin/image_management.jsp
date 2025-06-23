<%-- 
    Document   : image_management
    Created on : Jun 20, 2025, 10:54:20 PM
    Author     : kat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.imgDAO"%>
<%@page import="model.image"%>
<%@page import="java.util.List"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }
        .form-container {
            margin-top: 20px;
            margin-bottom: 100px;
            border:solid 1px black;
            width: 300px;
            
        }
        label,input{
        margin: 20px 0 20px 20px;    
        }
    </style>
    </head>
    <body>
        <h2>Thêm ảnh mới</h2>
    <div   class="form-container">
        <form action="addImg" method="post" enctype="multipart/form-data">
              <label>ID:</label>
            <input type="text" name="humanCode" required> <br>
             <label>Type:</label>
            <select name="type">
                <option value="student">Student</option>
                <option value="teacher">Teacher</option>
            </select>
            <br>
              <label>image :</label>
                <input type="file" name="file"> 
                <br>
            <button style="margin: 10px;" type="submit">Thêm</button>
        </form>
    </div> 
         <h2>Danh sách ảnh</h2> 
    <table>
        <tr>
            <th>id</th>
            <th>type</th>
            <th>URL</th>
            <th>OPTION</th>
        </tr>
        
        <%
            imgDAO idao = new imgDAO();
            List<image> list = idao.getAll();
            for (image i : list) {
        %>
        <tr>
           <%if(i.getType().equals("student")){%>
            <td><img src="<%= request.getContextPath() %>/image/<%= i.getUrl() %>" width="100px"></td>
            <%} else {%>
            <td><img src="<%= request.getContextPath() %>/image/<%= i.getUrl() %>" width="100px"></td>
            <% } %>
             <td><%= i.getId() %></td>
            <td><%= i.getType() %></td>
             <td><%= i.getUrl() %></td>
            <td>
                <a href="editImg?id=<%= i.getId() %>&type=<%= i.getType() %>">Sửa</a> |
                <a href="<%= request.getContextPath() %>/deleteImg?id=<%= i.getId() %>&type=<%= i.getType() %>" onclick="return confirm('Bạn có chắc muốn xóa ảnh này?')">Xóa</a>
            </td>
        </tr>
        <% } %>
    </table>
        

    </body>
</html>

