package com.hzc.listener;

import com.hzc.util.alias.S;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServlet;
import java.math.BigDecimal;
import java.util.Timer;
import java.util.TimerTask;

/**
 * Created by yinbin on 2015/6/23.
 */
public class GenExamRepoListener extends HttpServlet implements ServletContextListener {

    Timer timer = new Timer();

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext servletContext = servletContextEvent.getServletContext();

        String delayStr = servletContext.getInitParameter("delay");
        String periodStr = servletContext.getInitParameter("period");

        ScriptEngineManager manager = new ScriptEngineManager();
        ScriptEngine se = manager.getEngineByName("js");

        Long delay = null;
        Long period = null;
        try {
            delay = Long.parseLong(new BigDecimal(se.eval(delayStr).toString()).toPlainString());
            period = Long.parseLong(new BigDecimal(se.eval(periodStr).toString()).toPlainString());
        } catch (ScriptException e) {
            e.printStackTrace();
            System.out.println("web.xml中定时器配置错误");
            System.exit(-1);
        }

        System.out.println("----------------------------------生成考试题库-任务开始执行----------------------------------");

//        如果下午五点部署，则配置为
//        timer.schedule(new GenExamTask(), 7 * 60 * delay, 24 * 60 * period);
        timer.schedule(new GenExamTask(), delay, period);

//        System.out.println("----------------------------------生成考试题库-任务结束执行----------------------------------");
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        timer.cancel();
    }
}

class GenExamTask extends TimerTask {

    @Override
    public void run() {
        try {
            System.out.println("hello world!");
            S.genExamService().genExamRepo();
        } catch (Exception e) {
            e.printStackTrace();
//            吃掉所有异常，防止因为某次发生异常导致定时器停止执行的问题
        }
    }
}