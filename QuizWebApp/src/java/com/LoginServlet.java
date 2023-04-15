package com;

import com.quiz.ejb.LoginSessionBeanRemote;
import com.quiz.entity.Candidate;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sitht
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @EJB
    private LoginSessionBeanRemote loginSession;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Candidate c = loginSession.authenticateUser(email, password);
            
            if(c != null){
                if(request.getSession() == null){
                    request.login("candidate","cand@456");
                }
                request.getSession().setAttribute("candidateId", c.getId());
                response.sendRedirect("candidatePanel.jsp");
            }else{
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            
        }
    }
    
}
