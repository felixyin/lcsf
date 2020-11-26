package com.hzc.lcsf.manage.ctrl;

import com.hzc.lcsf.manage.util.alias.W;
import com.hzc.model.SysUser;
import com.hzc.util.alias.S;
import com.hzc.vo.ResultVO;
import org.apache.commons.lang.StringUtils;

import java.util.List;

/**
 * Created by LiuJY on 2015/7/27.
 */
public class UserCtrl {
    /**
     * 检查用户名重复注册
     * <pre>
     * 用户噶un里界面，检查用户身份证号是否已经注册过了
     * </pre>
     */
    public void ajaxCheckPhoneDup() {
        String phone = W.getString("phone");
        Integer count = S.sysUserService().selectUserCountByPhone(phone);
        boolean isOk = count < 1;
        W.writeJson(isOk, "用户名已存在");
    }

    /**
     * 用户管理获取用户列表
     */
    public void ajaxGetUserList() {
        String phone = W.getString("phone");
        String idCard = W.getString("idCard");
        String userName = W.getString("userName");
//        Integer companyId = W.getInteger("companyId");
        String companyId = W.getString("companyId");
        String jobGrade = W.getString("jobGrade");
        SysUser user = new SysUser();
        if (phone != "" && phone != null) {
            user.setPhone(phone);
        }
        if (idCard != "" && idCard != null) {
            user.setIdCard(idCard);
        }
        if (userName != "" && userName != null) {
            user.setUserName(userName);
        }
        if (StringUtils.isNotBlank(companyId)) {
            user.setCompanyId(Integer.parseInt(companyId));
        }
        if (jobGrade != "" && jobGrade != null) {
            user.setJobGrade(jobGrade);
        }
        List<SysUser> list = S.sysUserService().ajaxGetUserList(user);
        W.writeJsonArray(list);
    }


        /**
         * 添加单位分组
         */
    public void ajaxAddResource() {
        SysUser group = W.packBean(SysUser.class);
        group.setPasswd("000000");
        ResultVO vo = S.sysUserService().addSysUser(group);
        W.writeJson(vo.isCode(), vo.getMessage());
    }

    /**
     * 删除一条考场信息
     */
    public void ajaxDeleteRresouce() {
        Integer id = W.getInteger("id");
        ResultVO vo = S.sysUserService().deleteResource(id);
        W.writeJson(vo.isCode(), vo.getMessage());
    }
    /**
     * 返回一个考场配置
     */
    public void ajaxGetResource() {
        Integer id = W.getInteger("id");
        SysUser resource = S.sysUserService().getResource(id);
        W.writeJsonObject(resource);
    }
    /**
     * 更新考场信息
     */
    public void ajaxUpdateResource() {
        SysUser resource = W.packBean(SysUser.class);
        ResultVO vo = S.sysUserService().updateResource(resource);
        W.writeJson(vo.isCode(), vo.getMessage());
    }
}
