package com.hzc.service;

import com.qtrj.simpleframework.ssh.service.TrancationType;
import com.qtrj.simpleframework.ssh.service.Transaction;
import com.hzc.model.SysConfig;
import com.hzc.model.SysUser;
import com.hzc.util.alias.S;

import java.util.Date;

/**
 *
 * 李沧干部法律法规学习测试系统考试报名类<br/>
 * 说明：<br/>
 * 关于考试报名的相关service方法<br/>
 * 报名，修改报名信息等<br/>
 * Created by HZC on 2015/5/26.
 */
@Transaction(jdbc = TrancationType.CLOSE)
public class LpEnrollmentService {

    /**
     * 查询用户报名状态
     *
     * @param idCard 身份证号
     * @return 1、true：已经报名，2：false：未报名
     */
    public boolean checkEnrollment(String idCard) {
        SysUser user = S.sysUserService().getUserByIdCard(idCard);
        return user == null ? false : true;
    }

    /**
     * 保存用户报名信息
     *
     * @param user 用户信息
     */
    public void saveEnrollment(SysUser user) {
        boolean exit = checkEnrollment(user.getIdCard());
        //用户已存在，完善用户的详细信息
        Date date = new Date();
        user.setEnrollmentTime(date);
        user.setStatus(3);
        if (exit) {
            S.sysUserService().updateSysUser(user);
        } else {
            //新建用户，并保存用户的报名信息
            S.sysUserService().saveSysUser(user);
        }
    }

    /**
     * 查询是否在报名时间
     *
     * @return true:在报名时间，false：不在报名时间
     */
    public boolean checkEnrollAvailable() {
        SysConfig config = S.sysConfigService().get();
        Date date = new Date();
        Date startTime = config.getEnrollmentStartTime();
        Date endTime = config.getEnrollmentEndTime();
        long time = date.getTime();
        return (startTime.getTime() <= time && time < endTime.getTime());
    }

}
