<%-- 
    Document   : Profile
    Created on : Apr 6, 2023, 11:37:31 AM
    Author     : sitht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.quiz.entity.Candidate"%>
<%@page import="com.quiz.ejb.CandidateSessionBeanRemote"%>
<%@page import="javax.naming.InitialContext"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./CSS/login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <title>Profile</title>
    </head>
    <body style="background: #cccccc">

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

        <div class="wrapper">
            <header>Profile</header>
            <form action="update_candidate" method="post">
                <div class="field name">
                    <div class="input-area">
                        <input type="text" name="name" placeholder="Full Name" value="${currCandidate.name}">
                        <i class="icon fas fa-user"></i>
                        <i class="error error-icon fas fa-exclamation-circle"></i>
                    </div>
                </div>
                <div class="field email">
                    <div class="input-area">
                        <input type="text" name="email" placeholder="Email Address" value="${currCandidate.email}">
                        <i class="icon fas fa-envelope"></i>
                        <i class="error error-icon fas fa-exclamation-circle"></i>
                    </div>
                </div>
                <div class="field password">
                    <div class="input-area">
                        <input type="password" name="password" placeholder="Password">
                        <i class="icon fas fa-lock"></i>
                        <i class="error error-icon fas fa-exclamation-circle"></i>
                    </div>
                </div>
                <input type="text" hidden name="candidateID" value="${currCandidate.id}">
                <input type="submit" value="Update">
                <input type="submit" formaction="delete_candidate" formmethod="get" value="Delete">
            </form>
            <a style="font-weight: bold" href="./candidatePanel.jsp">< GO BACK</a>
        </div>



</body>
</html>
