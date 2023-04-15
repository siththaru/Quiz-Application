package com;

import com.quiz.ejb.AdminSessionBeanRemote;
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
@WebServlet(name = "UpdateAdmin", urlPatterns = {"/update_admin"})
public class UpdateAdmin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            
        try {
            InitialContext ic = new InitialContext();
            AdminSessionBeanRemote asbr = (AdminSessionBeanRemote) ic.lookup("com.quiz.ejb.AdminSessionBeanRemote");
            
            String aid = request.getParameter("adminID");
            String name = request.getParameter("name");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            Admin a = asbr.findById(Integer.valueOf(aid));
            
            a.setAdminName(name);
            a.setUsername(username);
            a.setPassword(password);
            
            asbr.update(a);
            
            response.sendRedirect("manageAdmins.jsp");
            
        } catch (Exception e) {
        }
    }
    
    
}
