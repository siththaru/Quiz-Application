package com.quiz.ejb;

import com.quiz.entity.Admin;
import com.quiz.entity.Candidate;
import com.quiz.exception.AccountException;
import javax.ejb.Stateless;
import javax.interceptor.Interceptors;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 *
 * @author sitht
 */
@Interceptors(LoginInspector.class)
@Stateless
public class LoginSessionBean implements LoginSessionBeanRemote {    
    
    @PersistenceContext(unitName = "QuizEJBModulePU")
    private EntityManager em;
    
    @Override
    public Candidate authenticateUser(String email, String password) {
        
        TypedQuery<Candidate> query = em.createQuery("SELECT c FROM Candidate c WHERE c.email = :email AND c.password = :password", Candidate.class);
        query.setParameter("email", email);
        query.setParameter("password", password);
        
        try {
            Candidate candidate = query.getSingleResult();
            return candidate;
        } catch (NoResultException | AccountException e) {
            return null;
        }
    }

    @Override
    public Admin authenticateAdmin(String username, String password) {
        TypedQuery<Admin> query = em.createQuery("SELECT a FROM Admin a WHERE a.username = :username AND a.password = :password", Admin.class);
        query.setParameter("username", username);
        query.setParameter("password", password);
        
        try {
            Admin admin = query.getSingleResult();
            return admin;
        } catch (NoResultException | AccountException e) {
            return null;
        }
    }
    
}
