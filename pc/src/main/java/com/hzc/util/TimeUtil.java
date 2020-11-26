package com.hzc.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 时间格式工具类
 * Created by HZC on 2015/7/1.
 */
public class TimeUtil {

    /**
     * 返回两个时间差
     * <pre>
     *     结果放到Map中
     *     map.put("day", day);
     *     map.put("hour", hour);
     *     map.put("minute", minute);
     *     map.put("second", second);
     * </pre>
     *
     * @param littleDate
     * @param bigDate
     * @return
     */
    public static Map getTimeInterval(Date littleDate, Date bigDate) {
        Map map = new HashMap<String, String>();
        long between = (bigDate.getTime() - littleDate.getTime()) / 1000;
        long day = between / (24 * 3600);
        long hour = between % (24 * 3600) / 3600;
        long minute = between % 3600 / 60;
        long second = between % 60;
        map.put("day", day);
        map.put("hour", hour);
        map.put("minute", minute);
        map.put("second", second);
        return map;
    }

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
    public static long getDayInterval(Date start, Date end) {
        return getHourInterval(start, end) / 24;
    }

    /**
     * 返回两个时间的间隔秒数
     *
     * @param start
     * @param end
     * @return
     */
    public static long getSecondInterval(Date start, Date end) {
        return (end.getTime() - start.getTime()) / 1000;
    }

    /**
     * 返回两个时间的间隔分钟数
     *
     * @param start
     * @param end
     * @return
     */
    public static long getMinuteInterval(Date start, Date end) {
        return getSecondInterval(start, end) / 60;
    }

    /**
     * 返回两个时间的间隔小时数
     *
     * @param start
     * @param end
     * @return
     */
    public static long getHourInterval(Date start, Date end) {
        return getMinuteInterval(start, end) / 60;
    }
}
