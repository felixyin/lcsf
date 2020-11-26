package com.hzc.ctrl;

import com.hzc.model.LpCard;
import com.hzc.model.SysCompany;
import com.hzc.model.SysUser;
import com.hzc.util.HttpSessionUtil;
import com.hzc.util.alias.S;
import com.hzc.util.alias.W;
import com.hzc.vo.UserGradeVo;

import java.io.FileNotFoundException;
import java.util.List;

/**
 * Created by yinbin on 2015/6/1.
 */
public class ManageCtrl {


    /**
     * 报名列表
     */
    public void ajaxEnrollmentList() {
        SysUser sysUser = W.packBean(SysUser.class);
        sysUser.setCompanyId(HttpSessionUtil.getManageCompanyId());
        List<SysUser> enrollmentList = S.manageService().enrollmentList(sysUser);
        W.writeJsonArray(enrollmentList);
    }

    /**
     * 跳转到准考证查看列表
     */
    public void goToSignListJsp() {
        List<SysCompany> companys = S.sysCompanyService().listStandardCompanies();
//        SysCompany sysCompany = new SysCompany();
//        companys.add(0, sysCompany);
        W.getReq().setAttribute("companys", companys);
        W.forward("WEB-INF/pages/management/card_list.jsp");
    }

    /**
     * 准考证列表
     */
    public void ajaxCardList() {
        LpCard lpCard = W.packBean(LpCard.class);
        List<LpCard> lpCards = S.manageService().cardList(lpCard);
        W.writeJsonArray(lpCards);
    }

    /**
     * 考试成绩列表
     */
    public void ajaxGradeList() {
        LpCard lpCard = W.packBean(LpCard.class);
        List<UserGradeVo> userGradeVos = S.manageService().gradeList(lpCard);
        W.writeJsonArray(userGradeVos);
    }

    /**
     * 管理列表中查询用户图片的请求
     *
     * @throws FileNotFoundException
     */
    public void writeUserPhoto() throws FileNotFoundException {
        W.write(S.manageService().getUserPhotoIs(W.getInteger("id")));
    }
}
