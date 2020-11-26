package com.hzc.ctrl;

import com.hzc.model.SysUser;
import com.hzc.util.HttpSessionUtil;
import com.hzc.util.PhotoUtil;
import com.hzc.util.alias.S;
import com.hzc.util.alias.W;
import com.hzc.vo.UploadUserCall;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by LiuJY on 2015/3/20.
 */
public class UserCtrl {


    private static Logger log = Logger.getLogger(UserCtrl.class);

    /**
     * 青岛司法局
     */
    public void lcpf() {
        String account = W.getStringTrim("username", "账号必填");

        int userId = S.sysUserService().loginForPufa(account);

        if (userId == 0) { // 账号不存在

            W.getReq().setAttribute("message", "帐号不存在，请先注册");
            W.getReq().setAttribute("loginMessage", "true");
            W.forward("CommonCtrl.goTo.do?path=index_user.jsp");
        } else {

            // 登录时计算一次用户的学时
            HttpSessionUtil.setUsedHours(S.reportServcie().getUsedTime(userId));

            HttpSessionUtil.setUserId(userId);
            HttpSessionUtil.setUserName(account);

            W.redirect("CommonCtrl.goTo.do?path=/WEB-INF/pages/study/pre/warn.jsp");
        }
    }

    /**
     * 考试登录
     * TODO 单例登录，意外关闭浏览器，确定退出
     */
    public void lcpfForExam() {
        String account = W.getString("idCard", "账号必填");

        int userId = S.sysUserService().loginForPufa(account);
        if (userId == 0) {
            W.getReq().setAttribute("result", "您未报名，不能参加考试");
            W.forward("CommonCtrl.goTo.do?path=/WEB-INF/pages/exam/login.jsp");
        } else {
            W.getSession().setAttribute("userId", userId);
            W.getSession().setAttribute("username", account);

            W.redirect("CommonCtrl.goTo.do?path=/WEB-INF/pages/exam/exam_pre.jsp");
        }
    }

    /**
     * 考试报名
     */
    public void enrollExam() {
        String disk = "/" + "var" + "/" + "local" + "/" + "lcsf_lts";
        String folder = "/" + "upload" + "/" + "photo";

        try {

            W.upload(folder, SysUser.class, new UploadUserCall(disk, folder));
        } catch (Exception e) {

//            log
            String message = e.getCause().getMessage();
            log.error(message, e);

//            dispatcher
            W.getReq().setAttribute("message", message);
            W.forward("CommonCtrl.goWithCompanyJsp.do?path=/WEB-INF/pages/enrollment/sign.jsp");
        }

        W.getReq().setAttribute("message", "报名成功");
        W.forward("CommonCtrl.goWithCompanyJsp.do?path=/WEB-INF/pages/enrollment/sign.jsp");
    }

    /**
     * @deprecated 跳转到修改报名信息
     * <pre>
     *     返回用户信息
     * </pre>
     */
    public void toModifySign() throws IOException {
        String idCard = W.getString("idCard");
        if (StringUtils.isBlank(idCard)) {
            throw new IllegalArgumentException("hzc exception: argument id card is null");
        }
        SysUser user = S.sysUserService().getUserByIdCard(idCard);
        String path = user.getPhotoPath();
        String imageString = PhotoUtil.getImageString(path);
        user.setPhotoPath(imageString);
        W.getReq().setAttribute("user", user);
        W.forward("CommonCtrl.goTo.do?path=/WEB-INF/pages/enrollment/modify.jsp");
    }

    /**
     * 检查身份证号重复注册
     * <pre>
     * 报名界面，检查用户身份证号是否已经注册过了
     * </pre>
     */
    public void ajaxCheckIdCardDup() {
        String idCard = W.getString("idCard");
        Integer count = S.sysUserService().selectUserCountByIdCard(idCard);
        boolean isOk = count < 1;
        W.writeJson(isOk, "身份证号已经注册");
    }

    /**
     * 学员注册
     * <pre>
     *     学员注册，返回注册成功
     * </pre>
     */
    public void enroll() {
        String username = W.getString("username");
        String idCard = W.getString("idCard");
        String company = W.getString("companyId");
        if (StringUtils.isBlank(username) || StringUtils.isBlank(idCard) || StringUtils.isBlank(company)) {
            throw new IllegalArgumentException("hzc exception: argument is wrong.");
        }

        SysUser sysUser = new SysUser();
        sysUser.setCompanyId(Integer.parseInt(company));
        sysUser.setIdCard(idCard);
        sysUser.setUserName(username);
        sysUser.setCreateTime(new Date());
        boolean b = S.sysUserService().signUser(sysUser);

        String result = "true";
        String mess = "";

        if (!b) {
            result = "false";
            mess = "注册失败，请重新注册";
        } else {
            mess = "注册成功，请登录";
        }

        W.getReq().setAttribute("loginMessage", result);
        W.getReq().setAttribute("message", mess);
        W.forward("index_user.jsp");
    }

    /**
     * 李沧司法局的退出登录
     */
    public void logoutForLp() {
        W.getSession().removeAttribute("userId");
        W.redirect("index_user.jsp");
    }

    /**
     * 开卷考试登录
     */
    public void loginForKaijuan() {
        String account = W.getString("idCard", "账号必填");
        SysUser user = S.sysUserService().getUserByStatus(account, 3);
        if (null == user) {
            W.getReq().setAttribute("result", "您未报名，不能参加考试");
            W.forward("CommonCtrl.goTo.do?path=/WEB-INF/pages/exam/login.jsp");
        } else {
            W.getSession().setAttribute("user", user);
            W.getSession().setAttribute("username", account);
            HttpSessionUtil.setUserId(user.getId());
            W.redirect("CommonCtrl.goTo.do?path=/WEB-INF/pages/exam/exam_pre.jsp");
        }

    }
}
