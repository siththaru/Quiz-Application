package com;

import com.quiz.ejb.QASessionBeanRemote;
import com.quiz.entity.QA;
import java.io.IOException;
import java.util.List;
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
@WebServlet(name = "SearchQA", urlPatterns = {"/search_qa"})
public class SearchQA extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            InitialContext ic = new InitialContext();
            QASessionBeanRemote qasbr = (QASessionBeanRemote) ic.lookup("com.quiz.ejb.QASessionBeanRemote");
            
            String moduleId = request.getParameter("moduleId");
            
            if(moduleId.equals("all")){
                List<QA> allQAs = qasbr.getAllQAs();
                response.sendRedirect("manageQAs.jsp?searchResult="+allQAs);
            }else{
                List<QA> allQAs = qasbr.searchQA(Integer.valueOf(moduleId));
                request.setAttribute("searchResult", allQAs);
                request.getRequestDispatcher("manageQAs.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
        }
        
    }
    
}
