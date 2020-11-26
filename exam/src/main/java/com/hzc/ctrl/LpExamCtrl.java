package com.hzc.ctrl;

import com.hzc.model.HisPaper;
import com.hzc.model.HisPaperItem;
import com.hzc.model.SysResource;
import com.hzc.model.SysUser;
import com.hzc.util.HttpSessionUtil;
import com.hzc.util.alias.S;
import com.hzc.util.alias.W;
import com.hzc.vo.AnswerCardVO;
import com.hzc.vo.QuestionVO;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

import static com.hzc.util.TimeUtil.*;

/**
 * Created by yinbin on 2015/5/27.
 * 用于考试模块
 */
public class LpExamCtrl {

    /**
     * 查询所的用于考试的题号
     */
    public void getCardQuestionListForTest() {
        Integer type = W.getInteger("type");//1、开卷，2、闭卷
        int userId = HttpSessionUtil.getUserId();
        List<AnswerCardVO> anserCardList = S.examService().loadCardList(userId, type);
        W.writeJsonArray(anserCardList);
    }

    /**
     * 返回用户试卷单个试题信息
     * <pre>
     *     包括：用户作答信息
     * </pre>
     */
    public void getQuestionDetail() {
        Integer questionId = W.getInteger("questionId");
        QuestionVO question = S.examService().loadQuestionDetail(questionId, HttpSessionUtil.getUserId());
        W.writeJsonObject(question);
    }

    /**
     * 保存考试信息
     */
    // Todo
    public void saveErrors() {
        String hisPaperStr = W.getString("hisPaperStr");
        String hisPaperItemsStr = W.getString("hisPaperItemsStr");
//        int userId = HttpSessionUtil.getUserId();
//        Integer cardId = HttpSessionUtil.getCardId();
//        S.examService().saveUserAnswer(hisPaperStr, hisPaperItemsStr, userId, cardId);
        W.writeJson(true, "");
    }

    /**
     * 检查是否在考试时间
     */
    public void ajaxCheckExamTime() {
        W.writeJson(checkExamTime(), "");
    }

    /**
     * 用户点击开始考试
     * <pre>
     *     检查开始考试时间是否已经开始
     *     开始考试，进入考试页面，
     *     未开始考试，则停留在原页面
     * </pre>
     */
    public void gotoExam() throws Exception {
        if (checkExamTime()) {
            W.forward("/WEB-INF/pages/exam/exam.jsp");
        } else {
            throw new Exception("非法操作");
        }
    }

    /**
     * 检查是否在考试时间
     *
     * @return
     */
    private boolean checkExamTime() {
        List<SysResource> resources = S.sysResourceService().getResources();
        Date date = new Date();
        boolean start = false;
        for (SysResource r : resources) {
            if (date.getTime() > r.getStartTime().getTime() && date.getTime() < r.getEndTime().getTime()) {
                start = true;
            }
        }
        start = true;
        return start;
    }

    /**
     * 保存用户考试答题信息
     */
    public void ajaxSaveUserAnswer() {
        Integer questionId = W.getInteger("questionId");
        String userAnswer = W.getStringTrim("userAnswer");
        if (StringUtils.isBlank(userAnswer)) {
            throw new IllegalArgumentException("hzc exception:argument is null");
        }
        int userId = HttpSessionUtil.getUserId();
        boolean b = S.examService().saveUserAnswer(userId, questionId, userAnswer);
        W.writeJson(b, "");
    }

    /**
     * 保存用户考试结果
     */
    public void saveExam() {
        int userId = HttpSessionUtil.getUserId();
        S.examService().saveExam(userId);
        showExamResult(userId);
    }

    /**
     * 显示考试结果
     */
    private void showExamResult(Integer userId) {
        HttpServletRequest req = W.getReq();

        HisPaper paper = S.examService().getPaperByUserId(userId);
        req.setAttribute("paper", paper);

        SysUser user = S.sysUserService().getUserById(userId);
        req.setAttribute("user", user);

        Date startTime = paper.getAnswerStartTime();
        Date endTime = paper.getAnswerEndTime();

        //作答时间
        Integer answerTime = getMinuteInterval(startTime, endTime);
        req.setAttribute("answerTime", answerTime);

        //交卷时间
        String o = getYearStr(endTime) + "年" + getMonthStr(endTime) + "月" + getDayStr(endTime) + "日&nbsp;&nbsp;&nbsp;" + getHourStr(endTime) + "时" + getMinuteStr(endTime) + "分";
        req.setAttribute("answerEndTime", o);

        //作对的试题数
        List<HisPaperItem> paperItems = S.examService().getCorrectQuestions(paper.getId());
        req.setAttribute("correctQuestions", paperItems.size());

        W.forward("/WEB-INF/pages/exam/result.jsp");
    }


}
