<%-- 
    Document   : manageAdmin
    Created on : Apr 4, 2023, 12:41:28 PM
    Author     : sitht
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.quiz.entity.Admin"%>
<%@page import="java.util.List"%>
<%@page import="com.quiz.ejb.AdminSessionBeanRemote"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="./CSS/style.css">
        <link rel="stylesheet" type="text/css" href="./CSS/table.css">
        <link rel="stylesheet" type="text/css" href="./CSS/admin-form.css">
        <title>Add Admins</title>
    </head>
    <body>
        <h1 class="form-title">Admin Management</h1>
        <hr>
        <a href="adminPanel.jsp" class="back"><i class="fas fa-arrow-left"></i> &nbsp; Back</a>

        <div class="formbold-main-wrapper formbold-admin">
            <div class="formbold-form-wrapper">
                <form action="add_admin" method="post">
                    <div class="formbold-mb-5">
                        <label for="name" class="formbold-form-label"> Full Name </label>
                        <input type="text" name="name" id="name" placeholder="Enter your full name" class="formbold-form-input"/>
                    </div>

                    <div class="formbold-mb-5">
                        <label for="username" class="formbold-form-label"> Username </label>
                        <input type="text" name="username" id="username" placeholder="Enter your username" class="formbold-form-input" />
                    </div>

                    <div class="formbold-mb-5">
                        <label for="password" class="formbold-form-label"> Password </label>
                        <input type="password"  name="password" id="password" placeholder="Enter your password" class="formbold-form-input" />
                    </div>
                    <div>
                        <button type="submit" class="formbold-btn">Save Admin</button>
                    </div>
                </form>
            </div>
        </div>

        <br><br>

        <div class="table-wrapper">
            <table class="fl-table">
                <tr>
                    <th>Name</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Action</th>
                </tr>
                <%
                    InitialContext ic = new InitialContext();
                    AdminSessionBeanRemote asbr = (AdminSessionBeanRemote) ic.lookup("com.quiz.ejb.AdminSessionBeanRemote");
                    List<Admin> admins = asbr.getAllAdmins();
                    pageContext.setAttribute("admins", admins);
                    int adminCount = 0;
                    for (Admin singleAdmin : admins) {
                        adminCount++;
                    }
                    pageContext.setAttribute("adminCount", adminCount);
                %>

                <c:forEach var="admin" items="${admins}" varStatus="loop">
                    <tr>
                    <form action="update_admin" method="post">
                        <td><span class="spn${loop.index}" id="spn1_${loop.index}">${admin.adminName}</span><input class="input1 hiddenInputs hiddenInputs${loop.index}" id="input1_${loop.index}" type="text" name="name" value="${admin.adminName}"></td>
                        <td><span class="spn${loop.index}" id="spn2_${loop.index}">${admin.username}</span><input class="input2 hiddenInputs hiddenInputs${loop.index}" id="input2_${loop.index}" type="text" name="username" value="${admin.username}"></td>
                        <td><span class="spn${loop.index}" id="spn3_${loop.index}">${admin.password}</span><input class="input3 hiddenInputs hiddenInputs${loop.index}" id="input2_${loop.index}" type="text" name="password" value="${admin.password}"></td>
                        <td style="display: flex; flex-wrap: nowrap;">
                            <input id="adminIdField_${loop.index}" type="text" name="adminID" hidden value="${admin.id}">
                            <button class="edit-btn" id="editBtn_${loop.index}" type="button">Edit</button>
                            <button class="cancel-btn hiddenInputs${loop.index}" id="cancelBtn_${loop.index}" type="button"></button>
                            <button class="ok-btn hiddenInputs${loop.index}" type="submit" id="okBtn_${loop.index}"></button>
                            <button class="del-btn" id="delBtn_${loop.index}" type="button">Delete</button>
                        </td>
                    </form>
                    </tr>
                </c:forEach>

            </table>
        </div>

        <script>
            const numAdmins = ${adminCount}

            for (let i = 0; i < numAdmins; i++) {
                const inputs = document.querySelectorAll(".hiddenInputs" + i);
                const spans = document.querySelectorAll(".spn" + i);
                const editBtn = document.getElementById("editBtn_" + i);
                const cancelBtn = document.getElementById("cancelBtn_" + i);
                const okBtn = document.getElementById("okBtn_" + i);
                const delBtn = document.getElementById("delBtn_" + i);

                editBtn.addEventListener('click', () => {
                    for (let i = 0; i < inputs.length; i++) {
                        inputs[i].style.display = 'block';
                    }
                    for (let i = 0; i < spans.length; i++) {
                        spans[i].style.display = 'none';
                    }
                    editBtn.style.display = 'none';
                });
                cancelBtn.addEventListener('click', () => {
                    for (let i = 0; i < inputs.length; i++) {
                        inputs[i].style.display = 'none';
                    }
                    for (let i = 0; i < spans.length; i++) {
                        spans[i].style.display = 'block';
                    }
                    editBtn.style.display = 'block';
                });

                delBtn.addEventListener('click', () => {
                    const id = document.getElementById("adminIdField_" + i).value;
                    const url = "delete_admin?aid=" + id;
                    window.location.href = url;
                });
            }
        </script>
    </body>
</html>
