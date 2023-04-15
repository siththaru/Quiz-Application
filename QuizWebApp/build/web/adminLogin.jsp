<%-- 
    Document   : adminLogin
    Created on : Apr 6, 2023, 7:34:17 PM
    Author     : sitht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getSession().getAttribute("candidateId") != null) {
        response.sendRedirect("candidatePanel.jsp");
    } else if (request.getSession().getAttribute("currAdminId") != null) {
        response.sendRedirect("adminPanel.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./CSS/login.css">
        <title>Admin Login</title>
        <style>
            /* Reset default styles for form elements */
            body, input, button {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            /* Container for the login form */
            .login-container {
                background-color: #FDFDFD;
                border-radius: 10px;
                box-shadow: 0 2px 6px rgba(0,0,0,0.1);
                max-width: 400px;
                margin: 100px auto;
                padding: 40px;
            }

            /* Title */
            .login-title {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 20px;
                text-align: center;
            }

            /* Input fields */
            .login-input {
                border: 1px solid #DDD;
                border-radius: 5px;
                font-size: 16px;
                margin-bottom: 15px;
                padding: 10px;
                width: 100%;
            }

            /* Login button */
            .login-button {
                background-color: #000;
                border: none;
                border-radius: 5px;
                color: #FFF;
                cursor: pointer;
                font-size: 18px;
                font-weight: bold;
                padding: 15px;
                width: 100%;
            }

            /* Hover effect on login button */
            .login-button:hover {
                background-color: #333;
            }
        </style>
    </head>
    <body style="background: url('./IMAGES/login-bg.jpg')">
        
        <div class="login-container">
            <h1 class="login-title">Admin Login</h1>
            <form action="admin_login" method="post">
            <input class="login-input" type="text" name="username" placeholder="Username">
            <input class="login-input" type="password" name="password" placeholder="Password">
            <br><br>
            <button class="login-button" type="submit">Login</button>
            </form>
            <br>
            <center>
            <a style="font-weight: bold; text-align: center; text-decoration: none" href="./index.jsp">< GO BACK TO HOME PAGE</a>
            </center>
        </div>
        
    </body>
</html>
