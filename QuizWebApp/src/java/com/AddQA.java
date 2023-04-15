package com;

import com.quiz.ejb.ModuleSessionBeanRemote;
import com.quiz.ejb.QASessionBeanRemote;
import com.quiz.entity.Module;
import com.quiz.entity.QA;
import java.io.IOException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sitht
 */
@WebServlet(name = "AddQA", urlPatterns = {"/add_qa"})
public class AddQA extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            InitialContext ic = new InitialContext();
            QASessionBeanRemote qasbr = (QASessionBeanRemote) ic.lookup("com.quiz.ejb.QASessionBeanRemote");
            ModuleSessionBeanRemote msbr = (ModuleSessionBeanRemote) ic.lookup("com.quiz.ejb.ModuleSessionBeanRemote");
            
            String moduleId = request.getParameter("moduleId");
            
            Module module = msbr.findById(Integer.valueOf(moduleId));
            
            String question = request.getParameter("question");
            String answer1 = request.getParameter("answer1");
            String answer2 = request.getParameter("answer2");
            String answer3 = request.getParameter("answer3");
            String answer4 = request.getParameter("answer4");
            
            String correctAnswer = request.getParameter("correctAnswer");
            if(correctAnswer.equals("answer1")){
                correctAnswer = answer1;
            }else if (correctAnswer.equals("answer2")) {
                correctAnswer = answer2;
            }else if (correctAnswer.equals("answer3")) {
                correctAnswer = answer3;
            }else{
                correctAnswer = answer4;
            }
            
            
            QA qa = new QA();
            qa.setQuestion(question);
            qa.setAnswer1(answer1);
            qa.setAnswer2(answer2);
            qa.setAnswer3(answer3);
            qa.setAnswer4(answer4);
            qa.setCorrectAnswer(correctAnswer);
            qa.setModule(module);
            
            qasbr.save(qa);
            
            response.sendRedirect("manageQAs.jsp");
            
        } catch (NamingException ex) {
            ex.printStackTrace();
        }
        
    }
    
}
