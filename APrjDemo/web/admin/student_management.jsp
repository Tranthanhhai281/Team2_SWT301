<%-- 
    Document   : student_management
    Created on : Jun 20, 2025, 10:55:37 PM
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
        <title>JSP Page</title>
                 <link rel="stylesheet" href="<%=request.getContextPath()%>/access/css/themify-icons/themify-icons.css">

        <style>
             .table_student  {
              margin: 20px;
              background-color: #fff;
              box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
              border-radius: 8px;
              overflow: hidden;
          }

          .table_student table  {
              width: 100%;
              border-collapse: collapse;
          }

          .table_student th, .table_student td {
              padding: 12px;
              text-align: left;
              border-bottom: 1px solid #ddd;
              max-width: 200px;
          }

          .table_student th  {
              background-color: #007bff;
              color: #fff;
          }

          .table_student tr:hover {
              background-color: #f1f1f1;
          }
           .add_new_student 
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

          #edit_student, #add_student { 
             background: rgba(0, 0, 0, 0.5);
             position: fixed;
             top: 0;
             right: 0;
             left: 0;
             bottom: 0; 
          }

          .edit_student_content, .add_student_content { 
              width: 40%;  
              margin: auto;
              padding: 30px 20px;
              background-color: #fff;
              box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
              border-radius: 8px; 
          }

          .edit_student_content h3, .add_student_content h3 { 
              color: #007bff;
          }  
          .edit_student_content button, .add_student_content button {
              background-color: #007bff;
              color: white;
              padding: 10px 20px;
              border: none;
              border-radius: 4px;
              cursor: pointer;
          }

          .edit_student_content button:hover,
          .add_student_content button:hover {
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
           
   #edit_student, #add_student {
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
               <%  
              studentDAO sDAO = new studentDAO();         
        List<Student> list_stu = sDAO.getAll(); 
               %>  
                 <div class="table_student displayBlock">
                      <div 
                   class="add_new_student"
                   onclick="show_add_student()"
                   style="display:flex;float: right;padding: 10px 20px;background-color: greenyellow; cursor:pointer; margin-right: 10px;color: black;"
                   >
                   Add new student.
               </div> 
                     
                   <table>
                       <tr>
                                    
                           <th>id</th>
                           <th>Name</th>
                           <th>Birth of Date</th>
                           <th>Username</th>
                           <th>Password</th> 
                           <th> Options </th>
                       </tr>
                                
                             <%        
                           for(Student stu : list_stu){
                           %>
                           <tr>  
                                <td><%=stu.getId()%></td>
                                <td><%=stu.getName()%></td>
                                <td><%=stu.getDoB()%></td> 
                                <td><%=stu.getUsername()%></td>
                                <td><%=stu.getPassword()%></td> 
                         <td style="text-align: center;">
                               <form class="" action="student_management.jsp" style="display: inline-flex">
                                   <input type="hidden" id ="" name="edit_student_id" value="<%=stu.getId()%>"></input>
                                   <button type="submit" class="ti-pencil" style=" " onclick="show_edit_student()"></button></form>
                               <button class="ti-trash" style="display: inline-flex; cursor: pointer;" onclick="delete_student('<%= stu.getId() %>')"></button>
                           </td>  
                       </tr> 
                       <% }   %>    
                   </table>
               </div>                    
           <!-- edit_stu -->
               <%String edit_student_id = ""+request.getParameter("edit_student_id");  
                 for(Student stu : list_stu){if ( !edit_student_id.equals("null") && edit_student_id.equals(stu.getId())) {%> 
                 

               <div id="edit_student" onclick="close_edit_student()" >  
                    <div class="edit_student_content"  onclick="event.stopPropagation()" >
                        <div  class="modal_close" onclick="close_edit_student()">X</div>
                        <h3>Thông tin STUDENT (<%=stu.getName()%>) :</h3>
                       <form action="editStudent" method="POST" > 
                           <input type="hidden" name="old_id_stu" value="<%=stu.getId()%>">
                           <div class="in4_E_table"><label>ID:</label><br><textarea name="new_id_stu" required  ><%=stu.getId()%></textarea></div>
                           <div class="in4_E_table"><label>Name:</label><br><textarea name="name" required  ><%=stu.getName()%></textarea></div>
                           <div class="in4_E_table"><label>Date of birth:</label><br><textarea   name="DOB" required  ><%=stu.getDoB()%></textarea> </div>
                           <div class="in4_E_table"><label>Username:</label><br><textarea name="user" required  ><%=stu.getUsername()%></textarea></div>
                           <div class="in4_E_table"><label>Password:</label><br><textarea   name="pass" required  ><%=stu.getPassword()%></textarea> </div>
                          
                           <div style="text-align: right;">
                                <button type="submit" style="background: #28a745; color: #fff; padding: 10px 15px; border: none; border-radius: 5px;">Xác nhận</button>
                           </div>
                       </form> 
                       </div>   
               </div>     <!-- edit_stu -->  
               <% } }  %>

              <!-- Modal add_stu -->
            <div id="add_student" onclick="close_add_student()">
                 <div class="add_student_content" onclick="event.stopPropagation()">
                     <div class="modal_close" onclick="close_add_student()"> X </div>
                <h3>Thông tin STUDENT</h3>
                     <form action="addStudent" method="POST"> 
                        <div class="in4_E_table"><label>Name:</label><br>
                            <input style="padding: 10px 1px;" type="text" name="name" required  ></div>
                         <div class="in4_E_table"><label>Birth date:</label><br>
                            <input style="padding: 10px 1px;" type="date" name="DOB" required  ></div>
                           <div class="in4_E_table"><label>User name:</label><br>
                            <input style="padding: 10px 1px;" type="text" name="user" required  ></div>
                         <div class="in4_E_table"><label>Password:</label><br>
                            <input style="padding: 10px 1px;" type="text" name="pass" required  ></div>
                        <div style="text-align: right;">
                             <button type="submit" style="background: #28a745; color: #fff; padding: 10px 15px; border: none; border-radius: 5px;">Xác nhận</button>
                        </div>
                    </form> 
                 </div> 
            </div>   <!-- add_stu -->  
    </body>
    <script> 
                  function show_add_student() {
                document.getElementById('add_student').style.display = 'flex';
            }
            function close_add_student() {
                document.getElementById('add_student').style.display = 'none';
            } 
       function show_edit_student() {
                document.getElementById('edit_student').style.display = 'flex';
            }
            function close_edit_student() {
                document.getElementById('edit_student').style.display = 'none';
            } 
            
             <%   
              for(Student stu : list_stu){if ( !edit_student_id.equals("null") && edit_student_id.equals(stu.getId())) {%> 
                   show_edit_student();
               <%}}%> 
                   
               function delete_student(id) {
                    if (confirm('Bạn có chắc chắn muốn xóa không?')) {
                        alert('Xóa student thành công.');
                        window.location.href = 'deleteStudent?id_student_delete=' + id;
                    }
                }    
                
        </script>
    
    
    
    
</html>
    
