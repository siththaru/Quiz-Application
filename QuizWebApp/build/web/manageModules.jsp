<%-- 
    Document   : ManageModules
    Created on : Apr 5, 2023, 12:38:05 PM
    Author     : sitht
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="com.quiz.entity.Module"%>
<%@page import="com.quiz.ejb.ModuleSessionBeanRemote"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Modules</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="./CSS/modules.css">
    </head>
    <body>

        <div class="container">

            <h2 class="title"> All Modules </h2>

            <a href="adminPanel.jsp" class="back"><i class="fas fa-arrow-left"></i> &nbsp; Back</a>
            <a href="#" style="margin-left: 75%" class="add-module"><i class="fas fa-plus"></i> &nbsp; Add New Module</a>

            <br><br><br>

            <div class="products-container">

                <%
                    InitialContext ic = new InitialContext();
                    ModuleSessionBeanRemote msbr = (ModuleSessionBeanRemote) ic.lookup("com.quiz.ejb.ModuleSessionBeanRemote");
                    List<Module> modules = msbr.getAllModules();
                    pageContext.setAttribute("modules", modules);
                    int moduleCount = 0;
                    for (Module singleModule : modules) {
                        moduleCount++;
                    }
                    pageContext.setAttribute("moduleCount", moduleCount);
                %>

                <c:forEach var="module" items="${modules}" varStatus="loop">
                    <div class="product" data-name="p-${loop.index}">
                        <img src="./IMAGES/${module.moduleImage}" onerror="this.onerror=null; this.src='./IMAGES/imgupload.png'" alt="./IMAGES/imgupload.png">
                        <h3>${module.moduleName}</h3>
                        <span style="font-size: 2.5rem; font-weight: bold">${module.timePerQuiz} seconds per question</span>
                    </div>
                </c:forEach>

            </div>

        </div>

        <div class="add-module-preview">

            <div class="preview">
                <h3>Add Module</h3>  
                <form method="post" action="add_module" enctype="multipart/form-data">
                    <i class="fas fa-times add-module-close"></i>
                    <label for="img-uploader" id="image-label">
                        <img src="./IMAGES/imgupload.png" alt="">
                    </label>
                    <input id="img-uploader" hidden type="file" name="image" accept="image/*">
                    <br><br>
                    <input class="edit-module-name" type="text" name="name" value="">
                    <br><br>
                    <input style="width: 15%" class="edit-module-name" type="number" name="time" value="">
                    <span style="font-size: 2.5rem; font-weight: bold">seconds per question</span>
                    <br><br>
                    <div class="buttons">
                        <button type="submit" class="save">Save Module</button>
                    </div>
                </form>
            </div>

        </div>

        <div class="products-preview">

            <c:forEach var="module" items="${modules}" varStatus="loop">
                <div class="preview" data-target="p-${loop.index}">
                    <h3>Edit Module</h3>   
                    <form method="post" action="update_module" enctype="multipart/form-data">
                        <i class="fas fa-times"></i>
                        <label for="img-uploader${loop.index}" id="update-image-label">
                            <img src="./IMAGES/${module.moduleImage}" onerror="this.onerror=null; this.src='./IMAGES/imgupload.png'" alt="./IMAGES/imgupload.png">
                            <i class="fas fa-upload "></i>
                        </label>
                        <input id="img-uploader${loop.index}" hidden type="file" name="updateimage" accept="image/*">
                        <br><br>
                        <input class="edit-module-name" type="text" name="name" value="${module.moduleName}">
                        <br><br>
                        <input style="width: 15%" class="edit-module-name" type="number" name="time" value="${module.timePerQuiz}">
                        <span style="font-size: 2.5rem; font-weight: bold">seconds per question</span>
                        <br><br>
                        <div class="buttons">
                            <input id="moduleIdField_${loop.index}" hidden type="text" name="moduleID" value="${module.id}">
                            <button class="update" type="submit">Update</button>
                            <button class="delete" id="delBtn_${loop.index}" type="button">Delete</button>
                        </div>
                    </form>
                </div>
            </c:forEach>

        </div>

        <script>
            
            const numModules = ${moduleCount};
            
            for (let i = 0; i < numModules; i++) {
                document.getElementById("delBtn_"+i).addEventListener('click', () => {
                    const id = document.getElementById("moduleIdField_"+i).value;
                    const url = "delete_module?mid="+id;
                    window.location.href = url;
                });
            }
            
        </script>
        <script src="./JS/script.js" defer></script>
    </body>
</html>