
package com.quiz.ejb;

import com.quiz.entity.Admin;
import com.quiz.exception.AccountException;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author sitht
 */
@Stateless
public class AdminSessionBean implements AdminSessionBeanRemote {

    @PersistenceContext(unitName = "QuizEJBModulePU")
    private EntityManager em;
    
    @Override
    public void save(Admin admin) {
        em.persist(admin);
    }

    @Override
    public void update(Admin admin) {
        if(!em.contains(admin)){
            admin = em.merge(admin);
        }
        em.merge(admin);
    }

    @Override
    public void delete(Admin admin) {
        if(!em.contains(admin)){
            admin = em.merge(admin);
        }
        em.remove(admin);
    }

    @Override
    public Admin findById(Integer adminId) {
        return em.find(Admin.class, adminId);
    }
    
    @Override
    public List<Admin> getAllAdmins() {
        try {
            return em.createQuery("SELECT a FROM Admin a", Admin.class).getResultList();
        } catch (AccountException ae) {
            ae.printStackTrace();
            return null;
        }
    }
    
}
