package com.hzc.vo;

import com.hzc.model.SysUser;

/**
 * Created by LiuJY on 2015/5/28.
 */
public class SysUserVO extends SysUser {

    private String companyName;

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
}
