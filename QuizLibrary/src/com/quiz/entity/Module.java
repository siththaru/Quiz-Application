package com.quiz.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author sitht
 */

@Entity
public class Module implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String moduleName;
    private String moduleImage;
    private int timePerQuiz;
    @OneToMany(mappedBy = "module")
    private List<Result> result;
    @OneToMany(mappedBy = "module")
    private List<QA> qa;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }    

    public String getModuleImage() {
        return moduleImage;
    }

    public void setModuleImage(String moduleImage) {
        this.moduleImage = moduleImage;
    }
    
    public int getTimePerQuiz() {
        return timePerQuiz;
    }

    public void setTimePerQuiz(int timePerQuiz) {
        this.timePerQuiz = timePerQuiz;
    }
    
    public List<Result> getResult() {
        return result;
    }

    public void setResult(List<Result> result) {
        this.result = result;
    }

    public List<QA> getQa() {
        return qa;
    }

    public void setQa(List<QA> qa) {
        this.qa = qa;
    }
    
}
