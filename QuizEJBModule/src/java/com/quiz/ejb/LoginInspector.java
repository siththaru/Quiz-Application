package com.quiz.ejb;

import java.util.logging.Logger;
import javax.interceptor.AroundInvoke;
import javax.interceptor.InvocationContext;

/**
 *
 * @author sitht
 */
public class LoginInspector {
    
    @AroundInvoke
    public Object intercept(InvocationContext ic) throws Exception {

        System.out.println("LOGGED IN...!!!");

        return ic.proceed();
    }

    
}
