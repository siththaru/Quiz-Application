package com.quiz.ejb;

import com.quiz.entity.Admin;
import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author sitht
 */
@Remote
public interface AdminSessionBeanRemote {
 
    void save(Admin admin);

    void update(Admin admin);

    void delete(Admin admin);

    Admin findById(Integer adminId);
    
    List<Admin> getAllAdmins();
    
}
