<%-- 
    Document   : signin
    Created on : Jun 20, 2025, 10:23:34 PM
    Author     : kat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
    <link rel="stylesheet" href="styles.css"> <!-- Import CSS -->
    <style>
        /* Reset margin and padding */
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
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
}

/* Container for form */
.auth-container {
    width: 400px;
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    text-align: center;
}

/* Title */
.auth-container h2 {
    color: #3b5998;
    font-size: 2em;
    margin-bottom: 15px;
}

/* Input Fields */
.auth-container input {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1em;
}

/* Submit Button */
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

/* Link to switch between Sign In and Sign Up */
.auth-container p {
    margin-top: 15px;
    font-size: 0.9em;
}

.auth-container a {
    color: #3b5998;
    text-decoration: none;
    font-weight: bold;
}

.auth-container a:hover {
    text-decoration: underline;
}

        </style>
    </head>
    <body>
    <div class="auth-container">
        <h2>Sign In</h2>
        <form action="signin" method="post">
            <input type="text" name="user" placeholder="Username" required>
            <input type="password" name="pass" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="user/signUp.jsp">Sign Up</a></p>
    </div>
</body>
</html>
