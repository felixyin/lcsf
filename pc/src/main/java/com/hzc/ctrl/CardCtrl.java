package com.hzc.ctrl;

import com.hzc.model.LpCard;
import com.hzc.model.SysCompany;
import com.hzc.model.SysConfig;
import com.hzc.util.HttpSessionUtil;
import com.hzc.util.alias.S;
import com.hzc.util.alias.W;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * 准考证相关方法
 * Created by LiuJY on 2015/6/9.
 */
public class CardCtrl {

    /**
     * 部门办事人员登录
     */
    public void login() throws IOException {
        Integer companyId = W.getInteger("companyId");
        String password = W.getString("password");
        if (StringUtils.isBlank(password) || companyId < 1) {
            throw new IllegalArgumentException("hzc exception: arguments are null");
        }
        HttpSessionUtil.setManageCompanyId(companyId);
        boolean b = S.lpCardService().checkPermission(companyId, password);
        String message = null;
        if (!b) {
            message = "密码不正确";
            W.getReq().setAttribute("message", message);
            // 返回登录页面
            W.forward("CommonCtrl.goWithCompanyJsp.do?path=/WEB-INF/pages/card/print_card.jsp");
        } else {
            SysConfig config = S.sysConfigService().get();
            W.getReq().setAttribute("config", config);
            // 转到闭卷考试人员选择页面
            W.forward("/WEB-INF/pages/card/select_card.jsp");
        }
    }

    /**
     * 批量生成准考证
     */
    public void createCard() throws Exception {
        HttpServletRequest req = W.getReq();
        String[] ids = req.getParameterValues("my-card");

        /*
         * 因为可能没有选择需要新添加的人员生成准考证，而在此之前已经生成了其他的准考证，所以默认为true
         */
        boolean isGenerateCard = true;

        if (ids != null && ids.length > 0) {
            Integer[] userIds = new Integer[ids.length];
            for (int i = 0; i < ids.length; i++) {
                userIds[i] = Integer.parseInt(ids[i]);
            }
            isGenerateCard = S.lpCardService().createCard(userIds);
        }

        req.setAttribute("result", isGenerateCard);

        if (isGenerateCard) {

            Integer manageCompanyId = HttpSessionUtil.getManageCompanyId();
            SysCompany company = S.sysCompanyService().getCompanyById(manageCompanyId);
            req.setAttribute("company", company.getName());
            List<SysCompany> companys = S.sysCompanyService().listStandardCompanies();
            req.setAttribute("companys", companys);
//            跳转到打印转考证之前的确认页面
            W.forward("CommonCtrl.goTo.do?path=/WEB-INF/pages/card/select_ok.jsp");

        } else {

            W.forward("CommonCtrl.goWithCompanyJsp.do?/WEB-INF/pages/card/select_card.jsp");
        }
    }

    /**
     * 跳转到打印准考证
     */
    public void printCard() {
//        id，为cardId
        Integer id = W.getInteger("id");
        if (id < 1) {
            throw new IllegalArgumentException("hzc Exception: argument is wrong");
        }
        LpCard card = S.lpCardService().getById(id);
        W.getReq().setAttribute("card", card);
        W.forward("/WEB-INF/pages/card/zhunkaozheng.jsp");
    }
}
