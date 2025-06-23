<%-- 
    Document   : home
    Created on : Jun 20, 2025, 10:25:47 PM
    Author     : kat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Student"%>
<%@page import="dao.studentDAO"%>
<%@page import="java.util.ArrayList"%> 
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/themify-icons/themify-icons.css"/>
        <title>SE1911 Class - Student Management</title>
        <style>
            /* Reset margin and padding for all elements */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /* Body styling */
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f4f7fc;
                color: #333;
                line-height: 1.6;
                padding-top: 20px;
            }

            /* Container for the main content */
            .container {
                width: 80%;
                margin: 0 auto;
            }

            /* Navigation Bar */
            nav {
                background-color: #3b5998;
                padding: 15px 0;
                text-align: center;
            }

            nav a {
                text-decoration: none;
                color: white;
                padding: 10px 20px;
                margin: 0 15px;
                font-weight: bold;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            nav a:hover {
                background-color: #2d4373;
            }

            /* Title */
            h1 {
                text-align: center;
                margin-top: 30px;
                color: #3b5998;
                font-size: 2.5em;
            }
 
            .content {
                    display: flex;
    flex-wrap: wrap;  /* Cho phép xuống dòng */
    justify-content: flex-start;  /* Căn trái các phần tử */
    gap: 10px;  /* Khoảng cách giữa các thẻ */
    margin-top: 30px;
    overflow: auto;
            } 
            
            
            .card {
                font-size: 15px;
                   background-color: white;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin: 10px;
    border-radius: 8px;
    text-align: center;
    width: 200px;
            }

            .card:last-child {
                margin-right: 0;
            }

            .card h2 {
                color: #333;
                font-size: 1.8em;
                margin-bottom: 15px;
            }

            .card p {
                color: #666;
                font-size: 1.1em;
                margin-bottom: 10px;
            }

            .card a {
                display: inline-block;
                background-color: #3b5998;
                color: white;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            .card a:hover {
                background-color: #2d4373;
            }
            .userItem_css {
                background-color: #3b5998; /* Màu nền giống màu thanh navigation */
                color: white; /* Màu chữ trắng để dễ đọc */
                font-weight: bold; /* Làm nổi bật tên user */
                padding: 10px 15px; /* Tạo khoảng cách giữa nội dung và viền */
                border-radius: 5px; /* Bo góc cho mềm mại */
                display: inline-block; /* Giữ hình dạng nút */
                cursor: pointer; /* Tránh con trỏ chuột hiển thị như link */
                margin-left: 20px; /* Giữ khoảng cách với các link khác */
                transition: background-color 0.3s ease;
                border: 1px solid #2d4373;
                position: relative;
            }
            .userItem_css i {
                padding-right: 5px;
            }

            /* Định dạng trang để footer luôn ở cuối */
            html, body {
                height: 100%;
                margin: 0;
                display: flex;
                flex-direction: column;
            }

            /* Container chính chiếm toàn bộ không gian còn lại */
            .container {
                flex: 1; /* Đẩy footer xuống dưới */
            }

            /* Footer styling */
            .footer {
                background-color: #3b5998; /* Màu nền giống thanh navigation */
                color: white;
                text-align: center;
                padding: 15px 0;
                margin-top: auto; /* Đẩy footer xuống cuối khi nội dung ngắn */
            }

            .footer-container {
                width: 80%;
                margin: 0 auto;
            }

            .footer p {
                font-size: 1em;
                margin-bottom: 10px;
            }

            .footer-links {
                display: flex;
                justify-content: center;
                gap: 20px; /* Khoảng cách giữa các link */
            }

            .footer-links a {
                color: white;
                text-decoration: none;
                font-weight: bold;
                transition: color 0.3s ease;
            }

            .footer-links a:hover {
                color: #dcdcdc; /* Nhạt hơn khi hover */
            }
            .userItem_more{
                position: absolute;
                background-color: white;
                border: solid 1px black; 
               color:#2d4373; 
               right: -30%;
               top: 40px;
               width: 100px;
               font-size: 12px;
                  display: none;
            }
            .userItem_more > div{ 
                padding: 5px 10px;
            }
            .userItem_more > div:hover{
                padding: 5px 10px;
                background-color: gray;
            }
            
            .userItem_css:hover .userItem_more{
                display: block;
            }
            
            .displayBlock {
                display: block;
            }
            .displayNone {
                display: none;
            }
               .timetable-container {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 40px 0;
        }
        .timetable-table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        .timetable-table th, .timetable-table td {
            border: 1px solid black;
            padding: 0px;
            text-align: center;
        }
        .timetable-table th {
            background-color: #f2f2f2;
        }
        .timetable-subject {
            color: blue;
            font-weight: bold;
        }
        .timetable-present {
            color: green;
            font-weight: bold;
            text-decoration: underline;
        }
        .timetable-not-yet, .timetable-absent {
            color: red;
            text-decoration: underline;
        }
        
       .notification-container {
            width: 90%;
            margin: 40px auto;
            margin-top: 0;
            display: flex;
            border: 1px solid black;
            height: 300px;
        }
        .notification-titles {
            width: 30%;
            border-right: 1px solid black;
            overflow-y: auto;
            padding: 10px;
        }
        .notification-content {
            width: 70%;
            padding: 10px;
            overflow-y: grap;
            max-height: 300px;
        }
        .notification-title {
            font-size: 15px;
            cursor: pointer;
            padding: 5px;
            border-bottom: 1px solid black;
        }
        .notification-title:hover {
            background-color: #f2f2f2;
        }
        .active {
            font-weight: bold;
            background-color: #e0e0e0;
        }
        
        .form-container {
            width: 50%;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid black;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
                .form-container select{ 
            padding: 6px;
             
        }
        label, select, textarea, button {
            display: block;
            width: 100%;
            margin-bottom: 10px;
        }
        textarea {
            height: 100px;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        </style>
    </head>
    <body>
        <div class="container">
            <!-- Navigation Bar -->
            <nav>
                <a href="user/courseList.jsp">COURSE</a>
                <a href="user/studentList.jsp">STUDENT</a>
                <a href="user/scoreList.jsp">SCORE</a>
                <a href="admin/form_management.jsp">FORM</a>
                <a href="user/teacherList.jsp">TEACHER</a>
                
                <% 
                    String user = (String) session.getAttribute("user");
                     studentDAO sDAO = new studentDAO();
                     String userName= "";
                            List<Student> listStudent = sDAO.getAll();
                            if(user!=null){if(user.equals("admin")){
                                userName = "admin";
                    } else {
                            for(Student stu : listStudent){
                                if(user!=null&&user.equals(stu.getId())){
                                userName=stu.getName();   
                                break;
                    } else {
                        userName="";
                    }    }    
                    }    }
                    if(userName.equals("")){
                %>

                <a href="signin.jsp">Signin</a> 
                <a href="user/signUp.jsp">SignUp</a>
                <%} else {%> 
                <a class="userItem_css">
                    <i class="ti-user"></i>
                    <%=userName%>
                    <div class="userItem_more">
                        <div onclick="window.location.href='home.jsp?sign_out=on'" >sign out</div>
                        <div onclick=" " >my account</div>
                        </div>
                </a>
                 <%}%>
            </nav>

            <!-- Page Title -->
            <h1 style="margin:50px 0;">Welcome to PRJ301.2 Class</h1>
<%
    if(user!=null&&user.equals("admin")){

%>
            <!-- Content Sections -->
            <div class="content">
                <!-- Course Section -->
                <div class="card">
                    <h2>Courses</h2>
                    <p>Manage your courses effectively.</p>
                    <a href="admin/course_management.jsp">Manage Courses</a>
                </div>

                <!-- Student Section -->
                <div class="card">
                    <h2>Students</h2>
                    <p>Manage student information.</p>
                    <a href="admin/student_management.jsp">Manage Students</a>
                </div>

                <!-- Score Section -->
                <div class="card">
                    <h2>Scores</h2>
                    <p>Manage student scores and progress.</p>
                    <a href="admin/score_management.jsp">Manage Scores</a>
                </div>
                
                <!-- Score Section -->
                <div class="card">
                    <h2>Form</h2>
                    <p>Manage student forms and progress.</p>
                    <a href="admin/form_management.jsp">Manage Forms</a>
                </div>
                
                 <!-- teacher Section -->
                <div class="card">
                    <h2>Teacher</h2>
                    <p>Manage teachers and their information.</p>
                    <a href="admin/teacher_management.jsp">Manage Teachers</a>
                </div>
                         
                 <div class="card">
                    <h2>Image</h2>
                    <p>Manage image and their information.</p>
                    <a href="admin/image_management.jsp">Manage Image</a>
                </div>
                 
            </div>
        </div>
<%
    }  
%>
<!-- content here -->



<h2 style="padding:0 auto;display: flex; justify-content: center; margin-top: 30px;">Thông Báo</h2>
  <div class="notification-container"> 
        <div class="notification-titles">
            <div class="notification-title" onclick="showNotification('Phòng TC&QLĐT hướng dẫn sinh viên mới sử dụng hệ thống FAP:\n1. TRA CỨU LỊCH HỌC - Đăng nhập FAP, vào mục Thời khóa biểu để xem lịch học.\n2. KIỂM TRA ĐIỂM - Sinh viên xem điểm tại Mục Kết quả học tập.\n3. ĐĂNG KÝ MÔN HỌC - Sinh viên đăng ký học lại hoặc đổi lớp tại Mục Đăng ký học phần.\n4. HỖ TRỢ - Liên hệ Phòng TC&QLĐT nếu gặp vấn đề khi sử dụng FAP.', this)">Hướng dẫn sử dụng FAP</div>
            <div class="notification-title" onclick="showNotification('Phòng TC&QLĐT thông báo sinh viên cần đăng ký học lại cho học kỳ Spring 2025 như sau:\n1. THỜI GIAN ĐĂNG KÝ - Bắt đầu từ 3/3/2025 trên FAP.\n2. HƯỚNG DẪN ĐĂNG KÝ - Sinh viên học lại Tiếng Anh dự bị sẽ được xếp lớp tự động, không cần đăng ký.\n   - Sinh viên học lại Nhạc cụ đăng ký tại Đơn khác trên FAP.\n   - Sinh viên học lại Giáo dục thể chất (Võ, Cờ) đăng ký tại Register to repeat a course trên FAP.\n   - Sinh viên cần đóng học phí trước khi đăng ký.\n3. LƯU Ý - Sinh viên chưa hoàn thành học phí sẽ không được xét học lại.', this)">Đăng ký học lại Spring 2025</div>
            <div class="notification-title" onclick="showNotification('Phòng TC&QLĐT thông báo thời gian đóng học phí học kỳ Spring 2025:\n1. HẠN CHÓT - Sinh viên phải hoàn thành đóng học phí trước ngày 10/3/2025.\n2. HÌNH THỨC NỘP - Sinh viên có thể nộp qua ngân hàng hoặc trực tiếp tại trường.\n3. LƯU Ý - Sinh viên chưa đóng học phí sẽ không được xếp lớp.\n   - Sinh viên có thắc mắc liên hệ Phòng Kế toán để được hỗ trợ.', this)">Thời gian đóng học phí Spring 2025</div>
            <div class="notification-title" onclick="showNotification('Phòng Khảo thí thông báo lịch thi cuối kỳ Spring 2025 như sau:\n1. THỜI GIAN THI - Các môn sẽ thi từ ngày 15/6/2025 đến 30/6/2025.\n2. TRA CỨU LỊCH THI - Sinh viên tra cứu lịch thi trên FAP từ ngày 10/6/2025.\n3. QUY ĐỊNH DỰ THI - Sinh viên phải có thẻ sinh viên và giấy tờ tùy thân khi vào phòng thi.\n   - Sinh viên vắng thi không có lý do chính đáng sẽ không được thi lại.', this)">Lịch thi cuối kỳ Spring 2025</div>
            <div class="notification-title" onclick="showNotification('Phòng TC&QLĐT thông báo về việc điều chỉnh thời khóa biểu Spring 2025:\n1. THỜI GIAN ĐIỀU CHỈNH - Sinh viên có thể thay đổi lớp học từ ngày 5/3/2025 - 10/3/2025 trên FAP.\n2. CÁCH THỰC HIỆN - Đăng nhập FAP, vào mục Đổi lớp, chọn môn cần đổi.\n   - Chỉ được đổi nếu còn chỗ trống.\n3. LƯU Ý - Không được đổi lớp sau ngày 10/3/2025.\n   - Sinh viên cần kiểm tra kỹ lịch học trước khi điều chỉnh.', this)">Điều chỉnh thời khóa biểu Spring 2025</div>
            <div class="notification-title" onclick="showNotification('Phòng Hành chính thông báo nghỉ lễ Giỗ tổ Hùng Vương:\n1. NGÀY NGHỈ - Sinh viên được nghỉ vào ngày 18/4/2025.\n2. HOẠT ĐỘNG - Các lớp học sẽ được dời sang ngày khác theo lịch của giảng viên.\n3. LƯU Ý - Sinh viên cần kiểm tra lại lịch học sau kỳ nghỉ.', this)">Nghỉ lễ Giỗ tổ Hùng Vương</div>
            <div class="notification-title" onclick="showNotification('Phòng Đào tạo hướng dẫn đăng ký tín chỉ học kỳ Summer 2025:\n1. THỜI GIAN - Sinh viên có thể đăng ký từ ngày 1/5/2025 đến 10/5/2025.\n2. HƯỚNG DẪN - Truy cập FAP, chọn mục Đăng ký học phần.\n3. LƯU Ý - Sinh viên cần hoàn thành học phí trước khi đăng ký.', this)">Đăng ký tín chỉ Summer 2025</div>
     
        </div>
        <div class="notification-content" id="notification-display">
            Chọn một thông báo để xem nội dung.
        </div>
    </div>

  <div class="timetable-container">
        <h2>Thời Khóa Biểu</h2>
        <table class="timetable-table">
            <tr>
                <th></th>
                <th>Thứ 2</th>
                <th>Thứ 3</th>
                <th>Thứ 4</th>
                <th>Thứ 5</th>
                <th>Thứ 6</th>
                <th>Thứ 7</th>
                <th>Chủ Nhật</th>
            </tr>
            <tr>
                <td>Ngày</td>
                <td>12/2</td>
                <td>13/2</td>
                <td>14/2</td>
                <td>15/2</td>
                <td>16/2</td>
                <td>17/2</td>
                <td>18/2</td>
            </tr>
            <tr>
                <td>Slot 1<br>(7h - 9h15)</td>
                <td><span class="timetable-subject">OOP</span><br>DE101<br><span class="timetable-present">Present</span></td>
                <td><span class="timetable-subject">WAD</span><br>AL103<br><span class="timetable-absent">Absent</span></td>
                <td></td>
                <td><span class="timetable-subject">DMA</span><br>BE105<br><span class="timetable-present">Present</span></td>
                <td><span class="timetable-subject">DSA</span><br>DE107<br><span class="timetable-not-yet">Not Yet</span></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>Slot 2<br>(9h30 - 11h45)</td>
                <td><span class="timetable-subject">CNE</span><br>AL102<br><span class="timetable-present">Present</span></td>
                <td><span class="timetable-subject">MLE</span><br>BE104<br><span class="timetable-absent">Absent</span></td>
                <td></td>
                <td><span class="timetable-subject">SEN</span><br>DE106<br><span class="timetable-present">Present</span></td>
                <td><span class="timetable-subject">CCO</span><br>DE108<br><span class="timetable-not-yet">Not Yet</span></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>Slot 3<br>(12h - 14h15)</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>Slot 4<br>(14h30 - 16h45)</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>Slot 5<br>(17h - 19h15)</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>Slot 6<br>(19h30 - 21h45)</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </div>

<h2 style="padding:0 auto;display: flex; justify-content: center;">Gửi Đơn</h2>

 <div class="form-container"> 
        <form action="addForm" method="post">
            <label for="formtype">Chọn loại đơn:</label>
            <select id="formtype" name="formtype" required>
                <option value="don_hoc_lai">Đơn học lại</option>
                <option value="don_nghi_hoc">Đơn nghỉ học</option>
                <option value="don_cai_thien_diem">Đơn cải thiện điểm</option>
                <option value="don_tam_hoan_nvqs">Đơn xin tạm hoãn NVQS</option>
                <option value="don_bao_luu">Đơn xin bảo lưu</option>
                <option value="yeu_cau_doi_cheo_lop">Yêu cầu đổi chéo lớp</option>
                <option value="dk_hoc_phu_dao">Đăng ký học phụ đạo</option>
                <option value="don_chuyen_lop">Đơn xin chuyển lớp</option>
                <option value="don_chuyen_co_so">Đơn xin chuyển cơ sở</option>
            </select>
               <label for="user_id_RE">Người nhận:</label>
            <textarea style="height: 26px;" id="user_id_RE" name="user_id_RE" required>admin</textarea>
            <input type=hidden id="user_id_SE" name="user_id_SE" value="<%=user%>"></input>
            <label for="reason">Lý do:</label>
            <textarea id="reason" name="reason" required></textarea>
             <button type="submit">Gửi đơn</button>
        </form>
    </div>


        <footer class="footer">
            <div class="footer-container">
                <p>&copy; 2025 PRJ301.2 Class Management. All rights reserved.</p>
                <div class="footer-links">
                    <a href="#">Privacy Policy</a>
                    <a href="#">Terms of Service</a>
                    <a href="contact.jsp">Contact Us</a>
                </div>
            </div>
        </footer>

    </body>
    
    <script>
        
        <%  String sign_out = ""+request.getParameter("sign_out");
        if(sign_out.equals("on")&&!sign_out.equals("null")&&!sign_out.equals("")){ 
            session.invalidate(); %>
     window.location.href = 'home.jsp';  
    <%     }      %>
        
         <%  String addFromMess = ""+request.getParameter("addFromMess");
        if(!addFromMess.equals("null")&&!addFromMess.equals("")){ %> 
     alert('<%=addFromMess%>');
    <%     }      %>
          
        function showNotification(content, element) {
            document.getElementById('notification-display').innerHTML = content;
            let titles = document.getElementsByClassName('notification-title');
            for (let i = 0; i < titles.length; i++) {
                titles[i].classList.remove('active');
            }   
            element.classList.add('active');
        }
    </script>
</html>


