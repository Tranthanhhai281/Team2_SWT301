<%-- 
    Document   : form_management
    Created on : Jun 20, 2025, 10:53:47 PM
    Author     : kat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.reflect.Field"%>
<%@page import="java.util.List"%> 
<%@page import="model.Form"%>
<%@page import="dao.formDAO"%>
<%@page import="jakarta.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                         <link rel="stylesheet" href="<%=request.getContextPath()%>/access/css/themify-icons/themify-icons.css">

         <style>
            .table_form  {
              margin: 20px;
              background-color: #fff;
              box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
              border-radius: 8px;
              overflow: hidden;
          }

          .table_form table  {
              width: 100%;
              border-collapse: collapse;
          }

          .table_form th, .table_form td {
              padding: 12px;
              text-align: left;
              border-bottom: 1px solid #ddd;
              max-width: 200px;
          }

          .table_form th  {
              background-color: #007bff;
              color: #fff;
          }

          .table_form tr:hover {
              background-color: #f1f1f1;
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
                   String user = (String) session.getAttribute("user");
              formDAO sDAO = new formDAO();         
        List<Form> list_form = sDAO.getAll(); 
     Class<?> classForm = Form.class;
                    Field[] formAtributeArray = classForm.getDeclaredFields();
                     if(user!=null&&user.equals("admin")){
               %>  
                 <div class="table_form displayBlock"> 
                   <table>
                          <tr>
                           <%   for (Field FormAtribute : formAtributeArray) {  %>             
                           <th> <%=FormAtribute.getName()%> </th>
                               <% } %>    
                           <th>Option</th>
                       </tr>
                                
                             <%        
                           for(Form fo : list_form){
                           %>
                           <tr>  
                                 <%
                                 for (Field formAtribute : formAtributeArray) {
                                  formAtribute.setAccessible(true); 
                                   Object value = formAtribute.get(fo);  

                           %>           
                           <td> 
                                   <%=value%> 
                           </td>      
                        
                            <% }   %>    
                         <td style="text-align: center;">
                                <button class="ti-trash" style="display: inline-flex; cursor: pointer;" onclick="delete_form('<%= fo.getFormId() %>')"></button>
                            </td>  
                       </tr> 
                       <% }   %>    
                   </table>
                   
               </div>  
                   
                    <% } else if(user==null){%>
                        <h2 style="padding: 50px; font-weight: bold;font-size: 40px;">"Sign in" to see your form .</h2>

                    <%   }  else { %>
                    
                     <div class="table_form displayBlock"> 
                   <table>
                          <tr>
                           <%   for (Field FormAtribute : formAtributeArray) {  %>             
                           <th> <%=FormAtribute.getName()%> </th>
                               <% } %>    
                           <th>Option</th>
                       </tr>
                                
                             <%        
                           for(Form fo : list_form){
                           if(user.equals(fo.getUserIdSe())){
                           %>
                           <tr>  
                                 <%
                                 for (Field formAtribute : formAtributeArray) {
                                  formAtribute.setAccessible(true); 
                                   Object value = formAtribute.get(fo);  
                                   
                           %>           
                           <td> 
                                   <%=value%> 
                           </td>      
                        
                            <% }   %>    
                         <td style="text-align: center;">
                                <button class="ti-trash" style="display: inline-flex; cursor: pointer;" onclick="delete_form('<%= fo.getFormId() %>')"></button>
                            </td>  
                       </tr> 
                       <% }   } %>    
                   </table>
                   
               </div>  
                    <%  } %>
    </body>
    <script> 
             
            
               function delete_form(id) {
                    if (confirm('Bạn có chắc chắn muốn xóa không?')) {
                        alert('Xóa form thành công.');
                        window.location.href = 'deleteForm?id_form=' + id;
                 
        }
                }   
        </script>
    
    
</html>

