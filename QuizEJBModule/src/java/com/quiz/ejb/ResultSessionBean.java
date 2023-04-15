package com.quiz.ejb;

import com.quiz.entity.Result;
import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author sitht
 */
@Stateless
public class ResultSessionBean implements ResultSessionBeanRemote {

    @PersistenceContext(unitName = "QuizEJBModulePU")
    private EntityManager em;
    
    @RolesAllowed({"admin","candidate"})
    @Override
    public void save(Result result) {
        em.persist(result);
    }

    @Override
    public void update(Result result) {
        em.merge(result);
    }

    @Override
    public void delete(Result result) {
        if(!em.contains(result)){
            result = em.merge(result);
        }
        em.remove(result);
    }

    @Override
    public Result findById(Integer resultId) {
        return em.find(Result.class, resultId);
    }
    
}
