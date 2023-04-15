package com.quiz.ejb;

import com.quiz.entity.Candidate;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author sitht
 */
@Stateless
public class CandidateSessionBean implements CandidateSessionBeanRemote {

    @PersistenceContext(unitName = "QuizEJBModulePU")
    private EntityManager em;
    
    
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    @Override
    public void save(Candidate candidate) {
        em.persist(candidate);
    }

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    @Override
    public void update(Candidate candidate) {
        em.merge(candidate);
    }

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    @Override
    public void delete(Candidate candidate) {
        if(!em.contains(candidate)){
            candidate = em.merge(candidate);
        }
        em.remove(candidate);
    }

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    @Override
    public Candidate findById(Integer candidateId) {
        return em.find(Candidate.class, candidateId);
    }
    
}
