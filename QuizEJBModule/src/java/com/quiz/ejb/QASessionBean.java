package com.quiz.ejb;

import com.quiz.entity.QA;
import com.quiz.exception.AccountException;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 *
 * @author sitht
 */
@Stateless
public class QASessionBean implements QASessionBeanRemote {

    @PersistenceContext(unitName = "QuizEJBModulePU")
    private EntityManager em;
    
    @Override
    public void save(QA qa) {
        em.persist(qa);
    }

    @Override
    public void update(QA qa) {
        em.merge(qa);
    }

    @Override
    public void delete(QA qa) {
        if(!em.contains(qa)){
            qa = em.merge(qa);
        }
        em.remove(qa);
    }

    @Override
    public QA findById(Integer qaId) {
        return em.find(QA.class, qaId);
    }
    
    @Override
    public List<QA> getAllQAs() {
        return em.createQuery("SELECT qa FROM QA qa", QA.class).getResultList();
    }
    
    @Override
    public List<QA> searchQA(Integer moduleId) {
        TypedQuery<QA> query = em.createQuery("SELECT q FROM QA q WHERE q.module.id=:moduleId", QA.class);
        query.setParameter("moduleId", moduleId);
        try {
            List<QA> qaList = query.getResultList();
            return qaList;
        } catch (NoResultException | AccountException e) {
            return null;
        }
        
    }
    
}
