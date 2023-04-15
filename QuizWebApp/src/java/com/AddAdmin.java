package com;

import com.quiz.ejb.AdminSessionBeanRemote;
import com.quiz.entity.Admin;
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
@WebServlet(name = "AddAdmin", urlPatterns = {"/add_admin"})
public class AddAdmin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            InitialContext ic = new InitialContext();
            AdminSessionBeanRemote asbr = (AdminSessionBeanRemote) ic.lookup("com.quiz.ejb.AdminSessionBeanRemote");
            
            String name = request.getParameter("name");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            Admin admin = new Admin();
            admin.setAdminName(name);
            admin.setUsername(username);
            admin.setPassword(password);
            
            asbr.save(admin);
            
            response.sendRedirect("manageAdmins.jsp");
            
        } catch (NamingException ex) {
            ex.printStackTrace();
        }
    }
    
}
