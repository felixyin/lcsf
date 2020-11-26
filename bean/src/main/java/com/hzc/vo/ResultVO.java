package com.hzc.vo;

import com.hzc.model.SysUser;

/**
 * 执行方法返回结果的VO
 * 如果执行成功，则code为true,否则为false
 * message为返回的执行结果的信息
 * <p/>
 * Created by LiuJY on 2015/3/25.
 */
public class ResultVO {

    private boolean code;
    private String message;

    private SysUser user;

    public SysUser getUser() {
        return user;
    }

    public void setUser(SysUser user) {
        this.user = user;
    }

    public boolean isCode() {
        return code;
    }

    public void setCode(boolean code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public ResultVO() {
    }

    public ResultVO(boolean code, String message) {
        this.code = code;
        this.message = message;
    }

    public ResultVO(boolean code, String message, SysUser user) {
        this.code = code;
        this.message = message;
        this.user = user;
    }
}
