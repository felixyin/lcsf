package com.hzc.vo;

import java.util.List;
import java.util.Map;

/**
 * Created by LiuJY on 2015/5/19.
 */
public class MoniQuestion {
    String name;
    List<Map<String,String>> val;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Map<String, String>> getVal() {
        return val;
    }

    public void setVal(List<Map<String, String>> val) {
        this.val = val;
    }
}
