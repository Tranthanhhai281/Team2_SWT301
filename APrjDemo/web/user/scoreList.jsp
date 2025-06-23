<%-- 
    Document   : scoreList
    Created on : Jun 20, 2025, 10:49:55 PM
    Author     : kat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.reflect.Field"%>
<%@page import="java.util.List"%> 
<%@page import="model.Score"%>
<%@page import="dao.ScoreDAO"%>
<%@page import="model.Course"%>
<%@page import="dao.courseDAO"%>
<%@page import="jakarta.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Score Management</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/themify-icons/themify-icons.css">
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
            margin-bottom: 50px;
        }

        /* Tiêu đề cột */
        th {
            background-color: #3b5998;
            color: white;
           
        }

        /* Dòng dữ liệu */
        td {
             border-bottom: 1px solid #ddd;
        }

        /* Hiệu ứng hover khi di chuột vào hàng */
        tr:hover {
            background-color: #f1f1f1;
        }
        
          th, td {
                text-align: center;
        padding: 7px;
        text-align: center;
         font-size: 13px;
    }
        
    </style>
</head>
<body>
    <a style="padding:10px; background-color:gold;font-weight: bold;text-decoration: none;"  href="<%= request.getContextPath() %>/home.jsp">GET BACK</a>
<form action="scoreList.jsp" style="padding: 10px 10px 20px 10px;" method="GET">
            <label for="">Tìm theo tên:</label>
            <%
            String coOrStu = request.getParameter("coOrStu");
            if (coOrStu==null) coOrStu = "student";
            %>
            <select id="coOrStu" name="coOrStu" palceholder="...">
                <option value="student" <%= coOrStu.equals("student") ? "selected" : "" %>>student</option>
                <option value="course" <%= coOrStu.equals("course") ? "selected" : "" %>>course</option>
            </select>
            <input style="padding: 5px;" type="text" id="search" name="search" placeholder="tìm..." value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
            <label for="sort">Sắp xếp theo:</label>
            <select id="sort" name="sort" style="padding: 5px;">
                <option value="none" <%= "none".equals(request.getParameter("sort")) ? "selected" : "" %>>Không sắp xếp</option>
                <option value="SID" <%= "SID".equals(request.getParameter("sort")) ? "selected" : "" %>>student ID</option>
                <option value="CID" <%= "CID".equals(request.getParameter("sort")) ? "selected" : "" %>>course ID</option>
                <option value="SmallTest1" <%= "SmallTest1".equals(request.getParameter("sort")) ? "selected" : "" %>>small Test 1</option>
                <option value="SmallTest2" <%= "SmallTest2".equals(request.getParameter("sort")) ? "selected" : "" %>>small Test 2</option>
                <option value="PracticeExam" <%= "PracticeExam".equals(request.getParameter("sort")) ? "selected" : "" %>>Practice Exam</option>
                <option value="ProgressTest1" <%= "ProgressTest1".equals(request.getParameter("sort")) ? "selected" : "" %>>Progress Test 1</option>
                <option value="ProgressTest2" <%= "ProgressTest2".equals(request.getParameter("sort")) ? "selected" : "" %>>Progress Test 2</option>
                <option value="FinalExam" <%= "FinalExam".equals(request.getParameter("sort")) ? "selected" : "" %>>Final Exam</option>
                <option value="totalPoint" <%= "totalPoint".equals(request.getParameter("sort")) ? "selected" : "" %>>total Point</option> 
            </select> 
            <select id="inOrDe" name="inOrDe" style="padding: 5px;">
                <option value="none" <%= "none".equals(request.getParameter("inOrDe")) ? "selected" : "" %>>none</option>
                <option value="ASC" <%= "ASC".equals(request.getParameter("inOrDe")) ? "selected" : "" %>>Increase</option>
                <option value="DESC" <%= "DESC".equals(request.getParameter("inOrDe")) ? "selected" : "" %>>Decrease</option>
            </select>
            
            <button type="submit" style="padding: 10px; background-color: orange;border-radius: 5px; cursor:pointer;">Áp dụng</button>
        </form>
    <%
        // Lấy danh sách điểm & khóa học
          String user = (String) session.getAttribute("user");
        ScoreDAO scoreDAO = new ScoreDAO();
        List<Score> listScores;
        courseDAO courseDAO = new courseDAO();
        List<Course> listCourses = courseDAO.getAll();
        
          
              String search = request.getParameter("search");
              String sort = request.getParameter("sort");    
              String inOrDe = request.getParameter("inOrDe"); 

              if(search==null){search = "";}
              if(sort == null) {sort = "none";} 
               if(inOrDe == null) {inOrDe = "none";}  
               
              listScores = scoreDAO.getAll(coOrStu,search,sort,inOrDe); 
        
        
        if(user!=null&&user.equals("admin")){
    %>  
 
        <table>
            <tr> 
                    <th>SID</th>
                    <th>SName</th>
                    <th>CID</th>
                    <th>CName</th>
                    <th>SmallTest1</th>
                    <th>SmallTest2</th>
                    <th>ProgressTest1</th>
                    <th>ProgressTest2</th>
                    <th>PracticeExam</th>
                    <th>FinalExam</th>
                    <th>totalPoint</th>  
            </tr> 
            <% for (Score score : listScores) { %> 
                    <tr> 
                            <td><%=score.getSID()%></td> 
                            <td><%=score.getSName()%></td> 
                            <td><%=score.getCID()%></td> 
                            <td><%=score.getCName()%></td> 
                            <td><%=score.getSmallTest1()%></td> 
                            <td><%=score.getSmallTest2()%></td> 
                            <td><%=score.getProgressTest1()%></td> 
                            <td><%=score.getProgressTest2()%></td> 
                            <td><%=score.getPracticeExam()%></td> 
                            <td><%=score.getFinalExam()%></td> 
                            <td><%=score.getTotalPoint()%></td> 
                    </tr> 
            <% } %>
        </table>  
    <% } else if(user == null) {%>
    
    <h2 style="padding: 50px; font-weight: bold;font-size: 40px;">"Sign in" to see your score .</h2>
    
    
     <% } else {%>
    
     
         <table>
            <tr> 
                    <th>SID</th>
                    <th>SName</th>
                    <th>CID</th>
                    <th>CName</th>
                    <th>SmallTest1</th>
                    <th>SmallTest2</th>
                    <th>ProgressTest1</th>
                    <th>ProgressTest2</th>
                    <th>PracticeExam</th>
                    <th>FinalExam</th>
                    <th>totalPoint</th>  
            </tr> 
            <% for (Score score : listScores) { %> 
                    <tr> 
                            <td><%=score.getSID()%></td> 
                            <td><%=score.getSName()%></td> 
                            <td><%=score.getCID()%></td> 
                            <td><%=score.getCName()%></td> 
                            <td><%=score.getSmallTest1()%></td> 
                            <td><%=score.getSmallTest2()%></td> 
                            <td><%=score.getProgressTest1()%></td> 
                            <td><%=score.getProgressTest2()%></td> 
                            <td><%=score.getPracticeExam()%></td> 
                            <td><%=score.getFinalExam()%></td> 
                            <td><%=score.getTotalPoint()%></td> 
                    </tr> 
            <% } %>
        </table>  
        
        <%  
                } // else
        %>
</body>
</html>

