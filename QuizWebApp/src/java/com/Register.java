package com;

import com.quiz.ejb.CandidateSessionBeanRemote;
import com.quiz.entity.Candidate;
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
@WebServlet(name = "Register", urlPatterns = {"/register"})
public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            InitialContext ic = new InitialContext();
            CandidateSessionBeanRemote csbr = (CandidateSessionBeanRemote) ic.lookup("com.quiz.ejb.CandidateSessionBeanRemote");
            
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            Candidate candidate = new Candidate();
            candidate.setName(name);
            candidate.setEmail(email);
            candidate.setPassword(password);
            
            csbr.save(candidate);
            
            response.sendRedirect("login.jsp");
            
        } catch (NamingException ex) {
            ex.printStackTrace();
        }
    }
    
}
