package com.hzc.top;
import com.hzc.framework.ssh.repository.mybatis.MybatisSessionFactory;
import com.hzc.model.PufaImport;
import com.hzc.model.SysUser;
import com.hzc.util.alias.S;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yinbin on 2015/4/10.
 */
public class PufaImportSqlTest extends SupperJunit {


    @Test
    public void genPufa() throws IOException, SQLException {
        try {
            FileUtils.forceDelete(new File("./question.js"));
            FileUtils.forceDelete(new File("./option.js"));
        } catch (IOException e) {
        }
        List<String> sqls = new ArrayList<String>();
        List<PufaImport> pufaImports = S.pufaImportService().loadAll();
        int optionId = 1;
        for (PufaImport pufaImport : pufaImports) {
//            System.out.println(pufaImport);
            String code = "";
            if (pufaImport.getType().equals("判断题")) {
                code = "00010001";
            } else if (pufaImport.getType().equals("单选题")) {
                code = "00010002";
            } else if (pufaImport.getType().equals("多选题")) {
                code = "00010003";
            }
            String sql = "INSERT INTO lp_question values(" + pufaImport.getId() + ", " + pufaImport.getSeq() + " , '" + code + "', 0, '" + pufaImport.getType() + "', '" + pufaImport.getName() + "', '', '', null, '" + pufaImport.getSource() + "',0,0)";
            sqls.add(sql);
//            S.pufaImportService().executeSql(sql);
            FileUtils.writeStringToFile(new File("./question.js"), sql.toString() + "\n", true);

            String answer = pufaImport.getAnswer().toUpperCase();

            if (pufaImport.getType().equals("判断题")) {
                if (StringUtils.isNotBlank(pufaImport.getOptionA())) {
                    String isOK = "";
                    if (answer.contains("对")) {
                        isOK = "1";
                    } else {
                        isOK = "-1";
                    }
                    String optionASql = "INSERT INTO lp_option values(" + (optionId++) + ", " + pufaImport.getId() + ", '" + pufaImport.getOptionA() + "', " + isOK + ")";
                    FileUtils.writeStringToFile(new File("./option.js"), optionASql.toString() + "\n", true);
//                S.pufaImportService().executeSql(optionASql);
//                sqls.add(optionASql);
                }

                if (StringUtils.isNotBlank(pufaImport.getOptionB())) {
                    String isOK = "";
                    if (answer.contains("错")) {
                        isOK = "1";
                    } else {
                        isOK = "-1";
                    }
                    String optionBSql = "INSERT INTO lp_option values(" + (optionId++) + ", " + pufaImport.getId() + ", '" + pufaImport.getOptionB() + "', " + isOK + ")";
                    FileUtils.writeStringToFile(new File("./option.js"), optionBSql.toString() + "\n", true);
//                S.pufaImportService().executeSql(optionBSql);
//                sqls.add(optionBSql);
                }

                continue;
            }

            if (StringUtils.isNotBlank(pufaImport.getOptionA())) {
                String isOK = "";
                if (answer.contains("A")) {
                    isOK = "1";
                } else {
                    isOK = "-1";
                }
                String optionASql = "INSERT INTO lp_option values(" + (optionId++) + ", " + pufaImport.getId() + ", '" + pufaImport.getOptionA() + "', " + isOK + ")";
                FileUtils.writeStringToFile(new File("./option.js"), optionASql.toString() + "\n", true);
//                S.pufaImportService().executeSql(optionASql);
//                sqls.add(optionASql);
            }

            if (StringUtils.isNotBlank(pufaImport.getOptionB())) {
                String isOK = "";
                if (answer.contains("B")) {
                    isOK = "1";
                } else {
                    isOK = "-1";
                }
                String optionBSql = "INSERT INTO lp_option values(" + (optionId++) + ", " + pufaImport.getId() + ", '" + pufaImport.getOptionB() + "', " + isOK + ")";
                FileUtils.writeStringToFile(new File("./option.js"), optionBSql.toString() + "\n", true);
//                S.pufaImportService().executeSql(optionBSql);
//                sqls.add(optionBSql);
            }

            if (StringUtils.isNotBlank(pufaImport.getOptionC())) {
                String isOK = "";
                if (answer.contains("C")) {
                    isOK = "1";
                } else {
                    isOK = "-1";
                }
                String optionCSql = "INSERT INTO lp_option values(" + (optionId++) + ", " + pufaImport.getId() + ", '" + pufaImport.getOptionC() + "', " + isOK + ")";
                FileUtils.writeStringToFile(new File("./option.js"), optionCSql.toString() + "\n", true);
//                S.pufaImportService().executeSql(optionCSql);
//                sqls.add(optionCSql);
            }

            if (StringUtils.isNotBlank(pufaImport.getOptionD())) {
                String isOK = "";
                if (answer.contains("D")) {
                    isOK = "1";
                } else {
                    isOK = "-1";
                }
                String optionDSql = "INSERT INTO lp_option values(" + (optionId++) + ", " + pufaImport.getId() + ", '" + pufaImport.getOptionD() + "', " + isOK + ")";
                FileUtils.writeStringToFile(new File("./option.js"), optionDSql.toString() + "\n", true);
//                S.pufaImportService().executeSql(optionDSql);
//                sqls.add(optionDSql);
            }

            if (StringUtils.isNotBlank(pufaImport.getOptionE())) {
                String isOK = "";
                if (answer.contains("E")) {
                    isOK = "1";
                } else {
                    isOK = "-1";
                }
                String optionESql = "INSERT INTO lp_option values(" + (optionId++) + ", " + pufaImport.getId() + ", '" + pufaImport.getOptionE() + "', " + isOK + ")";
                FileUtils.writeStringToFile(new File("./option.js"), optionESql.toString() + "\n", true);
//                S.pufaImportService().executeSql(optionESql);
//                sqls.add(optionESql);
            }

        }
//        S.pufaImportService().executeSql(sqls);
    }

    @Test
    public void genAccount() throws Exception {
        MybatisSessionFactory.setJunit(false);
        for (int k = 1; k < 1000; k++) {
            SysUser sysUser = new SysUser();
            String phone = StringUtils.leftPad(k + "", 6, "0");
            System.out.printf(phone);
            sysUser.setPhone(phone);
            sysUser.setPasswd("111111");
            sysUser.setStatus(1);
            sysUser.setDeleted(1);
//            sysUser.setSystem(2);
//            int i = S.userService().saveSysUser(sysUser);
//            System.out.println(i == 1);
        }
    }
}
