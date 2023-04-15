package com;

import com.quiz.ejb.LoginSessionBeanRemote;
import com.quiz.entity.Admin;
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
@WebServlet(name = "LoginAdmin", urlPatterns = {"/admin_login"})
public class LoginAdmin extends HttpServlet {

    @EJB
    private LoginSessionBeanRemote loginSession;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            Admin a = loginSession.authenticateAdmin(username, password);
 
            if(a != null){ 
                if(request.getSession() == null){
                    request.login("admin","admin@456");
                }
                request.getSession().setAttribute("currAdminId", a.getId());
                response.sendRedirect("adminPanel.jsp");
            }else{
                response.sendRedirect("adminLogin.jsp");
            }
        } catch (Exception e) {
            
        }
    }
}
