package com.hzc.ctrl;

import com.hzc.util.alias.S;
import com.hzc.util.alias.W;

/**
 * Created by FelixYin on 2015/2/27.
 */
public class SysUserCtrl {

    /**
     * 青岛司法局 普法教育APP
     */
    public void loginForPufa() {
        String account = W.getString("username", "账号必填");

        int userId = S.sysUserService().loginForPufa(account);

        if (userId == 0) { //没有注册

            W.writeJson(false, "账号不存在，请先在电脑上注册！");
        } else {

            // 登录时计算一次用户的学时
            String usedTime = S.reportServcie().getUsedTime(userId);
            W.writeJson(true, usedTime);
        }
    }

}
