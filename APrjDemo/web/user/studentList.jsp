<%-- 
    Document   : studentList
    Created on : Jun 20, 2025, 10:50:57 PM
    Author     : kat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.reflect.Field"%>
<%@page import="java.util.List"%> 
<%@page import="model.Student"%>
<%@page import="dao.studentDAO"%>
<%@page import="jakarta.servlet.http.HttpSession"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student List</title>
        <style>
                       
  /* Reset cơ bản */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Arial', sans-serif;
}

/* Định dạng toàn trang */
body {
    background-color: #f4f7fc;
    color: #333;
    padding: 20px;
}

/* Nút quay lại */
a {
    display: inline-block;
    padding: 10px 15px;
    background-color: gold;
    color: black;
    text-decoration: none;
    font-weight: bold;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

a:hover {
    background-color: orange;
}

/* Bảng hiển thị danh sách khóa học */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background-color: white;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    overflow: hidden;
}

/* Tiêu đề cột */
th {
    background-color: #3b5998;
    color: white;
    padding: 12px;
    text-align: center;
}

/* Dòng dữ liệu */
td {
    padding: 10px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

/* Hiệu ứng hover khi di chuột vào hàng */
tr:hover {
    background-color: #f1f1f1;
}

/* Căn chỉnh nút trong cột Options */
td form, td button {
    display: inline-block;
    margin: 5px;
    border: none;
    background: none;
    cursor: pointer;
}

/* Nút chỉnh sửa */
button.ti-pencil {
    font-size: 18px;
    color: #1d72b8;
    transition: color 0.3s ease;
}

button.ti-pencil:hover {
    color: #125689;
}

/* Nút xóa */
button.ti-trash {
    font-size: 18px;
    color: #d9534f;
    transition: color 0.3s ease;
}

button.ti-trash:hover {
    color: #a52a2a;
}

            </style>
    </head>
    <body>
                <a style="padding:10px; background-color:gold;font-weight: bold;text-decoration: none;"  href="<%= request.getContextPath() %>/home.jsp">GET BACK</a>

         <%  
              studentDAO sDAO = new studentDAO();         
        List<Student> list_stu = sDAO.getAll();
                   Class<?> class1 = Student.class;
                    Field[] array1 = class1.getDeclaredFields();
               %>  
                
                   <table>
                       <tr>
                           <%   for (Field arr_stu : array1) {  %>             
                           <th> <%=arr_stu.getName()%> </th>
                               <% } %>         
                       </tr>
                       <tr>            
                             <%        
                           for(Student stu : list_stu){
                               Class<?> clazz2 = stu.getClass();
                                 Field[] array2 = clazz2.getDeclaredFields();
                                 for (Field arr2 : array2) {
                                  arr2.setAccessible(true); 
                                   Object value = arr2.get(stu);  
                                     if(arr2.getName().equals("password")){
           %>       
                          <td>********</td>  
                          <%} else {%>
                           <td><%=value%></td>      
                           <%  }  } %>
                           
                       </tr> 
                       <% }   %>    
                   </table>
     </body>
</html>

