<%-- 
    Document   : teacher_management
    Created on : Jun 20, 2025, 10:56:12 PM
    Author     : kat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.reflect.Field"%>
<%@page import="java.util.List"%> 
<%@page import="model.Teacher"%>
<%@page import="dao.teacherDAO"%>
<%@page import="jakarta.servlet.http.HttpSession"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                 <link rel="stylesheet" href="<%=request.getContextPath()%>/access/css/themify-icons/themify-icons.css">

        <style>
             .table_teacher  {
              margin: 20px;
              background-color: #fff;
              box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
              border-radius: 8px;
              overflow: hidden;
          }

          .table_teacher table  {
              width: 100%;
              border-collapse: collapse;
          }

          .table_teacher th, .table_teacher td {
              padding: 12px;
              text-align: left;
              border-bottom: 1px solid #ddd;
              max-width: 200px;
          }

          .table_teacher th  {
              background-color: #007bff;
              color: #fff;
          }

          .table_teacher tr:hover {
              background-color: #f1f1f1;
          }
           .add_new_teacher 
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

          #edit_teacher, #add_teacher { 
             background: rgba(0, 0, 0, 0.5);
             position: fixed;
             top: 0;
             right: 0;
             left: 0;
             bottom: 0; 
          }

          .edit_teacher_content, .add_teacher_content { 
              width: 40%;  
              margin: auto;
              padding: 30px 20px;
              background-color: #fff;
              box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
              border-radius: 8px; 
          }

          .edit_teacher_content h3, .add_teacher_content h3 { 
              color: #007bff;
          }  
          .edit_teacher_content button, .add_teacher_content button {
              background-color: #007bff;
              color: white;
              padding: 10px 20px;
              border: none;
              border-radius: 4px;
              cursor: pointer;
          }

          .edit_teacher_content button:hover,
          .add_teacher_content button:hover {
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
           
   #edit_teacher, #add_teacher {
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
              teacherDAO sDAO = new teacherDAO();         
        List<Teacher> list_te = sDAO.getAll(); 
               %>  
                 <div class="table_teacher displayBlock">
                      <div 
                   class="add_new_teacher"
                   onclick="show_add_teacher()"
                   style="display:flex;float: right;padding: 10px 20px;background-color: greenyellow; cursor:pointer; margin-right: 10px;color: black;"
                   >
                   Add new teacher.
               </div> 
                     
                   <table>
                       <tr>
                                    
                           <th>id</th>
                           <th>Name</th>
                           <th>Phone</th> 
                           <th> Options </th>
                       </tr>
                                
                             <%        
                           for(Teacher te : list_te){
                           %>
                           <tr>  
                                <td><%=te.getTeacherId()%></td>
                                <td><%=te.getName()%></td>
                                <td><%=te.getPhone()%></td>  
                         <td style="text-align: center;">
                               <form class="" action="teacher_management.jsp" style="display: inline-flex">
                                   <input type="hidden" id ="" name="edit_teacher_id" value="<%=te.getTeacherId()%>"></input>
                                   <button type="submit" class="ti-pencil" style=" " onclick="show_edit_teacher()"></button></form>
                               <button class="ti-trash" style="display: inline-flex; cursor: pointer;" onclick="delete_teacher('<%= te.getTeacherId() %>')"></button>
                           </td>  
                       </tr> 
                       <% }   %>    
                   </table>
               </div>                    
           <!-- edit_te -->
               <%String edit_teacher_id = ""+request.getParameter("edit_teacher_id");  
                 for(Teacher te : list_te){if ( !edit_teacher_id.equals("null") && edit_teacher_id.equals(te.getTeacherId())) {%> 
                 

               <div id="edit_teacher" onclick="close_edit_teacher()" >  
                    <div class="edit_teacher_content"  onclick="event.stopPropagation()" >
                        <div  class="modal_close" onclick="close_edit_teacher()">X</div>
                        <h3>Thông tin teacher (<%=te.getName()%>) :</h3>
                       <form action="editTeacher" method="POST" > 
                           <input type="hidden" name="old_id_te" value="<%=te.getTeacherId()%>">
                           <div class="in4_E_table"><label>ID:</label><br><textarea name="new_id_te" required  ><%=te.getTeacherId()%></textarea></div>
                           <div class="in4_E_table"><label>Name:</label><br><textarea name="name" required  ><%=te.getName()%></textarea></div>
                           <div class="in4_E_table"><label>Phone:</label><br><textarea   name="DOB" required  ><%=te.getPhone()%></textarea> </div>
                         
                           <div style="text-align: right;">
                                <button type="submit" style="background: #28a745; color: #fff; padding: 10px 15px; border: none; border-radius: 5px;">Xác nhận</button>
                           </div>
                       </form> 
                       </div>   
               </div>     <!-- edit_te -->  
               <% } }  %>

              <!-- Modal add_teacher -->
            <div id="add_teacher" onclick="close_add_teacher()">
                 <div class="add_teacher_content" onclick="event.stopPropagation()">
                     <div class="modal_close" onclick="close_add_teacher()"> X </div>
                <h3>Thông tin teacher</h3>
                     <form action="addTeacher" method="POST"> 
                        <div class="in4_E_table"><label>Name:</label><br>
                            <input style="padding: 10px 1px;" type="text" name="name" required  ></div>
                         <div class="in4_E_table"><label>Phone:</label><br>
                            <input style="padding: 10px 1px;" type="text" name="phone" required  ></div> 
                        <div style="text-align: right;">
                             <button type="submit" style="background: #28a745; color: #fff; padding: 10px 15px; border: none; border-radius: 5px;">Xác nhận</button>
                        </div>
                    </form> 
                 </div> 
            </div>   <!-- add_teacher -->  
    </body>
    <script> 
                  function show_add_teacher() {
                document.getElementById('add_teacher').style.display = 'flex';
            }
            function close_add_teacher() {
                document.getElementById('add_teacher').style.display = 'none';
            } 
       function show_edit_teacher() {
                document.getElementById('edit_teacher').style.display = 'flex';
            }
            function close_edit_teacher() {
                document.getElementById('edit_teacher').style.display = 'none';
            }
              <%   
             for(Teacher te : list_te){if ( !edit_teacher_id.equals("null") && edit_teacher_id.equals(te.getTeacherId())) {%> 
                   show_edit_teacher();
               <%}}%> 
                   
               function delete_teacher(id) {
                    if (confirm('Bạn có chắc chắn muốn xóa không?')) {
                        alert('Xóa teacher thành công.');
                        window.location.href = 'delete_teacher?id_teacher_delete=' + id;
                    }
                }    
                
        </script>
    
    
    
    
</html>

