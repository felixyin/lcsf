package com.hzc.lcsf.manage.ctrl;

import com.hzc.lcsf.manage.util.HttpSessionUtil;
import com.hzc.lcsf.manage.util.alias.W;
import com.hzc.util.alias.S;
import com.hzc.vo.ResultVO;
import com.hzc.vo.SysUserVO;
import org.apache.commons.lang.StringUtils;

import java.util.List;

/**
 * 用户管理相关方法
 * Created by HZC on 2015/6/17.
 */
public class SysUserCtrl {

    /**
     * 登录
     */
    public void login() {
        String username = W.getStringTrim("username");
        String password = W.getStringTrim("password");
        if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
            throw new IllegalArgumentException("hzc exception: arguments were wrong");
        }
        ResultVO vo = S.managementService().login(username, password);
        if (vo.isCode()) {
            HttpSessionUtil.setUserId(vo.getUser().getId());
            W.forward("/WEB-INF/pages/main.jsp");
        } else {
            W.getReq().setAttribute("result", vo);
            W.forward("index.jsp");
        }
    }

    /**
     * 返回用户管理列表
     */
    public void ajaxUserManage() {
        SysUserVO sysUserVO = W.packBean(SysUserVO.class);
        List<SysUserVO> list = S.sysUserService().getUserManageList(sysUserVO);
        W.writeJsonArray(list);
    }

}
