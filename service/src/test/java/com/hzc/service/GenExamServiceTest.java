package com.hzc.service;

import com.hzc.util.alias.S;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by yinbin on 2015/6/26.
 */
public class GenExamServiceTest extends SupperJunit {


    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {

    }

    /**
     * 生成题库
     *
     * @throws Exception
     */
    @Test
    public void testGenExamRepo() throws Exception {
        S.genExamService().genExamRepo();
    }
}