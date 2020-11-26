package com.hzc.service;

import com.hzc.util.alias.S;
import com.hzc.vo.SysUserVO;
import org.junit.Test;

import java.util.List;

public class SysUserServiceTest extends SupperJunit{

    @Test
    public void testUpdateStatusById() throws Exception {
        Integer[] ids = {1, 2, 3};
        S.sysUserService().updateStatusById(ids, 1);
        System.out.println("yes");
    }

    @Test
    public void testGetUsersById() {
        Integer[] ids = {10, 12, 11};
        List<SysUserVO> usersById = S.sysUserService().getUsersById(ids);
        System.out.println(usersById.size());
    }

}