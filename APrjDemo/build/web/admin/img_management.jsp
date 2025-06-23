<%-- 
    Document   : img_management
    Created on : Jun 20, 2025, 10:55:04 PM
    Author     : kat20
--%>

<%@page import="java.util.List"%>
<%@page import="dao.imgDAO"%>
<%@page import="model.imgURL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Quản lý ảnh</title>
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

    <h2>Danh sách ảnh</h2>
    
    <table>
        <tr>
            <th>ảnh</th>
            <th>id</th>
            <th>type</th>
            <th>URL</th>
            <th>OPTION</th>
        </tr>
        
        <%
            imgDAO dao = new imgDAO();
            List<imgURL> list = dao.getAll();
            for (imgURL img : list) {
        %>
        <tr>
           <%if(img.getType().equals("student")){%>
            <td><img src="<%= request.getContextPath() %>/imageStudent/<%= img.getUrl() %>" width="100px"></td>
            <%} else {%>
            <td><img src="<%= request.getContextPath() %>/imageTeacher/<%= img.getUrl() %>" width="100px"></td>
            <% } %>
             <td><%= img.getId() %></td>
            <td><%= img.getType() %></td>
             <td><%= img.getUrl() %></td>
            <td>
                <a href="editImg?id=<%= img.getId() %>&type=<%= img.getType() %>">Sửa</a> |
                <a href="<%= request.getContextPath() %>/deleteImg?id=<%= img.getId() %>&type=<%= img.getType() %>" onclick="return confirm('Bạn có chắc muốn xóa ảnh này?')">Xóa</a>
            </td>
        </tr>
        <% } %>
    </table>

    <h2>Thêm ảnh mới</h2>
    <div   class="form-container">
        <form action="addImg" method="post" enctype="multipart/form-data">
              <label>ID:</label>
            <input type="text" name="id" required> <br>
             <label>Loại:</label>
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

</body>
</html>

