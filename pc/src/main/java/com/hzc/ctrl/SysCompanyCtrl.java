package com.hzc.ctrl;

import com.hzc.model.SysCompany;
import com.hzc.util.alias.S;
import com.hzc.util.alias.W;
import org.apache.commons.lang.StringUtils;

import java.util.List;

/**
 * 单位相关方法
 * Created by HZC on 2015/6/19.
 */
public class SysCompanyCtrl {

    /**
     * 返回所有非其他类的单位
     */
    public void ajaxListStandardCompanies() {
        List<SysCompany> list = S.sysCompanyService().listStandardCompanies();
        W.writeJsonArray(list);
    }

    /**
     * 返回所有其他类的单位
     */
    public void ajaxListOtherCompanies() {
        List<SysCompany> list = S.sysCompanyService().listOtherCompanies();
        W.writeJsonArray(list);
    }

    /**
     * 用户手动添加其他类单位
     */
    public void ajaxAddSelfCompany() {
        String companyName = W.getString("company");
        if (StringUtils.isBlank(companyName)) {
            W.writeJson(false, "单位不能为空");
        }
        SysCompany company = new SysCompany();
        company.setDeleted(1);
        company.setName(companyName);
        company.setPassword("123456");
        company.setPid(8);
        Integer companyId = S.sysCompanyService().addSelfCompany(company);
        W.writeJson(true,String.valueOf(companyId));
    }
}
