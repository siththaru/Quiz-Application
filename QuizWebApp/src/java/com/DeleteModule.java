package com;

import com.quiz.ejb.ModuleSessionBeanRemote;
import com.quiz.entity.Module;
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
@WebServlet(name = "DeleteModule", urlPatterns = {"/delete_module"})
public class DeleteModule extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mid = request.getParameter("mid");
            
        try {
            InitialContext ic = new InitialContext();
            ModuleSessionBeanRemote msbr = (ModuleSessionBeanRemote) ic.lookup("com.quiz.ejb.ModuleSessionBeanRemote");
            
            Module a = msbr.findById(Integer.valueOf(mid));
            
            msbr.delete(a);
            
            response.sendRedirect("manageModules.jsp");
            
        } catch (Exception e) {
        }
    }
    
}
