<%-- 
    Document   : signUp
    Created on : Jun 20, 2025, 10:50:23 PM
    Author     : kat20
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .auth-container {
            width: 400px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .auth-container h2 {
            color: #3b5998;
            font-size: 2em;
            margin-bottom: 15px;
        }
        .auth-container input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
        }
        .auth-container button {
            width: 100%;
            padding: 12px;
            background-color: #3b5998;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1.2em;
            cursor: pointer;
            transition: background 0.3s;
        }
        .auth-container button:hover {
            background-color: #2d4373;
        }
        .error-message {
            font-size: 12px;
            color: red; 
            display: none;
        }
        .input-error {
            border-color: red !important;
        }
    </style>
</head>
<body>
    <div class="auth-container">
        <h2>Sign Up</h2>
        <form action="signup" method="post">
            <input type="text" id="name" name="name" placeholder="Full Name" required>
            <input type="date" id="dob" name="DOB" placeholder="Date of Birth">
            
            <input type="text" id="username" name="username" placeholder="Username" required>
            <div class="error-message" id="usernameError">Username must be at least 5 characters (letters and numbers)</div>
            
            <input type="password" id="password" name="password" placeholder="Password" required>
            <div class="error-message" id="passwordError">Password must be at least 5 characters (letters and numbers)</div>
            
            <input type="password" id="confirmPassword" name="confirm_password" placeholder="Confirm Password" required>
            <div class="error-message" id="confirmPasswordError">Passwords must match</div>
            
            <% String messenger = (String) request.getAttribute("messenger"); %>
            <% if (messenger != null) { %>
                <div style="color: red; font-weight: bold;"><%= messenger %></div>
            <% } %>

            <button type="submit">Sign Up</button>
        </form>
        <p>Already have an account? <a href="<%= request.getContextPath() %>/signIn.jsp">Sign In</a></p>
    </div>

    <script>
        function validateInput(input, condition, errorElement, errorMessage) {
            if (!condition) {
                input.classList.add('input-error');
                errorElement.textContent = errorMessage;
                errorElement.style.display = 'block';
            } else {
                input.classList.remove('input-error');
                errorElement.style.display = 'none';
            }
        }

        document.getElementById('username').addEventListener('blur', (e) => {
            validateInput(
                e.target,
                /^[a-zA-Z0-9]{5,}$/.test(e.target.value),
                document.getElementById('usernameError'),
                'Username must be at least 5 characters (letters and numbers)'
            );
        });

        document.getElementById('password').addEventListener('blur', (e) => {
            validateInput(
                e.target,
                /^[a-zA-Z0-9]{5,}$/.test(e.target.value),
                document.getElementById('passwordError'),
                'Password must be at least 5 characters (letters and numbers)'
            );
        });

        document.getElementById('confirmPassword').addEventListener('blur', (e) => {
            validateInput(
                e.target,
                e.target.value === document.getElementById('password').value,
                document.getElementById('confirmPasswordError'),
                'Passwords must match'
            );
        });
    </script>
</body>
</html>

