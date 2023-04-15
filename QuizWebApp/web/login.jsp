<%-- 
    Document   : Login
    Created on : Apr 6, 2023, 11:46:44 AM
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
        <title>Login</title>
        <link rel="stylesheet" href="./CSS/login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    </head>
    <body>
        <div class="wrapper">
        <header>Login</header>
        
        <form action="login" method="post">
            <div class="field email">
                <div class="input-area">
                    <input type="text" name="email" placeholder="Email Address">
                    <i class="icon fas fa-envelope"></i>
                    <i class="error error-icon fas fa-exclamation-circle"></i>
                </div>
                <div class="error error-txt">Email can't be blank</div>
            </div>
            <div class="field password">
                <div class="input-area">
                    <input type="password" name="password" placeholder="Password">
                    <i class="icon fas fa-lock"></i>
                    <i class="error error-icon fas fa-exclamation-circle"></i>
                </div>
                <div class="error error-txt">Password can't be blank</div>
            </div>
            <input type="submit" value="Login">
        </form>
        
        <div class="sign-txt">Not yet member? <a href="./register.jsp">Signup now</a></div>
        <br>
        <div class="sign-txt"><a href="./index.jsp">< Back to Home Page</a></div>
    </div>

        <!--<script src="./JS/login.js"></script>-->
    </body>
</html>
