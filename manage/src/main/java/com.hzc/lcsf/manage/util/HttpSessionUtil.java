package com.hzc.lcsf.manage.util;

import com.hzc.framework.ssh.controller.WebUtil;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Created by HZC on 2015/4/29.
 * <p>
 * 记录session中的变量
 */
public class HttpSessionUtil {

    private static String keyForEffectAnswerTime = "keyForEffectAnswerTime";

    /**
     * 获取userId
     *
     * @return
     */
    public static int getUserId() {
        return (Integer) WebUtil.getSession().getAttribute("userId");
    }

    /**
     * 设置用户的userId
     *
     * @param userId
     */
    public static void setUserId(Integer userId) {
        WebUtil.getSession().setAttribute("userId", userId);
    }

    /**
     * 删除userId
     */
    public static void removeUserId() {
        WebUtil.getSession().removeAttribute("userId");
    }

    /**
     * 获取username
     *
     * @return
     */
    public static String getUserName() {
        return (String) WebUtil.getSession().getAttribute("username");
    }

    /**
     * 设置用户的username
     *
     * @param userName
     */
    public static void setUserName(String userName) {
        WebUtil.getSession().setAttribute("username", userName);
    }

    /**
     * TODO
     * 如果是现场闭卷考试就返回准考证号，否则，返回null
     *
     * @return
     */
    public static Integer getCardId() {
        return null;
    }

    /**
     * 获取管理员查询单位的companyId
     *
     * @return
     */
    public static Integer getManageCompanyId() {
        return (Integer) WebUtil.getSession().getAttribute("companyId");
    }

    /**
     * 设置管理员查询单位的companyId
     *
     * @param companyId
     */
    public static void setManageCompanyId(Integer companyId) {
        WebUtil.getSession().setAttribute("companyId", companyId);
    }

    /**
     * 设置用户的使用时间
     *
     * @param usedHours
     */
    public static void setUsedHours(String usedHours) {
        WebUtil.getSession().setAttribute("usedHours", usedHours);
    }


    /**
     * 检测请求提交间隔是否小于5秒
     *
     * @return false:大于5秒，true：小于5秒
     */
    public static boolean checkLessFiveMinutes() {
        int flagSecond = 5;
        String key = "_five_minutes";
        HttpSession session = WebUtil.getSession();

        Object five_minutes = session.getAttribute(key);
        long currentTime = new Date().getTime();
        session.setAttribute(key, currentTime);
        if (null == five_minutes) {
            session.setAttribute(keyForEffectAnswerTime, "false");
            return false;
        } else {
            long oldTime = (Long) five_minutes;
            long minusMillSecond = currentTime - oldTime;
            long minusMinutes = minusMillSecond / 1000;

            boolean b = minusMinutes < flagSecond;
            session.setAttribute(keyForEffectAnswerTime, String.valueOf(b));
            return b;
        }
    }

    /**
     * 检测请求提交间隔是否小于5秒,不重新设置session中的时间
     *
     * @return false:大于5秒，true：小于5秒
     */
    public static boolean getForEffectAnswerTime() {
        String result = (String) WebUtil.getSession().getAttribute(keyForEffectAnswerTime);
        return "true".equals(result);
    }
}

