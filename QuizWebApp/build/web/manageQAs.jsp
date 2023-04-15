<%-- 
    Document   : ManageQAs
    Created on : Apr 5, 2023, 12:29:19 PM
    Author     : sitht
--%>

<%@page import="com.quiz.entity.Module"%>
<%@page import="com.quiz.ejb.ModuleSessionBeanRemote"%>
<%@page import="java.util.List"%>
<%@page import="com.quiz.entity.QA"%>
<%@page import="com.quiz.ejb.QASessionBeanRemote"%>
<%@page import="javax.naming.InitialContext"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QAs</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="./CSS/style.css">
        <link rel="stylesheet" type="text/css" href="./CSS/table.css">
        <link rel="stylesheet" type="text/css" href="./CSS/qa-form.css">
    </head>
    <body>
    <center><h1>QAs Management</h1></center>
        <hr>
        <a href="adminPanel.jsp" class="back"><i class="fas fa-arrow-left"></i> &nbsp; Back</a>

        <%
            InitialContext ic = new InitialContext();
            ModuleSessionBeanRemote msbr = (ModuleSessionBeanRemote) ic.lookup("com.quiz.ejb.ModuleSessionBeanRemote");
            List<Module> modules = msbr.getAllModules();
            pageContext.setAttribute("modules", modules);
        %>

        <div class="formbold-main-wrapper formbold-qa">
            <form action="add_qa" method="post">

                <div class="flex flex-wrap formbold-form-wrapper">
                    <div class="formbold-mb-5">
                        <label for="module" class="formbold-form-label"> Module </label>
                        <select name="moduleId" id="module" class="formbold-form-input">
                            <c:forEach var="module" items="${modules}">
                                <option value="${module.id}">${module.moduleName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="formbold-mb-5">
                        <label for="question" class="formbold-form-label"> Question </label>
                        <input type="text" name="question" id="question" placeholder="Enter the question" class="formbold-form-input" />
                    </div>

                    <div class="formbold-mb-5">
                        <label for="answer1" class="formbold-form-label"> Answer 1 </label>
                        <input type="text"  name="answer1" id="answer1" placeholder="Enter Answer 1" class="formbold-form-input" />
                    </div>

                    <div class="formbold-mb-5">
                        <label for="answer2" class="formbold-form-label"> Answer 2 </label>
                        <input type="text"  name="answer2" id="answer2" placeholder="Enter Answer 2" class="formbold-form-input" />
                    </div>

                    <div class="formbold-mb-5">
                        <label for="answer3" class="formbold-form-label"> Answer 3 </label>
                        <input type="text"  name="answer3" id="answer3" placeholder="Enter Answer 3" class="formbold-form-input" />
                    </div>

                    <div class="formbold-mb-5">
                        <label for="answer4" class="formbold-form-label"> Answer 4 </label>
                        <input type="text"  name="answer4" id="answer4" placeholder="Enter Answer 4" class="formbold-form-input" />
                    </div>

                    <div class="formbold-mb-5">
                        <label for="correctAnswer" class="formbold-form-label"> Correct Answer </label>
                        <select name="correctAnswer" id="correctAnswer" class="formbold-form-input">
                            <option value="answer1">Answer 1</option>
                            <option value="answer2">Answer 2</option>
                            <option value="answer3">Answer 3</option>
                            <option value="answer4">Answer 4</option>
                        </select>
                    </div>
                    <br><br>
                </div>
                <div>
                    <button type="submit" class="formbold-btn">Save Question and Answers</button>
                </div>
            </form>
        </div>


        <br><br><br>
        
        <form class="search-form" action="search_qa" method="get">
            <div class="formbold-mb-5 flex">
            <select name="moduleId" class="formbold-form-input">
                <option value="all">All</option>
                <c:forEach var="module" items="${modules}">
                    <option value="${module.id}">${module.moduleName}</option>
                </c:forEach>
            </select>
            <button class="formbold-btn">Search</button>
            </div>
        </form>


        <div class="table-wrapper">
            <table class="fl-table">
                <tr>
                    <th>Module</th>
                    <th>Question</th>
                    <th>Answer 1</th>
                    <th>Answer 2</th>
                    <th>Answer 3</th>
                    <th>Answer 4</th>
                    <th>Correct Answer</th>
                    <th>Action</th>
                </tr>
                <%
                    QASessionBeanRemote qasbr = (QASessionBeanRemote) ic.lookup("com.quiz.ejb.QASessionBeanRemote");

                    List<QA> qaList = (List<QA>) request.getAttribute("searchResult");
                    if (qaList == null) {
                        qaList = qasbr.getAllQAs();
                    }

                    pageContext.setAttribute("qas", qaList);
                    int qaCount = 0;
                    for (QA singleQA : qaList) {
                        qaCount++;
                    }
                    pageContext.setAttribute("qaCount", qaCount);
                %>

                <c:forEach var="qa" items="${qas}" varStatus="loop">
                    <tr>
                    <form action="update_qa" method="post">

                        <td>
                            <span class="spn${loop.index}" id="spn1_${loop.index}">${qa.module.moduleName}</span>
                            <select class="hiddenInputs hiddenInputs${loop.index}" id="input1_${loop.index}" name="moduleId">
                                <option selected hidden value="${qa.module.id}">${qa.module.moduleName}</option>
                                <c:forEach var="module" items="${modules}">
                                    <option value="${module.id}">${module.moduleName}</option>
                                </c:forEach>
                            </select>
                        </td>

                        <td><span class="spn${loop.index}" id="spn2_${loop.index}">${qa.question}</span><input class="hiddenInputs hiddenInputs${loop.index}" id="input2_${loop.index}" type="text" name="question" value="${qa.question}"></td>
                        <td><span class="spn${loop.index}" id="spn3_${loop.index}">${qa.answer1}</span><input class="hiddenInputs hiddenInputs${loop.index}" id="input3_${loop.index}" type="text" name="answer1" value="${qa.answer1}"></td>
                        <td><span class="spn${loop.index}" id="spn4_${loop.index}">${qa.answer2}</span><input class="hiddenInputs hiddenInputs${loop.index}" id="input4_${loop.index}" type="text" name="answer2" value="${qa.answer2}"></td>
                        <td><span class="spn${loop.index}" id="spn5_${loop.index}">${qa.answer3}</span><input class="hiddenInputs hiddenInputs${loop.index}" id="input5_${loop.index}" type="text" name="answer3" value="${qa.answer3}"></td>
                        <td><span class="spn${loop.index}" id="spn6_${loop.index}">${qa.answer4}</span><input class="hiddenInputs hiddenInputs${loop.index}" id="input6_${loop.index}" type="text" name="answer4" value="${qa.answer4}"></td>

                        <td>
                            <span class="spn${loop.index}" id="spn7_${loop.index}">
                                <c:if test="${qa.correctAnswer == qa.answer1}">
                                    Answer 1
                                </c:if>
                                <c:if test="${qa.correctAnswer == qa.answer2}">
                                    Answer 2
                                </c:if>
                                <c:if test="${qa.correctAnswer == qa.answer3}">
                                    Answer 3
                                </c:if>
                                <c:if test="${qa.correctAnswer == qa.answer4}">
                                    Answer 4
                                </c:if>
                            </span>
                            <select class="hiddenInputs hiddenInputs${loop.index}" id="input7_${loop.index}" name="correctAnswer">
                                <c:if test="${qa.correctAnswer == qa.answer1}">
                                    <option selected hidden value="answer1">Answer 1</option>
                                </c:if>
                                <c:if test="${qa.correctAnswer == qa.answer2}">
                                    <option selected hidden value="answer1">Answer 2</option>
                                </c:if>
                                <c:if test="${qa.correctAnswer == qa.answer3}">
                                    <option selected hidden value="answer1">Answer 3</option>
                                </c:if>
                                <c:if test="${qa.correctAnswer == qa.answer4}">
                                    <option selected hidden value="answer1">Answer 4</option>
                                </c:if>
                                <option value="answer1">Answer 1</option>
                                <option value="answer2">Answer 2</option>
                                <option value="answer3">Answer 3</option>
                                <option value="answer4">Answer 4</option>
                            </select>
                        </td>

                        <td style="display: flex; flex-wrap: nowrap;">
                            <input id="qaIdField_${loop.index}" type="text" name="qaID" hidden value="${qa.id}">
                            <button class="edit-btn" id="editBtn_${loop.index}" type="button">Edit</button>
                            <button class="cancel-btn hiddenInputs${loop.index}" id="cancelBtn_${loop.index}" type="button"></button>
                            <button class="ok-btn hiddenInputs${loop.index}" id="okBtn_${loop.index}" type="submit"></button>
                            <button class="del-btn" id="delBtn_${loop.index}" type="button">Delete</button>
                        </td>
                    </form>
                    </tr>
                </c:forEach>

            </table>
        </div>

        <script>
        const numQAs = ${qaCount}

        for (let i = 0; i < numQAs; i++) {
            const inputs = document.querySelectorAll(".hiddenInputs" + i);
            const spans = document.querySelectorAll(".spn" + i);
            const editBtn = document.getElementById("editBtn_" + i);
            const cancelBtn = document.getElementById("cancelBtn_" + i);
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
                const id = document.getElementById("qaIdField_" + i).value;
                const url = "delete_qa?qaid=" + id;
                window.location.href = url;
            });
        }
        </script>
    </body>
</html>
