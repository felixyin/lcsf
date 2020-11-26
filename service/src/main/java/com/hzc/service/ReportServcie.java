package com.hzc.service;

import com.hzc.factory.alias.D;
import com.hzc.framework.ssh.service.TrancationType;
import com.hzc.framework.ssh.service.Transaction;

import java.util.Map;

/**
 * Created by yinbin on 2015/6/12.
 * 报表用服务接口
 */
@Transaction(jdbc = TrancationType.CLOSE)
public class ReportServcie {

    /**
     * 每题的计时单位为：每题30秒
     */
    public static final int STEP_TIME = 30;

    /**
     * 获取用户的总学习时长
     *
     * @param userId
     * @return
     */
    public String getUsedTime(Integer userId) {
        Map map = D.hisAnswerMapper().selectTimesByUserId(userId);
        int usedTimes = Integer.parseInt(map.get("effectAnswerTimes").toString())
                + Integer.parseInt(map.get("styTimes").toString())
                + Integer.parseInt(map.get("styBmTimes").toString())
                + Integer.parseInt(map.get("styCltTimes").toString());
        float allUsedTime = STEP_TIME * usedTimes;
        int usedHour = (int) (allUsedTime / 60F / 60F);
        int usedMinute = (int) (allUsedTime / 60F % 60F);

//        DecimalFormat df2 = new DecimalFormat("00.00");
//        return df2.format(usedHour);
        String formatStr = "";
        if (usedHour > 0) {
            formatStr += usedHour + "小时";
        } else {
            formatStr += "0小时";
        }
        if (usedMinute > 0) {
            formatStr += usedMinute + "分钟";
        } else {
            formatStr += "0分钟";
        }
        return formatStr;
    }


}
