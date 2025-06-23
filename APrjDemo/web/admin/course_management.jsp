<%-- 
    Document   : course_management
    Created on : Jun 20, 2025, 10:53:14 PM
    Author     : kat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.reflect.Field"%>
<%@page import="java.util.List"%> 
<%@page import="model.Course"%>
<%@page import="dao.courseDAO"%>
<%@page import="jakarta.servlet.http.HttpSession"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/access/css/themify-icons/themify-icons.css">

        <style>
            .table_course  {
                margin: 20px;
                background-color: #fff;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
            }

            .table_course table  {
                width: 100%;
                border-collapse: collapse;
            }

            .table_course th, .table_course td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
                max-width: 200px;
            }

            .table_course th  {
                background-color: #007bff;
                color: #fff;
            }

            .table_course tr:hover {
                background-color: #f1f1f1;
            }
            .add_new_course
            {
                display: flex;
                justify-content: center;
                align-items: center;
                width: fit-content;
                background-color: #28a745;
                color: #fff;
                font-weight: bold;
                border-radius: 4px;
                cursor: pointer;
                padding: 8px 16px;
                margin: 10px auto;
                transition: 0.3s;

            }

            button.ti-pencil,
            button.ti-trash {
                background: none;
                border: none;
                font-size: 1.2em;
                cursor: pointer;
                color: #007bff;
                margin-right: 8px;
            }

            button.ti-trash:hover {
                color: #dc3545;
            }

            #edit_course, #add_course {
                background: rgba(0, 0, 0, 0.5);
                position: fixed;
                top: 0;
                right: 0;
                left: 0;
                bottom: 0;
            }

            .edit_course_content, .add_course_content {
                width: 40%;
                margin: auto;
                padding: 30px 20px;
                background-color: #fff;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }

            .edit_course_content h3, .add_course_content h3 {
                color: #007bff;
            }
            .edit_course_content button, .add_course_content button {
                background-color: #007bff;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .edit_course_content button:hover,
            .add_course_content button:hover {
                background-color: #0056b3;
            }
            .in4_E_table{
                margin-bottom: 10px;
                display: flex;
                align-items: center;
            }
            .in4_E_table label{
                min-width:110px;
                font-weight: bold;
            }
            .in4_E_table textarea,.in4_E_table input,.in4_E_table select{
                width: 60%;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: none;
            }

            #edit_course, #add_course {
                display: none;
                background: rgba(0, 0, 0, 0.5);
                position: fixed;
                top: 0;
                right: 0;
                left: 0;
                bottom: 0;
                z-index: 1000;
            }

            .modal_content {
                position: relative;
                width: 40%;
                height: auto;
                margin: 10% auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            }

            .modal_close {
                background-color: #dc3545;
                color: #fff;
                padding: 5px 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 10px;
                float: right;

            }

            .modal_close:hover {
                background-color: #c82333;
            }
            .displayNone{
                display: none;
            }
            .displayBlock {
                display: block;
            }
        </style>
    </head>
    <body>

        <a style="padding:10px; background-color:gold;font-weight: bold;text-decoration: none;"  href="<%= request.getContextPath() %>/home.jsp">GET BACK</a>
        <!--part111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111--> 
        <%  
       courseDAO sDAO = new courseDAO();         
 List<Course> list_cou = sDAO.getAll();
            Class<?> class1 = Course.class;
             Field[] array1 = class1.getDeclaredFields();
        %>  
        <div class="table_course">
            <div 
                class="add_new_course"
                onclick="show_add_course()"
                style="display:flex;float: right;padding: 10px 20px;background-color: greenyellow; cursor:pointer; margin-right: 10px;color: black;"
                >
                Add new course.
            </div> 
            <table>
                <tr>
                    <%   for (Field arr_cou : array1) {  %>             
                    <th> <%=arr_cou.getName()%> </th>
                        <% } %>         
                    <th> Options </th>
                </tr>
                <tr>            
                    <%        
                  for(Course cou : list_cou){
                      Class<?> clazz2 = cou.getClass();
                        Field[] array2 = clazz2.getDeclaredFields();
                        for (Field arr2 : array2) {
                         arr2.setAccessible(true); 
                          Object value = arr2.get(cou);  

                    %>           
                    <td> 
                        <%=value%> 
                    </td>      
                    <%    } %>
                    <td style="text-align: center;">
                        <form class="" action="course_management.jsp" style="display: inline-flex">
                            <input type="hidden" id ="" name="edit_course_id" value="<%=cou.getId()%>"></input>
                            <button type="submit" class="ti-pencil" style=" " onclick="show_edit_course()"></button></form>
                        <button class="ti-trash" style="display: inline-flex; cursor: pointer;" onclick="delete_course('<%= cou.getId() %>')"></button>
                    </td>  
                </tr> 
                <% }   %>    
            </table>
        </div>                    
        <!-- edit_cou -->
        <%String edit_course_id = ""+request.getParameter("edit_course_id");  
                 for(Course cou : list_cou){if ( !edit_course_id.equals("null") && edit_course_id.equals(cou.getId())) {%> 


        <div id="edit_course" onclick="close_edit_course()" >  
            <div class="edit_course_content"  onclick="event.stopPropagation()" >
                <div  class="modal_close" onclick="close_edit_course()">X</div>
                <h3>Thông tin Course (<%=cou.getName()%>) :</h3>
                <form action="editCourse" method="POST" > 
                    <input type="hidden" name="old_id_cou" value="<%=cou.getId()%>">
                    <div class="in4_E_table"><label>ID:</label><br><textarea name="new_id_cou" required  ><%=cou.getId()%></textarea></div>
                    <div class="in4_E_table"><label>Name:</label><br><textarea name="name" required  ><%=cou.getName()%></textarea></div>
                    <div class="in4_E_table"><label>Credit:</label><br><textarea   name="credit" required  ><%=cou.getCredit()%></textarea> </div>
                    <div class="in4_E_table"><label>Fee:</label><br><textarea name="fee" required  ><%=cou.getFee()%></textarea></div>

                    <div style="text-align: right;">
                        <button type="submit" style="background: #28a745; color: #fff; padding: 10px 15px; border: none; border-radius: 5px;">Xác nhận</button>
                    </div>
                </form> 
            </div>   
        </div>     <!-- edit_cou -->  
        <% } }  %>

        <!-- Modal add_cou -->
        <div id="add_course" onclick="close_add_course()">
            <div class="add_course_content" onclick="event.stopPropagation()">
                <div class="modal_close" onclick="close_add_course()"> X </div>
                <h3>Thông tin Course:</h3>
                <form action="addCourse" method="POST"> 
                    <div class="in4_E_table"><label>Name:</label><br>
                        <input style="padding: 10px 1px;" type="text" name="name" required  ></div>
                    <div class="in4_E_table"><label>Credit:</label><br>
                        <input style="padding: 10px 1px;"  type="text" name="credit" required  ></div>
                    <div class="in4_E_table"><label>Fee:</label><br>
                        <textarea name="fee" required  ></textarea></div>

                    <div style="text-align: right;">
                        <button type="submit" style="background: #28a745; color: #fff; padding: 10px 15px; border: none; border-radius: 5px;">Xác nhận</button>
                    </div>
                </form> 
            </div> 
        </div>   <!-- add_cou -->  
    </body>
    <script>
        function show_add_course() {
            document.getElementById('add_course').style.display = 'flex';
        }
        function close_add_course() {
            document.getElementById('add_course').style.display = 'none';
        }
        function show_edit_course() {
            document.getElementById('edit_course').style.display = 'flex';
        }
        function close_edit_course() {
            document.getElementById('edit_course').style.display = 'none';
        }

        <%   
              for(Course cou : list_cou){if ( !edit_course_id.equals("null") && edit_course_id.equals(cou.getId())) {%>
        show_edit_course();
        <%}}%>
        function delete_course(id) {
            if (confirm('Bạn có chắc chắn muốn xóa không?')) {
                alert('Xóa course thành công.');
                window.location.href = 'deleteCourse?id_course_delete=' + id;

            }
        }
    </script>




</html>

