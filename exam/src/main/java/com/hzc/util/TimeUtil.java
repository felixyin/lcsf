package com.hzc.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间格式工具类
 * Created by HZC on 2015/7/1.
 */
public class TimeUtil {

    /**
     * 返回年
     *
     * @param date
     * @return
     */
    public static String getYearStr(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy");
        return format.format(date);
    }

    /**
     * 返回月
     *
     * @param date
     * @return
     */
    public static String getMonthStr(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("MM");
        return format.format(date);
    }

    /**
     * 返回日
     *
     * @param date
     * @return
     */
    public static String getDayStr(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("dd");
        return format.format(date);
    }

    /**
     * 返回小时
     *
     * @param date
     * @return
     */
    public static String getHourStr(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("hh");
        return format.format(date);
    }

    /**
     * 返回分钟
     *
     * @param date
     * @return
     */
    public static String getMinuteStr(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("mm");
        return format.format(date);
    }

    /**
     * 返回秒
     *
     * @param date
     * @return
     */
    public static String getSecondStr(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("ss");
        return format.format(date);
    }

    /**
     * 返回两个时间的间隔天数
     *
     * @param start 开始时间
     * @param end   结束时间
     * @return
     */
    public static Integer getDayInterval(Date start, Date end) {
        return getHourInterval(start, end) / 24;
    }

    /**
     * 返回两个时间的间隔秒数
     *
     * @param start
     * @param end
     * @return
     */
    public static Integer getSecondInterval(Date start, Date end) {
        return Integer.parseInt((end.getTime() - start.getTime()) / (1000) + "");
    }

    /**
     * 返回两个时间的间隔分钟数
     *
     * @param start
     * @param end
     * @return
     */
    public static Integer getMinuteInterval(Date start, Date end) {
        return getSecondInterval(start, end) / 60;
    }

    /**
     * 返回两个时间的间隔小时数
     *
     * @param start
     * @param end
     * @return
     */
    public static Integer getHourInterval(Date start, Date end) {
        return getMinuteInterval(start, end) / 60;
    }
}
