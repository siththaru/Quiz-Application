package com.quiz.ejb;

import com.quiz.entity.Admin;
import com.quiz.entity.Candidate;
import javax.ejb.Remote;

/**
 *
 * @author sitht
 */
@Remote
public interface LoginSessionBeanRemote {
    
    Candidate authenticateUser(String email, String password);
            
    Admin authenticateAdmin(String username, String password);
}
