package com.quiz.exception;

import javax.ejb.ApplicationException;

/**
 *
 * @author sitht
 */
@ApplicationException(rollback = true)
public class AccountException extends RuntimeException{
    
}
