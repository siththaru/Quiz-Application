<%-- 
    Document   : candidatePanel
    Created on : Apr 6, 2023, 7:53:35 PM
    Author     : sitht
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="com.quiz.entity.Module"%>
<%@page import="com.quiz.ejb.ModuleSessionBeanRemote"%>
<%@page import="com.quiz.entity.Candidate"%>
<%@page import="com.quiz.ejb.CandidateSessionBeanRemote"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    InitialContext ic = new InitialContext();
    CandidateSessionBeanRemote csbr = (CandidateSessionBeanRemote) ic.lookup("com.quiz.ejb.CandidateSessionBeanRemote");
    Candidate c = null;
    if (request.getSession().getAttribute("candidateId") != null) {
        c = csbr.findById((Integer) request.getSession().getAttribute("candidateId"));
    } else {
        response.sendRedirect("login.jsp");
    }
    pageContext.setAttribute("currCandidate", c);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="./CSS/modules.css">
        <title>Candidate Panel</title>
    </head>
    <body>
        <div class="container">

            <div style="display: flex; justify-content: space-between; align-items: center">
                <a style="flex: none;" href="profile.jsp" class="back"><i class="fas fa-user"></i> &nbsp; Profile</a>
                <h2 class="title"> Welcome ${currCandidate.name} </h2>
                <a style="flex: none;" href="logout?msg=candidate" class="back"><i class="fas fa-sign-out-alt"></i> &nbsp; Logout</a>
            </div>
                <br><br>
            <h3 class="score">Pick a Module to Start</h3>
            <br>

            <div class="products-container">

                <%
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
                    <div class="product" id="module${loop.index}">
                        <input id="moduleID${loop.index}" type="text" hidden value="${module.id}">
                        <img src="./IMAGES/${module.moduleImage}" alt="">
                        <h3>${module.moduleName}</h3>
                    </div>
                </c:forEach>

            </div>
        </div>
        <script>
                const numModules = ${moduleCount};

                for (let i = 0; i < numModules; i++) {
                    const module = document.getElementById("module"+i)
                    module.addEventListener('click', () => {
                        const id = document.getElementById("moduleID" + i).value;
                        const url = "quizArea.jsp?mid=" + id;
                        window.location.href = url;
                    });
                }
        </script>    
    </body>
</html>
