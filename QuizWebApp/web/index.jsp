<%-- 
    Document   : index
    Created on : Apr 4, 2023, 12:30:42 PM
    Author     : sitht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="./CSS/footer.css">
        <style>
    body {
        background-color: #111;
        color: #fff;
        font-family: 'Helvetica Neue', Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    center {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    h1 {
        font-size: 64px;
        margin: 0;
        padding: 0;
        text-align: center;
        text-transform: uppercase;
        letter-spacing: 4px;
        margin-bottom: 20px;
    }

    button {
        background-color: #222;
        color: #fff;
        border: none;
        padding: 15px 30px;
        font-size: 24px;
        margin-top: 10px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        text-transform: uppercase;
        letter-spacing: 2px;
        border-radius: 50px;
        outline: none;
    }

    button:hover {
        background-color: #444;
    }

    button:focus {
        box-shadow: 0 0 0 4px #666;
    }

    button:active {
        transform: scale(0.95);
    }
</style>

    </head>
    <body>
    <center>
        <div class="wrapper">
        <h1>Welcome</h1>
        <button onclick="toRegister()">Register</button>
        <br>
        <button onclick="toLogin()">Login</button>
        <br>
        <button onclick="toAdminLogin()">Admin Login</button>
        </div>
        <br><br><br><br>
        <jsp:include page="/footer.jsp" />
        
        <script>
            function toRegister() {
              window.location.href = "./register.jsp";
            }
            function toLogin() {
              window.location.href = "./login.jsp";
            }
            function toAdminLogin() {
              window.location.href = "./adminLogin.jsp";
            }
        </script>
    </center>
    </body>
</html>
