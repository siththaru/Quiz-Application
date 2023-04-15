package com.quiz.ejb;

import com.quiz.entity.Module;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author sitht
 */
@Stateless
public class ModuleSessionBean implements ModuleSessionBeanRemote {

    @PersistenceContext(unitName = "QuizEJBModulePU")
    private EntityManager em;
    
    @Override
    public void save(Module module) {
        em.persist(module);
        
    }

    @Override
    public void update(Module module) {
        em.merge(module);
    }

    @Override
    public void delete(Module module) {
        if(!em.contains(module)){
            module = em.merge(module);
        }
        em.remove(module);
    }

    @Override
    public Module findById(Integer moduleId) {
        return em.find(Module.class, moduleId);
    }
    
    @Override
    public List<Module> getAllModules() {
        return em.createQuery("SELECT m FROM Module m", Module.class).getResultList();
    }
    
}
