package com;

import com.quiz.ejb.CandidateSessionBeanRemote;
import com.quiz.entity.Candidate;
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
@WebServlet(name = "UpdateCandidate", urlPatterns = {"/update_candidate"})
public class UpdateCandidate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            InitialContext ic = new InitialContext();
            CandidateSessionBeanRemote csbr = (CandidateSessionBeanRemote) ic.lookup("com.quiz.ejb.CandidateSessionBeanRemote");
            
            String cid = request.getParameter("candidateID");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            Candidate c = csbr.findById(Integer.valueOf(cid));
            
            c.setName(name);
            c.setEmail(email);
            if(!password.isEmpty()){
                c.setPassword(password);
            }
            
            csbr.update(c);
            
            response.sendRedirect("profile.jsp");
            
        } catch (Exception e) {
        }
        
    }
    
}
