package com.hzc.ctrl;

import com.hzc.model.SysCompany;
import com.hzc.util.alias.S;
import com.hzc.util.alias.W;

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
        goTo();
    }

    /**
     * 返回所有单位，以json格式
     */
    public void ajaxGetCompany() {
        List<SysCompany> companys = S.sysCompanyService().listStandardCompanies();
        W.writeJsonArray(companys);
    }

    /**
     * 重定向到主页
     */
    public void goToIndexJsp() {
        W.forward("/main.jsp");
    }
}
