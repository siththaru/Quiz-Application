package com.quiz.ejb;

import com.quiz.entity.Module;
import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author sitht
 */

@Remote
public interface ModuleSessionBeanRemote {
    
    void save(Module module);

    void update(Module module);

    void delete(Module module);

    Module findById(Integer moduleId);
    
    List<Module> getAllModules();
}
