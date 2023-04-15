<%-- 
    Document   : quizArea
    Created on : Apr 7, 2023, 5:33:02 AM
    Author     : sitht
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.quiz.entity.QA"%>
<%@page import="java.util.List"%>
<%@page import="com.quiz.ejb.QASessionBeanRemote"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="./CSS/quiz.css">
        <title>Quiz</title>
    </head>
    <body>
        <%
            InitialContext ic = new InitialContext();
            QASessionBeanRemote qasbr = (QASessionBeanRemote) ic.lookup("com.quiz.ejb.QASessionBeanRemote");
            List<QA> qaList = qasbr.searchQA(Integer.parseInt(request.getParameter("mid")));
            System.out.println(request.getParameter("mid"));
            boolean isQuizAvailable = false;
            
            if (!qaList.isEmpty()) {
                pageContext.setAttribute("qas", qaList);
                int qaCount = 0;
                for (QA singleQA : qaList) {
                    qaCount++;
                }
                pageContext.setAttribute("qaCount", qaCount);
                isQuizAvailable = true;
            }
            
            pageContext.setAttribute("isAvailable", isQuizAvailable);
        %>
        
        <c:if test="${isAvailable}">
        <!-- start Quiz button -->
        <div class="start_btn"><button>Start Quiz</button></div>
        <div class="back_btn" style="margin-top: 100px">
            <button>< Go Back</button>
        </div>

        <!-- Info Box -->
        <div class="info_box">
            <div class="info-title"><span>Some Rules of this Quiz</span></div>
            <div class="info-list">
                <div class="info">1. You will have only a limited time per each question.</div>
                <div class="info">2. Once you select your answer, it can't be undone.</div>
                <div class="info">3. You can't select any option once time goes off.</div>
                <div class="info">4. You can't exit from the Quiz while you're playing.</div>
                <div class="info">5. You'll get points on the basis of your correct answers.</div>
            </div>
            <div class="buttons">
                <button class="quit">Exit Quiz</button>
                <button class="restart">Continue</button>
            </div>
        </div>

        <div class="quiz_box">
            <header>
                <div class="title">Online Quiz Application</div>
                <div class="timer">
                    <div class="time_left_txt">Time Left</div>
                    <div id="timeRemaining" class="timer_sec">${qas[0].module.timePerQuiz}</div>
                </div>
                <div class="time_line"></div>
            </header>
            <section>
                <div class="que_text">
                    <!-- Here I've inserted question from JavaScript -->
                </div>
                <div class="option_list">
                    <!-- Here I've inserted options from JavaScript -->
                </div>
            </section>

            <!-- footer of Quiz Box -->
            <footer>
                <div class="total_que">
                    <!-- Here I've inserted Question Count Number from JavaScript -->
                </div>
                <button class="next_btn">Next</button>
            </footer>
        </div>

        <!-- Result Box -->
        <div class="result_box">
            <div class="icon">
                <i class="fas fa-crown"></i>
            </div>
            <div class="complete_text">You've completed the Quiz!</div>
            <div class="score_text">
            <!--from js-->
            </div>
            <input name="score" hidden id="scoreId" value="">
            <input name="moduleID" hidden id="moduleId" value="<%= request.getParameter("mid") %>">
            <input name="candidateID" hidden id="candidateId" value="<%= request.getSession().getAttribute("candidateId") %>">
            <div class="buttons">
                <button class="quit">Quit Quiz</button>
            </div>
        </div>
        </c:if>
        <c:if test="${!isAvailable}">
            <div class="quiz-unavailable-title"><span>No Questions Available!</span></div>
            <div class="back_btn"><button><i class="fas fa-arrow-left"></i> &nbsp; Go Back</button></div>
        </c:if>
       
        <script>
           const back_btn = document.querySelector(".back_btn button");
           back_btn.onclick = ()=>{
           window.location.href = "candidatePanel.jsp";
           }
           
            let questions = [
                <% 
                int number = 1;
                for (QA item : qaList) { 
                %>
                {
                        numb: <%= number %>,
                        question: "<%= item.getQuestion() %>",
                        answer: "<%= item.getCorrectAnswer()%>",
                        options: [
                            "<%= item.getAnswer1()%>",
                            "<%= item.getAnswer2()%>",
                            "<%= item.getAnswer3()%>",
                            "<%= item.getAnswer4()%>",
                        ]
                },
                <% 
                   number++;
                   } 
                %>
            ];

            <% if(isQuizAvailable) {%>
            timeFromDatabase = ${qas[0].module.timePerQuiz}
            <%}%>
        </script>
        <c:if test="${isAvailable}">
        <script src="./JS/quiz.js"></script>
        </c:if>
    </body>
</html>
