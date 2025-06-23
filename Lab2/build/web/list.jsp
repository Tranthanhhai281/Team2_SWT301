<%-- 
    Document   : list
    Created on : Jun 5, 2025, 5:28:08 PM
    Author     : TRAN ANH HAI
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function doDelete(id){
                if(confirm("Are uou sure to delete the id" + id + "?")){
                    window.location = "delete?id="+id;
                }
            }
        </script>
        <style>
            .header{
                display: flex;
                justify-content: space-between;
                padding: 10px 10px;
            }
            .text-header{
                width: 33.3%;
                text-align: center;
            }
            .footer{
                background-color: #0EC0C3;
                padding: 10px;
            }
            .footer p, h5{
                text-align: center;
                color: white;
            }
            .footer{
                margin-left: -15px;
                margin-right: -15px;
            }
        </style>
    </head>
    <body>
    <center>
        <div>
            <div class="header">
                <h1>CATEGORY MANAGEMENT</h1>
            </div>
            <div class="main">
                <h1>LIST OF CATEGORY</h1>
                <h2> <a href="listProduct">LIST OF PRODUCT</a> </h2>
                <h3> <a href="add.jsp"> Add new category</a> </h3>
                <table border="1" width="50%">
                    <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Describe</th>
                    <th>Action</th>
                    </tr>
                    <c:forEach items="${requestScope.data}" var="c">
                        <c:set var="id" value="${c.id}"></c:set>
                        <tr>
                        <td>${id}</td>
                        <td>${c.name}</td>  
                        <td>${c.describe}</td>
                        <td>
                            <a href="update?id=${id}">Update </a> &nbsp;&nbsp;&nbsp;
                            <a href="#" onclick="doDelete('${id}')">Delete </a>
                        </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="footer">
	        <div>
	            <p>28-Tran Thanh Hai</p>
           	    <p>HE187108</p>
	            <h5>&copy; Copyright 2025.</h5>
	        </div>	
            </div>
        </div>
        
    </center>
    </body>
</html>
