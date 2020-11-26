package com.hzc.top;
import com.hzc.framework.ssh.repository.mybatis.MybatisSessionFactory;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.AfterClass;
import org.junit.BeforeClass;

import java.io.InputStream;


/**
 * 用于fyssh框架Service层的测试。
 * 用fyssh框架编写的Service层的测试代码，需要继承这个类，否则不能获取到测试用的Mybatis的SqlSession。
 */
public class SupperJunit {
	private static SqlSessionFactory dbFactory = null;

	@BeforeClass
	public static void before() {

		try {
			String commonConfigPath = "mybatis-config.xml";
			if (null != commonConfigPath && !"".equals(commonConfigPath)) {
				InputStream is = Resources.getResourceAsStream(commonConfigPath);
				dbFactory = new SqlSessionFactoryBuilder().build(is);
				MybatisSessionFactory.setJunit(true);
				MybatisSessionFactory.putFactory(dbFactory);
			}

			if (dbFactory == null) {
				//System.out.println("数据库初始化失败，进程退出！");
				System.exit(1);
			}
		} catch (Exception e) {
			//System.out.println("初始化数据库时发生异常，进程退出！异常消息：\n" + e.getMessage());
			System.exit(1);
		}
	}

	@AfterClass
	public static void after() {
		dbFactory = null;
	}

	public SupperJunit() {
	}

}
