package com;

import com.quiz.ejb.CandidateSessionBeanRemote;
import com.quiz.ejb.ModuleSessionBeanRemote;
import com.quiz.ejb.QASessionBeanRemote;
import com.quiz.ejb.ResultSessionBeanRemote;
import com.quiz.entity.Candidate;
import com.quiz.entity.Module;
import com.quiz.entity.QA;
import com.quiz.entity.Result;
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
@WebServlet(name = "AddResult", urlPatterns = {"/add_result"})
public class AddResult extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            InitialContext ic = new InitialContext();
            ResultSessionBeanRemote rsbr = (ResultSessionBeanRemote) ic.lookup("com.quiz.ejb.ResultSessionBeanRemote");
            ModuleSessionBeanRemote msbr = (ModuleSessionBeanRemote) ic.lookup("com.quiz.ejb.ModuleSessionBeanRemote");
            CandidateSessionBeanRemote csbr = (CandidateSessionBeanRemote) ic.lookup("com.quiz.ejb.CandidateSessionBeanRemote");
            
            String moduleId = request.getParameter("moduleID");
            String candidateId = request.getParameter("candidateID");
            
            Module module = msbr.findById(Integer.valueOf(moduleId));
            Candidate candidate = csbr.findById(Integer.valueOf(candidateId));
            
            String score = request.getParameter("score");
            
            Result rs = new Result();
            rs.setCandidate(candidate);
            rs.setModule(module);
            rs.setScore(score);
            
            rsbr.save(rs);
            response.getWriter().write("Done");
//            response.sendRedirect("manageQAs.jsp");
            
        } catch (NamingException ex) {
            ex.printStackTrace();
        }
        
    }
    
}
