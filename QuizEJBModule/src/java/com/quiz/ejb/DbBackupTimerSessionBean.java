package com.quiz.ejb;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.activation.DataSource;
import javax.annotation.Resource;
import javax.ejb.Schedule;
import javax.ejb.Singleton;
import javax.ejb.Stateless;

/**
 *
 * @author sitht
 */
@Stateless
public class DbBackupTimerSessionBean implements DbBackupTimerSessionBeanRemote {

    private static final Logger LOGGER = Logger.getLogger(DbBackupTimerSessionBean.class.getName());

    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyyMMdd-HHmmss");

    @Resource(lookup = "quizDbConnection")
    private DataSource dataSource;

    @Schedule(dayOfWeek = "*", month = "*", hour = "*", dayOfMonth = "*", year = "*", minute = "*", second = "*/15", persistent = false)
    @Override
    public void myTimer() {
        
        try {
            Runtime runtime = Runtime.getRuntime();
            Process p = runtime.exec("C:\\Program Files\\MySQL\\MySQL Server 8.0\\bin\\mysqldump -uroot -pComp@123 --port=3307 --add-drop-database -B "
                    + " lol -r "+"C:\\Users\\sitht\\Desktop");
            
            int processComplete = p.waitFor();
            System.out.println("Backup Done!"+processComplete);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
