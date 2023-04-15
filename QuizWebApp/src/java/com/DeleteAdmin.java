package com;

import com.quiz.ejb.AdminSessionBeanRemote;
import com.quiz.ejb.CandidateSessionBeanRemote;
import com.quiz.entity.Admin;
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
@WebServlet(name = "DeleteAdmin", urlPatterns = {"/delete_admin"})
public class DeleteAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String aid = request.getParameter("aid");
            
        try {
            InitialContext ic = new InitialContext();
            AdminSessionBeanRemote asbr = (AdminSessionBeanRemote) ic.lookup("com.quiz.ejb.AdminSessionBeanRemote");
            
            Admin a = asbr.findById(Integer.valueOf(aid));
            
            asbr.delete(a);
            
            response.sendRedirect("manageAdmins.jsp");
            
        } catch (Exception e) {
        }
        
    }
    
}
