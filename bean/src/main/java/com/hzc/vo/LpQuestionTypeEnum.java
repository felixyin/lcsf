package com.hzc.vo;

/**
 * Created by yinbin on 2015/4/13.
 * <p/>
 * 用于区分李沧区干部法律法规学习测试系统  的  答题卡中的题型
 */
public enum LpQuestionTypeEnum {


    NULL("", ""), PAN_DUAN_TI("判断题", "10001"), DAN_XUAN_TI("单选题", "10002"), DUO_XUAN_TI("多选题", "10003");

    private String name = "";
    private String value = "";

    LpQuestionTypeEnum(String name, String value) {
        this.name = name;
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static LpQuestionTypeEnum get(String name) {
        LpQuestionTypeEnum[] values = LpQuestionTypeEnum.values();
        for (LpQuestionTypeEnum lqEnum : values) {
            if (lqEnum.getName().equals(name)) {
                return lqEnum;
            }
        }
        return NULL;
    }
}
