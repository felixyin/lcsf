package com.hzc.vo;

/**
 * Created by yinbin on 2015/4/13.
 */
public enum SystemEnum {
    HELP_STUDY(1), PUFA_LEXU(2), BAO_MING(3);

    private int value = 0;

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    SystemEnum(int i) {
        this.value = i;
    }

}
