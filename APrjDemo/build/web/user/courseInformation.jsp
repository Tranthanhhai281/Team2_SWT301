<%-- 
    Document   : courseInformation
    Created on : Jun 20, 2025, 10:47:48 PM
    Author     : kat20
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="java.lang.reflect.Field"%>
<%@page import="java.util.List"%> 
<%@page import="model.Course"%>
<%@page import="dao.courseDAO"%>
<%@page import="dao.DBContext"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Khóa học Lập trình Hướng đối tượng (OOP)</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<style>
    body { 
        min-height: 100px;
    } 
    </style>
</head>
<body>
    <%  
        String id = ""+request.getParameter("id");
        courseDAO cDAO = new courseDAO();         
        List<Course> list_cou = cDAO.getAll();
        Course course = new Course();
        boolean check =false;
        for(Course cou : list_cou){
            if(id.equals(cou.getId())){
              course = cou;
              check = true;
              break;
        }} 
         %>
        <a style="padding:10px; background-color:gold;font-weight: bold;text-decoration: none;"  href="<%= request.getContextPath() %>/home.jsp">GET BACK</a>    <header class="bg-dark text-white text-center py-4">
<%        if( check == false) {  
%>
        <h2> THIS COURSE IS STOP! </h2> 
        <%
            }  else {   

           if(id.equals("1")){
        %>
  
        <!-- Header -->
        <h1>Khóa học <%=course.getName()%></h1>
<img src="https://statics.cdn.200lab.io/2023/08/oop-4-tinh-chat.jpg?width=1200" alt="Hình ảnh khóa học" class="img-fluid my-3" style="max-width: 600px;">
    </header>

    <!-- Body -->
    <div class="container mt-4">
        
        <!-- Thời gian dạy -->
        <section class="mb-4">
            <h2 class="text-primary">📅 Thời gian học</h2>
            <p>Khóa học kéo dài **6 tuần** với các nội dung chính sau:</p>
            <ul>
                <li>Tuần 1-2: Giới thiệu OOP, Class & Object</li>
                <li>Tuần 3: Kế thừa (Inheritance)</li>
                <li>Tuần 4: Đa hình (Polymorphism)</li>
                <li>Tuần 5: Trừu tượng (Abstraction)</li>
                <li>Tuần 6: Tổng kết & Bài tập thực hành</li>
            </ul>
        </section>

        <!-- Kỹ năng đạt được -->
        <section class="mb-4">
            <h2 class="text-success">💡 Kỹ năng đạt được</h2>
            <p>Sau khóa học, bạn sẽ nắm vững các kỹ thuật lập trình OOP, bao gồm:</p>
            <ul>
                <li>Xây dựng và sử dụng Class, Object</li>
                <li>Hiểu và áp dụng tính kế thừa</li>
                <li>Biết cách triển khai đa hình trong Java</li>
                <li>Thiết kế hệ thống phần mềm theo nguyên tắc OOP</li>
            </ul>
        </section>

        <!-- Nội dung khóa học -->
        <section class="mb-4">
            <h2 class="text-warning">📚 Nội dung khóa học</h2>
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>Bài</th>
                        <th>Chủ đề</th>
                        <th>Thời gian</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Giới thiệu lập trình hướng đối tượng</td>
                        <td>2 giờ</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Class & Object trong Java</td>
                        <td>3 giờ</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Kế thừa và Override</td>
                        <td>3 giờ</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>Đa hình và Interface</td>
                        <td>4 giờ</td>
                    </tr>
                </tbody>
            </table>
        </section>

        <!-- Giảng viên -->
        <section class="mb-4">
            <h2 class="text-danger">👨‍🏫 Giảng viên</h2>
            <div class="d-flex align-items-center">
                <img src="images/teacher.jpg" alt="Giảng viên" class="rounded-circle me-3" width="100">
                <div>
                    <h5>Nguyễn Văn A</h5>
                    <p>Giảng viên với 10 năm kinh nghiệm dạy Java & OOP tại các trường đại học.</p>
                </div>
            </div>
        </section>

    </div>
            <% } else if(id.equals("2")) {%>   
               <!-- Header -->
        <h1>Khóa học <%=course.getName()%></h1>
<img src="https://essencesoftwares.com/wp-content/uploads/2020/10/Web-Development.jpeg" alt="Hình ảnh khóa học" class="img-fluid my-3" style="max-width: 600px;">
    </header>

    <!-- Body -->
    <div class="container mt-4">
        
        <!-- Thời gian dạy -->
        <section class="mb-4">
            <h2 class="text-primary">📅 Thời gian học</h2>
            <p>Khóa học kéo dài <strong>6 tuần</strong> với các nội dung chính sau:</p>
            <ul>
                <li>Tuần 1-2: Giới thiệu Web Development, HTML & CSS</li>
                <li>Tuần 3: JavaScript cơ bản & DOM Manipulation</li>
                <li>Tuần 4: Backend với JSP & Servlets</li>
                <li>Tuần 5: Database & SQL trong Web Development</li>
                <li>Tuần 6: Tổng kết & Xây dựng dự án thực tế</li>
            </ul>
        </section>

        <!-- Kỹ năng đạt được -->
        <section class="mb-4">
            <h2 class="text-success">💡 Kỹ năng đạt được</h2>
            <p>Sau khóa học, bạn sẽ nắm vững các kỹ thuật lập trình Web Development, bao gồm:</p>
            <ul>
                <li>Xây dựng giao diện web với HTML & CSS</li>
                <li>Hiểu và sử dụng JavaScript để tạo hiệu ứng</li>
                <li>Phát triển ứng dụng web với JSP & Servlets</li>
                <li>Tương tác với database bằng SQL</li>
            </ul>
        </section>

        <!-- Nội dung khóa học -->
        <section class="mb-4">
            <h2 class="text-warning">📚 Nội dung khóa học</h2>
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>Bài</th>
                        <th>Chủ đề</th>
                        <th>Thời gian</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Giới thiệu Web Development</td>
                        <td>2 giờ</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>HTML & CSS cơ bản</td>
                        <td>3 giờ</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>JavaScript & DOM Manipulation</td>
                        <td>3 giờ</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>JSP & Servlets cơ bản</td>
                        <td>4 giờ</td>
                    </tr>
                </tbody>
            </table>
        </section>

        <!-- Giảng viên -->
        <section class="mb-4">
            <h2 class="text-danger">👨‍🏫 Giảng viên</h2>
            <div class="d-flex align-items-center">
                <img src="images/teacher.jpg" alt="Giảng viên" class="rounded-circle me-3" width="100">
                <div>
                    <h5>Nguyễn Văn A</h5>
                    <p>Giảng viên với 10 năm kinh nghiệm dạy Web Development tại các trường đại học.</p>
                </div>
            </div>
        </section> 
            
            <% }else if(id.equals("3")) { %>
                 <!-- Header -->
        <h1>Khóa học <%=course.getName()%></h1>
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpvMpIyi4h_CN59zDC7iRYG4JR5ziyhdherg&s" alt="Hình ảnh khóa học" class="img-fluid my-3" style="max-width: 600px;">
    </header>

    <!-- Body -->
    <div class="container mt-4">
        
        <!-- Thời gian dạy -->
        <section class="mb-4">
            <h2 class="text-primary">📅 Thời gian học</h2>
            <p>Khóa học kéo dài <strong>6 tuần</strong> với các nội dung chính sau:</p>
            <ul>
                <li>Tuần 1-2: Giới thiệu Database & Hệ quản trị CSDL</li>
                <li>Tuần 3: Mô hình quan hệ & SQL cơ bản</li>
                <li>Tuần 4: SQL nâng cao & Tối ưu truy vấn</li>
                <li>Tuần 5: Kết nối Database với Web Applications</li>
                <li>Tuần 6: Tổng kết & Xây dựng dự án thực tế</li>
            </ul>
        </section>

        <!-- Kỹ năng đạt được -->
        <section class="mb-4">
            <h2 class="text-success">💡 Kỹ năng đạt được</h2>
            <p>Sau khóa học, bạn sẽ nắm vững các kỹ thuật quản lý CSDL, bao gồm:</p>
            <ul>
                <li>Thiết kế và tối ưu cơ sở dữ liệu</li>
                <li>Truy vấn dữ liệu với SQL</li>
                <li>Quản lý và bảo trì hệ thống CSDL</li>
                <li>Kết nối CSDL với ứng dụng web</li>
            </ul>
        </section>

        <!-- Nội dung khóa học -->
        <section class="mb-4">
            <h2 class="text-warning">📚 Nội dung khóa học</h2>
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>Bài</th>
                        <th>Chủ đề</th>
                        <th>Thời gian</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Giới thiệu Database Management</td>
                        <td>2 giờ</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Mô hình quan hệ & Thiết kế CSDL</td>
                        <td>3 giờ</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>SQL cơ bản & nâng cao</td>
                        <td>3 giờ</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>Ứng dụng Database trong Web</td>
                        <td>4 giờ</td>
                    </tr>
                </tbody>
            </table>
        </section>

        <!-- Giảng viên -->
        <section class="mb-4">
            <h2 class="text-danger">👨‍🏫 Giảng viên</h2>
            <div class="d-flex align-items-center">
                <img src="images/teacher.jpg" alt="Giảng viên" class="rounded-circle me-3" width="100">
                <div>
                    <h5>Nguyễn Văn A</h5>
                    <p>Giảng viên với 10 năm kinh nghiệm dạy Database Management tại các trường đại học.</p>
                </div>
            </div>
        </section>

        
            <% }else if(id.equals("4")) { %>
              <!-- Header -->
        <h1>Khóa học <%=course.getName()%></h1>
<img src="https://media2.dev.to/dynamic/image/width=1600,height=900,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fthepracticaldev.s3.amazonaws.com%2Fi%2Fsrnvrd7vfeeq5qpxnabq.png" alt="Hình ảnh khóa học" class="img-fluid my-3" style="max-width: 600px;">
    </header>

    <!-- Body -->
    <div class="container mt-4">
        
        <!-- Thời gian dạy -->
        <section class="mb-4">
            <h2 class="text-primary">📅 Thời gian học</h2>
            <p>Khóa học kéo dài <strong>6 tuần</strong> với các nội dung chính sau:</p>
            <ul>
                <li>Tuần 1-2: Giới thiệu cấu trúc dữ liệu & Thuật toán</li>
                <li>Tuần 3: Các kiểu dữ liệu & Danh sách liên kết</li>
                <li>Tuần 4: Cây, đồ thị & Thuật toán tìm kiếm</li>
                <li>Tuần 5: Thuật toán sắp xếp & Phân tích độ phức tạp</li>
                <li>Tuần 6: Ứng dụng cấu trúc dữ liệu trong thực tế</li>
            </ul>
        </section>

        <!-- Kỹ năng đạt được -->
        <section class="mb-4">
            <h2 class="text-success">💡 Kỹ năng đạt được</h2>
            <p>Sau khóa học, bạn sẽ nắm vững các kỹ thuật về cấu trúc dữ liệu và thuật toán, bao gồm:</p>
            <ul>
                <li>Hiểu và triển khai các cấu trúc dữ liệu cơ bản</li>
                <li>Hiểu và cải tiến hiệu suất thuật toán</li>
                <li>Triển khai và tối ưu các thuật toán sắp xếp và tìm kiếm</li>
                <li>Ứng dụng cấu trúc dữ liệu và thuật toán trong lập trình</li>
            </ul>
        </section>

        <!-- Nội dung khóa học -->
        <section class="mb-4">
            <h2 class="text-warning">📚 Nội dung khóa học</h2>
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>Bài</th>
                        <th>Chủ đề</th>
                        <th>Thời gian</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Giới thiệu Data Structures & Algorithms</td>
                        <td>2 giờ</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Các kiểu dữ liệu & Danh sách liên kết</td>
                        <td>3 giờ</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Cây, đồ thị và đệ quy</td>
                        <td>3 giờ</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>Thuật toán tìm kiếm & sắp xếp</td>
                        <td>4 giờ</td>
                    </tr>
                </tbody>
            </table>
        </section>

        <!-- Giảng viên -->
        <section class="mb-4">
            <h2 class="text-danger">👨‍🎓 Giảng viên</h2>
            <div class="d-flex align-items-center">
                <img src="images/teacher.jpg" alt="Giảng viên" class="rounded-circle me-3" width="100">
                <div>
                    <h5>Nguyễn Văn A</h5>
                    <p>Giảng viên với 10 năm kinh nghiệm dạy Data Structures & Algorithms tại các trường đại học.</p>
                </div>
            </div>
        </section>

        <% }else if(id.equals("5")) { %>
                    <!-- Header -->
        <h1>Khóa học <%=course.getName()%></h1>
<img src="https://bcalabs.org/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2F4hlaqclp%2Fproduction%2Fbd843511e8f7e2475b57c908a5b68e763e5f9de1-626x626.jpg&w=3840&q=75" alt="Hình ảnh khóa học" class="img-fluid my-3" style="max-width: 600px;">
    </header>

    <!-- Body -->
    <div class="container mt-4">
        
        <!-- Thời gian dạy -->
        <section class="mb-4">
            <h2 class="text-primary">📅 Thời gian học</h2>
            <p>Khóa học kéo dài <strong>6 tuần</strong> với các nội dung chính sau:</p>
            <ul>
                <li>Tuần 1-2: Giới thiệu mạng máy tính & Kiến trúc mạng</li>
                <li>Tuần 3: Giao thức truyền thông TCP/IP</li>
                <li>Tuần 4: Định tuyến, Bảo mật & Tăng tốc mạng</li>
                <li>Tuần 5: Quản trị mạng & Dịch vụ internet</li>
                <li>Tuần 6: Ứng dụng mạng trong thực tế</li>
            </ul>
        </section>

        <!-- Kỹ năng đạt được -->
        <section class="mb-4">
            <h2 class="text-success">💡 Kỹ năng đạt được</h2>
            <p>Sau khóa học, bạn sẽ nắm vững các kiến thức về mạng máy tính, bao gồm:</p>
            <ul>
                <li>Hiểu các giao thức mạng quan trọng</li>
                <li>Quản trị và bảo mật hệ thống mạng</li>
                <li>Thiết lập mạng doanh nghiệp và gia đình</li>
                <li>Xây dựng và tối ưu hiệu suất mạng</li>
            </ul>
        </section>

        <!-- Nội dung khóa học -->
        <section class="mb-4">
            <h2 class="text-warning">📚 Nội dung khóa học</h2>
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>Bài</th>
                        <th>Chủ đề</th>
                        <th>Thời gian</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Giới thiệu về mạng máy tính</td>
                        <td>2 giờ</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Kiến trúc mạng & Giao thức TCP/IP</td>
                        <td>3 giờ</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Định tuyến và quản trị mạng</td>
                        <td>3 giờ</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>Bảo mật mạng & Ứng dụng trong thực tế</td>
                        <td>4 giờ</td>
                    </tr>
                </tbody>
            </table>
        </section>

        <!-- Giảng viên -->
        <section class="mb-4">
            <h2 class="text-danger">👨‍🎓 Giảng viên</h2>
            <div class="d-flex align-items-center">
                <img src="images/teacher.jpg" alt="Giảng viên" class="rounded-circle me-3" width="100">
                <div>
                    <h5>Nguyễn Văn A</h5>
                    <p>Giảng viên với 10 năm kinh nghiệm dạy Computer Networks tại các trường đại học.</p>
                </div>
            </div>
        </section>

       
        <% }else if(id.equals("6")) { %>
                    <!-- Header -->
        <h1>Khóa học <%=course.getName()%></h1>
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwBHAfzlNOGHIoOKB7uMdiw-6Mm3KS02LL7g&s" alt="Hình ảnh khóa học" class="img-fluid my-3" style="max-width: 600px;">
    </header>

    <!-- Body -->
    <div class="container mt-4">
        
        <!-- Thời gian dạy -->
        <section class="mb-4">
            <h2 class="text-primary">📅 Thời gian học</h2>
            <p>Khóa học kéo dài <strong>6 tuần</strong> với các nội dung chính sau:</p>
            <ul>
                <li>Tuần 1-2: Giới thiệu về Kỹ thuật phần mềm</li>
                <li>Tuần 3: Phân tích và thiết kế phần mềm</li>
                <li>Tuần 4: Kiểm thử và đảm bảo chất lượng</li>
                <li>Tuần 5: Phát triển phần mềm theo mô hình Agile</li>
                <li>Tuần 6: Triển khai và bảo trì phần mềm</li>
            </ul>
        </section>

        <!-- Kỹ năng đạt được -->
        <section class="mb-4">
            <h2 class="text-success">💡 Kỹ năng đạt được</h2>
            <p>Sau khóa học, bạn sẽ nắm vững các kiến thức về Kỹ thuật phần mềm, bao gồm:</p>
            <ul>
                <li>Phân tích yêu cầu và thiết kế hệ thống</li>
                <li>Hiểu về quy trình phát triển phần mềm</li>
                <li>Thực hiện kiểm thử và đảm bảo chất lượng phần mềm</li>
                <li>Ứng dụng các mô hình phát triển phần mềm phổ biến</li>
            </ul>
        </section>

        <!-- Nội dung khóa học -->
        <section class="mb-4">
            <h2 class="text-warning">📚 Nội dung khóa học</h2>
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>Bài</th>
                        <th>Chủ đề</th>
                        <th>Thời gian</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Giới thiệu về Kỹ thuật phần mềm</td>
                        <td>2 giờ</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Phân tích yêu cầu và thiết kế phần mềm</td>
                        <td>3 giờ</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Kiểm thử phần mềm và đảm bảo chất lượng</td>
                        <td>3 giờ</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>Phát triển phần mềm theo mô hình Agile</td>
                        <td>4 giờ</td>
                    </tr>
                </tbody>
            </table>
        </section>

        <!-- Giảng viên -->
        <section class="mb-4">
            <h2 class="text-danger">👨‍🎓 Giảng viên</h2>
            <div class="d-flex align-items-center">
                <img src="images/teacher.jpg" alt="Giảng viên" class="rounded-circle me-3" width="100">
                <div>
                    <h5>Nguyễn Văn A</h5>
                    <p>Giảng viên với 10 năm kinh nghiệm dạy Software Engineering tại các trường đại học.</p>
                </div>
            </div>
        </section>

     
        <% }else if(id.equals("7")) { %>
               <!-- Header -->
        <h1>Khóa học <%=course.getName()%></h1>
<img src="https://euro-systems.co.uk/wp-content/uploads/2024/09/Cloud-Computing-History-1.png" alt="Hình ảnh khóa học" class="img-fluid my-3" style="max-width: 600px;">
    </header>

    <!-- Body -->
    <div class="container mt-4">
        
        <!-- Thời gian dạy -->
        <section class="mb-4">
            <h2 class="text-primary">📅 Thời gian học</h2>
            <p>Khóa học kéo dài <strong>6 tuần</strong> với các nội dung chính sau:</p>
            <ul>
                <li>Tuần 1-2: Giới thiệu về Cloud Computing</li>
                <li>Tuần 3: Các dịch vụ Cloud chính</li>
                <li>Tuần 4: Triển khai và Quản lý Cloud</li>
                <li>Tuần 5: Bảo mật và Hiệu năng trong Cloud</li>
                <li>Tuần 6: Ứng dụng Cloud trong doanh nghiệp</li>
            </ul>
        </section>

        <!-- Kỹ năng đạt được -->
        <section class="mb-4">
            <h2 class="text-success">💡 Kỹ năng đạt được</h2>
            <p>Sau khóa học, bạn sẽ nắm vững các kiến thức về Cloud Computing, bao gồm:</p>
            <ul>
                <li>Hiểu các khái niệm cơ bản về Cloud</li>
                <li>Triển khai và quản lý dịch vụ Cloud</li>
                <li>Phân tích và bảo mật hạ tầng Cloud</li>
                <li>Ứng dụng Cloud Computing trong doanh nghiệp</li>
            </ul>
        </section>

        <!-- Nội dung khóa học -->
        <section class="mb-4">
            <h2 class="text-warning">📚 Nội dung khóa học</h2>
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>Bài</th>
                        <th>Chủ đề</th>
                        <th>Thời gian</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Giới thiệu về Cloud Computing</td>
                        <td>2 giờ</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Các dịch vụ Cloud phổ biến</td>
                        <td>3 giờ</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Bảo mật và Hiệu năng trong Cloud</td>
                        <td>3 giờ</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>Ứng dụng Cloud trong doanh nghiệp</td>
                        <td>4 giờ</td>
                    </tr>
                </tbody>
            </table>
        </section>

        <!-- Giảng viên -->
        <section class="mb-4">
            <h2 class="text-danger">👨‍🎓 Giảng viên</h2>
            <div class="d-flex align-items-center">
                <img src="images/teacher.jpg" alt="Giảng viên" class="rounded-circle me-3" width="100">
                <div>
                    <h5>Nguyễn Văn A</h5>
                    <p>Giảng viên với 10 năm kinh nghiệm dạy Cloud Computing tại các trường đại học.</p>
                </div>
            </div>
        </section>

        <% }else if(id.equals("8")) { %>
             <!-- Header -->
        <h1>Khóa học <%=course.getName()%></h1>
<img src="https://vinuni.edu.vn/wp-content/uploads/2024/12/tim-hieu-machine-learning-co-ban-nhung-dieu-can-biet-cho-nguoi-moi-bat-dau.jpg" alt="Hình ảnh khóa học" class="img-fluid my-3" style="max-width: 600px;">
    </header>

    <!-- Body -->
    <div class="container mt-4">
        
        <!-- Thời gian dạy -->
        <section class="mb-4">
            <h2 class="text-primary">📅 Thời gian học</h2>
            <p>Khóa học kéo dài <strong>6 tuần</strong> với các nội dung chính sau:</p>
            <ul>
                <li>Tuần 1-2: Giới thiệu về Machine Learning</li>
                <li>Tuần 3: Các thuật toán Machine Learning</li>
                <li>Tuần 4: Xử lý dữ liệu và Feature Engineering</li>
                <li>Tuần 5: Đánh giá và Tinh chỉnh mô hình</li>
                <li>Tuần 6: Ứng dụng Machine Learning thực tế</li>
            </ul>
        </section>

        <!-- Kỹ năng đạt được -->
        <section class="mb-4">
            <h2 class="text-success">💡 Kỹ năng đạt được</h2>
            <p>Sau khóa học, bạn sẽ nắm vững các kiến thức về Machine Learning, bao gồm:</p>
            <ul>
                <li>Hiểu các khái niệm cơ bản về Machine Learning</li>
                <li>Áp dụng các thuật toán Machine Learning vào thực tế</li>
                <li>Xử lý và tiền xử lý dữ liệu hiệu quả</li>
                <li>Tinh chỉnh mô hình và đánh giá kết quả</li>
            </ul>
        </section>

        <!-- Nội dung khóa học -->
        <section class="mb-4">
            <h2 class="text-warning">📚 Nội dung khóa học</h2>
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>Bài</th>
                        <th>Chủ đề</th>
                        <th>Thời gian</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Giới thiệu về Machine Learning</td>
                        <td>2 giờ</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Các thuật toán Machine Learning</td>
                        <td>3 giờ</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Xử lý dữ liệu và Feature Engineering</td>
                        <td>3 giờ</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>Ứng dụng Machine Learning thực tế</td>
                        <td>4 giờ</td>
                    </tr>
                </tbody>
            </table>
        </section>

        <!-- Giảng viên -->
        <section class="mb-4">
            <h2 class="text-danger">👨‍🎓 Giảng viên</h2>
            <div class="d-flex align-items-center">
                <img src="images/teacher.jpg" alt="Giảng viên" class="rounded-circle me-3" width="100">
                <div>
                    <h5>Nguyễn Văn A</h5>
                    <p>Giảng viên với 10 năm kinh nghiệm dạy Machine Learning tại các trường đại học.</p>
                </div>
            </div>
        </section>

    <% }  %>
    
    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3 mt-4">
        <p>📞 Liên hệ: 0325-627-628 | 📧 Email: hungkthe171030@fpt.edu.vn</p>
        <!-- Icon mạng xã hội -->
        <div class="d-flex justify-content-center mt-2">
            <a href="https://facebook.com" class="text-white mx-3 fs-4" target="_blank"><i class="bi bi-facebook"></i></a>
            <a href="https://instagram.com" class="text-white mx-3 fs-4" target="_blank"><i class="bi bi-instagram"></i></a>
            <a href="https://youtube.com" class="text-white mx-3 fs-4" target="_blank"><i class="bi bi-youtube"></i></a>
        </div>
    </footer>
<% } // check = true%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
