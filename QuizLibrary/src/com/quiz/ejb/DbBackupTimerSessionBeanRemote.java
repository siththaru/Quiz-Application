/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/J2EE/EJB30/SessionRemote.java to edit this template
 */
package com.quiz.ejb;

import javax.ejb.Remote;

/**
 *
 * @author sitht
 */
@Remote
public interface DbBackupTimerSessionBeanRemote {
    
    public void myTimer();
}
