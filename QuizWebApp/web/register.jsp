<%-- 
    Document   : register
    Created on : Apr 4, 2023, 12:41:28 PM
    Author     : sitht
--%>

<%@page import="com.quiz.entity.Candidate"%>
<%@page import="com.quiz.ejb.CandidateSessionBeanRemote"%>
<%@page import="javax.naming.InitialContext"%>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <title>Register Candidates</title>
    </head>
    <body>
        
        <div class="wrapper">
            <header>Register Candidates</header>
            <form action="register" method="post">
                <div class="field name">
                    <div class="input-area">
                        <input type="text" name="name" placeholder="Full Name">
                        <i class="icon fas fa-user"></i>
                        <i class="error error-icon fas fa-exclamation-circle"></i>
                    </div>
                    <div class="error error-txt">Name can't be blank</div>
                </div>
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
                <input type="submit" value="Register">
            </form>
            <div class="sign-txt">Already registered? <a href="./login.jsp">Login now</a></div><br>
        <div class="sign-txt"><a href="./index.jsp">< Back to Home Page</a></div>
        </div>

        <script src="./JS/register.js"></script>
    </body>
</html>
