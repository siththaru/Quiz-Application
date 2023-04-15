
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
@WebServlet(name = "DeleteCandidate", urlPatterns = {"/delete_candidate"})
public class DeleteCandidate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String cid = request.getParameter("candidateID");
        try {
            InitialContext ic = new InitialContext();
            CandidateSessionBeanRemote csbr = (CandidateSessionBeanRemote) ic.lookup("com.quiz.ejb.CandidateSessionBeanRemote");
            
            Candidate c = csbr.findById(Integer.valueOf(cid));
            
            csbr.delete(c);
            
            response.sendRedirect("index.jsp");
            
        } catch (Exception e) {
        }
        
    }
    
}
