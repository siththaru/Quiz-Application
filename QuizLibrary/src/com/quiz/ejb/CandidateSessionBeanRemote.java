package com.quiz.ejb;

import com.quiz.entity.Candidate;
import javax.ejb.Remote;

/**
 *
 * @author sitht
 */
@Remote
public interface CandidateSessionBeanRemote {
    
    void save(Candidate candidate);

    void update(Candidate candidate);

    void delete(Candidate candidate);

    Candidate findById(Integer candidateId);
    
}
