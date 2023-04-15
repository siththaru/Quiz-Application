package com;

import com.quiz.ejb.QASessionBeanRemote;
import com.quiz.entity.QA;
import java.io.IOException;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sitht
 */
@WebServlet(name = "DeleteQA", urlPatterns = {"/delete_qa"})
public class DeleteQA extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String qaid = request.getParameter("qaid");
            
        try {
            InitialContext ic = new InitialContext();
            QASessionBeanRemote qasbr = (QASessionBeanRemote) ic.lookup("com.quiz.ejb.QASessionBeanRemote");
            
            QA a = qasbr.findById(Integer.valueOf(qaid));
            
            qasbr.delete(a);
            
            response.sendRedirect("manageQAs.jsp");
            
        } catch (Exception e) {
        }
        
    }
    
}
