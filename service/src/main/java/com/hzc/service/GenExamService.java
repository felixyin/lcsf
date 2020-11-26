package com.hzc.service;

import com.hzc.factory.alias.D;
import com.hzc.framework.ssh.service.Transaction;
import org.apache.ibatis.annotations.Param;

/**
 * Created by yinbin on 2015/6/23.
 */

@Transaction
public class GenExamService {

    /**
     * 生成考试题库的算法
     */
    public void genExamRepo() {

        D.genExamRepoMapper().clear();

        int cout = D.hisAnswerMapper().genExamRepo(100, 100, 100);

        System.out.println("生成考试题库，生成数量：" + cout);

    }

}
