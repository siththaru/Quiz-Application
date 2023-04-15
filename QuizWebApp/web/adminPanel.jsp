<%-- 
    Document   : adminPanel
    Created on : Apr 6, 2023, 7:43:46 PM
    Author     : sitht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getSession().getAttribute("currAdminId") == null) {
        response.sendRedirect("adminLogin.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="./CSS/modules.css">
        <title>Admin Panel</title>
    </head>
    <body>
        <div class="container">

            <h3 class="title"> Admin Panel </h3>
            
            <a onclick="logout()" class="logoutBtn">&nbsp;<i class="fa fa-sign-out-alt"></i> Logout</a>
            
            <br><br><br><br>
            
            <div class="products-container">

                <div onclick="toModules()" class="product" data-name="p-1">
                    <br><br>
                    <img style="height: 15rem;" src="./IMAGES/modules.png" alt="">
                    <br><br>
                    <h3>Manage Modules</h3>
                </div>

                <div onclick="toQAs()" class="product" data-name="p-2">
                    <br><br>
                    <img style="height: 15rem;" src="./IMAGES/q_and_a.png" alt="">
                    <br><br>
                    <h3>Questions and Answers</h3>
                </div>

                <div onclick="toAdmins()" class="product" data-name="p-3">
                    <br><br>
                    <img style="height: 15rem;" src="./IMAGES/admins.png" alt="">
                    <br><br>
                    <h3>Manage Admins</h3>
                </div>
            </div>

            <script>
                function logout() {
                    window.location.href = "logout?msg=admin";
                }
                function toModules() {
                    window.location.href = "manageModules.jsp";
                }
                function toQAs() {
                    window.location.href = "manageQAs.jsp";
                }
                function toAdmins() {
                    window.location.href = "manageAdmins.jsp";
                }
            </script>
            <script src="js/script.js" defer></script>
    </body>
</html>
