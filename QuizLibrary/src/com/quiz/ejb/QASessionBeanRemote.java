
package com.quiz.ejb;

import com.quiz.entity.QA;
import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author sitht
 */
@Remote
public interface QASessionBeanRemote {
    
    void save(QA qa);

    void update(QA qa);

    void delete(QA qa);

    QA findById(Integer qaId);
    
    List<QA> getAllQAs();
    
    List<QA> searchQA(Integer moduleId);
}
