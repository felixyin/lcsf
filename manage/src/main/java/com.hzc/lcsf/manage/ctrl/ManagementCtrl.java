package com.hzc.lcsf.manage.ctrl;

import com.hzc.lcsf.manage.util.HttpSessionUtil;
import com.hzc.lcsf.manage.util.alias.W;
import com.hzc.model.SysCompany;
import com.hzc.model.SysConfig;
import com.hzc.model.SysResource;
import com.hzc.util.alias.S;
import com.hzc.vo.CompanyReportVO;
import com.hzc.vo.PageVO;
import com.hzc.vo.PeopleReportVO;
import com.hzc.vo.ResultVO;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 考试管理类
 * <pre>
 *     包括：报表相关方法，考试管理相关方法
 * </pre>
 * Created by HZC on 2015/7/15.
 */
public class ManagementCtrl {

    /**
     * 考试管理登录
     */
    public void login() {
        String userName = W.getStringTrim("userName");
        String password = W.getStringTrim("password");
        if (StringUtils.isBlank(userName) || StringUtils.isBlank(password)) {
            throw new IllegalArgumentException("hzc exception: arguments were wrong");
        }
        ResultVO vo = S.managementService().login(userName, password);
        if (vo.isCode()) {
            HttpSessionUtil.setUserId(vo.getUser().getId());
            W.forward("/WEB-INF/pages/management/menu.jsp");
        } else {
            W.getReq().setAttribute("result", vo);
            W.forward("/WEB-INF/pages/management/login.jsp");
        }
    }

    /**
     * 获取报表分组
     */
    public void ajaxGetReportGroup() {
        List<SysCompany> list = S.managementService().getReportGroup();
        W.writeJsonArray(list);
    }

    /**
     * 跳转到单位报表页面
     */
    public void listReportCompany() {
        String groupId = W.getStringTrim("groupId");
        String groupName = W.getStringTrim("groupName");
        if (StringUtils.isBlank(groupId) || StringUtils.isBlank(groupName)) {
            throw new IllegalArgumentException("hzc exception: arguments were wrong");
        }
        HttpServletRequest req = W.getReq();
        req.setAttribute("groupId", groupId);
        req.setAttribute("groupName", groupName);
        W.forward("/WEB-INF/pages/management/company_report.jsp");
    }

    /**
     * 获取公司报表
     */
    public void ajaxGetCompanyReportList() {
        Integer pid = W.getInteger("pid");
        if (pid < 0) {
            throw new IllegalArgumentException("hzc exception:arguments were wrong");
        }
        int pageSize = W.getInteger("iDisplayLength");
        int echo = W.getInteger("sEcho");
        int startIndex = W.getInteger("iDisplayStart");
        String sort = W.getSort();
        String order = W.getOrder();
        PageVO<CompanyReportVO> pageVO = new PageVO<CompanyReportVO>();
        pageVO.setPageSize(pageSize);
        pageVO.setStartIndex(startIndex);
        pageVO.setOrder(order);
        pageVO.setSort(sort);
        pageVO = S.managementService().getCompanyReportList(pageVO, pid);
        //查询的数据
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("dataList", pageVO.getData());
        resultMap.put("iTotalRecords", pageVO.getTotalRecords());
        resultMap.put("sEcho", echo);
        resultMap.put("iTotalDisplayRecords", pageVO.getTotalDisplayRecords());
        W.writeJsonObject(resultMap);
    }

    /**
     * 跳转到人员报表
     */
    public void listReportPeople() {
        HttpServletRequest req = W.getReq();
        req.setAttribute("companyId", W.getInteger("companyId"));
        req.setAttribute("companyName", W.getStringTrim("companyName"));
        W.forward("/WEB-INF/pages/management/people_report.jsp");
    }

    /**
     * 返回用户考试报表列表
     */
    public void ajaxGetPeopleReportList() {
        Integer companyId = W.getInteger("companyId");
        int pageSize = W.getInteger("iDisplayLength");
        int echo = W.getInteger("sEcho");
        int startIndex = W.getInteger("iDisplayStart");
        String sort = W.getSort();
        String order = W.getOrder();
        PageVO<PeopleReportVO> pageVO = new PageVO<PeopleReportVO>();
        pageVO.setPageSize(pageSize);
        pageVO.setStartIndex(startIndex);
        pageVO.setOrder(order);
        pageVO.setSort(sort);
        pageVO = S.managementService().getPeopleReportList(pageVO, companyId);
        //查询的数据
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("dataList", pageVO.getData());
        resultMap.put("iTotalRecords", pageVO.getTotalRecords());
        resultMap.put("sEcho", echo);
        resultMap.put("iTotalDisplayRecords", pageVO.getTotalDisplayRecords());
        W.writeJsonObject(resultMap);
    }

    /**
     * 返回考场配置信息
     */
    public void ajaxGetResourceList() {
        List<SysResource> list = S.managementService().getResourceList();
        W.writeJsonArray(list);
    }

    /**
     * 返回一个考场配置
     */
    public void ajaxGetResource() {
        Integer id = W.getInteger("id");
        SysResource resource = S.managementService().getResource(id);
        W.writeJsonObject(resource);
    }

    /**
     * 更新考场信息
     */
    public void ajaxUpdateResource() {
        SysResource resource = W.packBean(SysResource.class);
        ResultVO vo = S.managementService().updateResource(resource);
        W.writeJson(vo.isCode(), vo.getMessage());
    }

    /**
     * 删除一条考场信息
     */
    public void ajaxDeleteResource() {
        Integer id = W.getInteger("id");
        ResultVO vo = S.managementService().deleteResource(id);
        W.writeJson(vo.isCode(), vo.getMessage());
    }

    /**
     * 添加一条考场信息
     */
    public void ajaxAddResource() {
        SysResource resource = W.packBean(SysResource.class);
        ResultVO vo = S.managementService().addResource(resource);
        W.writeJson(vo.isCode(), vo.getMessage());
    }

    /**
     * 返回考试配置信息
     */
    public void ajaxGetConfigList() {
        List<SysConfig> list = S.sysConfigService().getConfigList();
        W.writeJsonArray(list);
    }

    /**
     * 返回一个考试配置
     */
    public void ajaxGetConfig() {
        Integer id = W.getInteger("id");
        SysConfig config = S.sysConfigService().getConfig(id);
        W.writeJsonObject(config);
    }

    /**
     * 更新考试信息
     */
    public void ajaxUpdateConfig() {
        SysConfig config = W.packBean(SysConfig.class);
        ResultVO vo = S.sysConfigService().updateConfig(config);
        W.writeJson(vo.isCode(), vo.getMessage());
    }
    /**
     * 删除一条考场信息
     */
    public void ajaxDeleteRresouce() {
        Integer id = W.getInteger("id");
        ResultVO vo = S.managementService().deleteResource(id);
        W.writeJson(vo.isCode(), vo.getMessage());
    }

}
