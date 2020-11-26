package com.hzc.lcsf.manage.ctrl;

import com.hzc.lcsf.manage.util.alias.W;
import com.hzc.model.SysCompany;
import com.hzc.util.alias.S;

import java.util.List;

/**
 * Created by yinbin on 2015/3/27.
 */
public class CommonCtrl {

    /**
     * 公用的页面上直接跳转到某个jsp的方法
     */
    public void goTo() {
        W.forward(W.getString(W.JSP_PATH));
    }

    /**
     * 跳转到需要使用单位的页面
     */
    public void goWithCompanyJsp() {
        List<SysCompany> companys = S.sysCompanyService().listStandardCompanies();
        W.getReq().setAttribute("companys", companys);
        String path = W.getString("path");
        W.forward(path);
    }

    /**
     * 返回所有单位，以json格式
     */
    public void ajaxGetCompany() {
        List<SysCompany> companys = S.sysCompanyService().listStandardCompanies();
        W.writeJsonArray(companys);
    }
}
