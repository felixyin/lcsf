package com.hzc.service;

import com.hzc.model.SysResource;
import com.hzc.util.alias.S;
import org.junit.Test;

import java.util.List;

public class SysResourceServiceTest extends SupperJunit {

    @Test
    public void testGetResources() throws Exception {
        List<SysResource> resources = S.sysResourceService().getResources();
        System.out.println(resources.size());
    }

    @Test
    public void testOrderBy() throws Exception {
        List<SysResource> list = S.sysResourceService().getOrderBy("room_no", "asc");
        System.out.println(list.get(0).getId());
        System.out.println(list.get(1).getId());
    }
}