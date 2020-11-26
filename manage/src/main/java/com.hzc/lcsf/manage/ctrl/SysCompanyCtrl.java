package com.hzc.lcsf.manage.ctrl;

import com.hzc.lcsf.manage.util.alias.W;
import com.hzc.model.SysCompany;
import com.hzc.util.alias.S;
import com.hzc.vo.PageVO;
import com.hzc.vo.ResultVO;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by LiuJY on 2015/7/27.
 */
public class SysCompanyCtrl {

    /**
     * 获取该组单位下的具体单位之间的页面跳转
     */
    public void listCompanyJunior() {
        HttpServletRequest req = W.getReq();
        req.setAttribute("companyGroupId", W.getInteger("companyGroupId"));
        req.setAttribute("companyGroupName", W.getStringTrim("companyGroupName"));
        W.forward("/WEB-INF/pages/management/ManageSystem/company_junior.jsp");
    }

    /**
     * 获取分组下的单位，分页
     */
    public void ajaxGetJuniorCompanyList() {
        Integer companyGroupId = W.getInteger("companyGroupId");

        String sort = W.getSort();
        String order = W.getOrder();

        PageVO<SysCompany> pageVO = new PageVO<SysCompany>();
        pageVO.setOrder(order);
        pageVO.setSort(sort);
        List<SysCompany> list = S.sysCompanyService().getJuniorCompanyList(pageVO, companyGroupId);

        W.writeJsonArray(list);
    }

    /**
     * 删除一条部门信息
     */
    public void ajaxDeleteCompany() {
        Integer id = W.getInteger("id");
        ResultVO vo = S.sysCompanyService().deleteCompany(id);
        W.writeJson(vo.isCode(), vo.getMessage());
    }

    /**
     * 添加某单位分组下的单位
     */
    public void ajaxAddCompany() {
        SysCompany company = W.packBean(SysCompany.class);
        Integer pid = W.getInteger("pid");
        ResultVO vo = S.sysCompanyService().addCompany(company, pid);
        W.writeJson(vo.isCode(), vo.getMessage());
    }

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
        W.writeJson(true, String.valueOf(companyId));
    }

    /**
     * 添加单位分组
     */
    public void ajaxAddCompanyGroups() {
        SysCompany group = W.packBean(SysCompany.class);
        ResultVO vo = S.sysCompanyService().addCompanyGroup(group);
        W.writeJson(vo.isCode(), vo.getMessage());
    }

    /**
     * 获取所有部门列表，用ajax获取所有部门
     */
    public void ajaxGetCompanyGroupList() {
        List<SysCompany> list = S.sysCompanyService().ajaxGetCompanyGroupList();
        W.writeJsonArray(list);
    }

    /**
     * 返回一个部门信息
     */
    public void ajaxGetCompanyGroup() {
        Integer id = W.getInteger("id");
        SysCompany company = S.sysCompanyService().getCompanyById(id);
        W.writeJsonObject(company);
    }

    /**
     * 更新部门组信息
     */
    public void ajaxUpdateCompanyGroup() {
        SysCompany group = W.packBean(SysCompany.class);
        ResultVO vo = S.sysCompanyService().updateCompanyGroup(group);
        W.writeJson(vo.isCode(), vo.getMessage());
    }
}
