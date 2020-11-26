package com.hzc.lcsf.manage.ctrl;

import com.hzc.lcsf.manage.util.alias.W;
import com.hzc.model.HisPaper;
import com.hzc.util.alias.S;
import com.hzc.vo.HisPaperItemVO;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by yue on 2015/7/24.
 */
public class LpExamCtrl {
    /**
     * 报表管理部分
     * <p>
     * 点击报表管理然后查看个人试卷的详细信息情况
     * <p>
     * 分页加载试题
     */
    public void getUserPaperInformation() {
        Integer currentNum = W.getInteger("currentNum");
        Integer pageSize = W.getInteger("pageSize");
        Integer userId = W.getInteger("userId");
        HisPaper paper = S.HisPaperItemService().getUserPaper(userId);    //根据userId找到考试的试卷

        List<HisPaperItemVO> list = S.HisPaperItemService().getUserPaperInformation(currentNum, pageSize, paper.getId());
        W.writeJsonArray(list);
    }

    /**
     * 跳转到人员的试卷信息列表
     */
    public void PeoplePaperList() {
        HttpServletRequest req = W.getReq();
        req.setAttribute("userId", W.getInteger("userId"));
        req.setAttribute("userName", W.getStringTrim("userName"));
        req.setAttribute("companyId", W.getInteger("companyId"));
        req.setAttribute("companyName", W.getStringTrim("companyName"));
        Integer userId = W.getInteger("userId");
        HisPaper paper = S.HisPaperItemService().getUserPaper(userId);    //根据userId找到考试的试卷

        String start_time = new SimpleDateFormat("yyyy-MM-dd").format(paper.getAnswerStartTime());
        req.setAttribute("start_time", start_time);
        String end_time = new SimpleDateFormat("yyyy-MM-dd").format(paper.getAnswerEndTime());
        req.setAttribute("end_time", end_time);
        Integer close_exam = Integer.parseInt(paper.getCloseExam().toString());
        if (close_exam == 1) {
            req.setAttribute("close_exam", "开卷");
        } else {
            req.setAttribute("close_exam", "闭卷");
        }
        W.forward("/WEB-INF/pages/management/people_paper.jsp");

    }
}
