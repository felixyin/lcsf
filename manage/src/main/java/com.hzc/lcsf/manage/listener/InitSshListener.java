package com.hzc.lcsf.manage.listener;

import com.qtrj.simpleframework.ssh.repository.mybatis.MybatisSessionFactory;
import com.qtrj.simpleframework.util.PropertiesUtil;
import com.qtrj.simpleframework.util.SshConstant;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.InputStream;

/**
 * Created by YinBin on 14-4-18.
 */
public class InitSshListener implements ServletContextListener {

    private static final Log log = LogFactory.getLog(InitSshListener.class);

    public void contextInitialized(final ServletContextEvent servletContextEvent) {
        PropertiesUtil.initExtiact("/usr/local/tomcat/conf/lcsf.properties");

        // 初始化rpc的连接池

        initControllerSettings(servletContextEvent);

        initMybatis(servletContextEvent);

    }

    private void initControllerSettings(final ServletContextEvent servletContextEvent) {
        String controllerPackage = servletContextEvent.getServletContext().getInitParameter("controller_package");
        if (null == controllerPackage || "".equals(controllerPackage)) {
            log.error("控制层包路径没有配置，进程退出！");
            System.exit(1);
        }
        SshConstant.PACKAGE_NAME = controllerPackage.split(",");
    }

    /**
     * @param servletContextEvent
     */
    private void initMybatis(ServletContextEvent servletContextEvent) {
        SqlSessionFactory dbFactory = null;
        try {
            String commonConfigPath = servletContextEvent.getServletContext().getInitParameter("mybatis_config_path");
            if (null != commonConfigPath && !"".equals(commonConfigPath)) {
                InputStream is = Resources.getResourceAsStream(commonConfigPath);
                dbFactory = new SqlSessionFactoryBuilder().build(is);
                MybatisSessionFactory.putFactory(dbFactory);
            }

            if (dbFactory == null) {
                log.error("文件监听初始化失败！");
            }
        } catch (Exception e) {
            log.error("数据库初始化失败，进程退出，请检查您的配置文件！", e);
            System.exit(1);
        }
    }

    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        // do nothings
    }


}
