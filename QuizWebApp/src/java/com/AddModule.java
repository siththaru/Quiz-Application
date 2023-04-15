package com;

import com.quiz.ejb.AdminSessionBeanRemote;
import com.quiz.ejb.ModuleSessionBeanRemote;
import com.quiz.entity.Module;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author sitht
 */
@WebServlet(name = "AddModule", urlPatterns = {"/add_module"})
@MultipartConfig
public class AddModule extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            InitialContext ic = new InitialContext();
            ModuleSessionBeanRemote asbr = (ModuleSessionBeanRemote) ic.lookup("com.quiz.ejb.ModuleSessionBeanRemote");

            String name = request.getParameter("name");
            String time = request.getParameter("time");
            Part filePart = request.getPart("image");
            String fileName = getFileName(filePart);
            
            if(!fileName.isEmpty()){
                String uploadPath = getServletContext().getRealPath("")+ File.separator + "IMAGES";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                  uploadDir.mkdir();
                }
                File file = new File(uploadDir, fileName);
                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                }
            }
            
            Module module = new Module();
            module.setModuleName(name);
            if(!fileName.isEmpty()){
                module.setModuleImage(fileName);
            }
            module.setTimePerQuiz(Integer.parseInt(time));
            
            asbr.save(module);

            response.sendRedirect("manageModules.jsp");

        } catch (NamingException ex) {
            ex.printStackTrace();
        }

    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }

}
