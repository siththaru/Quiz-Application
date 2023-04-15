package com.quiz.ejb;

import com.quiz.entity.Result;
import javax.ejb.Remote;

/**
 *
 * @author sitht
 */
@Remote
public interface ResultSessionBeanRemote {
    
    void save(Result result);

    void update(Result result);

    void delete(Result result);

    Result findById(Integer resultId);
    
}
